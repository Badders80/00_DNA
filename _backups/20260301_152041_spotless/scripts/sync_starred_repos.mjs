#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';

const USER = process.env.GITHUB_STARS_USER || 'Badders80';
const PER_PAGE = 100;
const TODAY = new Date().toISOString().slice(0, 10);

const root = process.cwd();
const jsonPath = path.join(root, 'skills', 'starred_repo_registry.json');
const mdPath = path.join(root, 'skills', 'starred_repo_registry.md');

const statusRank = {
  Adopt: 0,
  Trial: 1,
  Assess: 2,
  Reject: 3,
  Archive: 4,
};

function readExistingRegistry() {
  if (!fs.existsSync(jsonPath)) {
    return { source_user: USER, generated_at: null, lastSynced: null, repos: [] };
  }
  const raw = fs.readFileSync(jsonPath, 'utf8');
  const parsed = JSON.parse(raw);
  if (!Array.isArray(parsed.repos)) parsed.repos = [];
  return parsed;
}

async function fetchAllStarred(user) {
  const token = process.env.GITHUB_TOKEN;
  const headers = {
    'User-Agent': 'evolution-stables-sync',
    Accept: 'application/vnd.github+json',
  };
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }

  let page = 1;
  let allRepos = [];

  while (true) {
    const response = await fetch(
      `https://api.github.com/users/${encodeURIComponent(user)}/starred?per_page=${PER_PAGE}&page=${page}`,
      { headers }
    );

    if (!response.ok) {
      throw new Error(`GitHub API failed (${response.status}) on page ${page}`);
    }

    const data = await response.json();
    if (!Array.isArray(data) || !data.length) break;

    allRepos = allRepos.concat(data);
    page += 1;
  }

  return allRepos;
}

function categorize(fullName) {
  const n = fullName.toLowerCase();
  if (/n8n/.test(n)) return 'automation';
  if (/antfarm|openclaw|claude|agent|hooks|rowboat/.test(n)) return 'agents';
  if (/unsloth|models|gemini|kimi|llm/.test(n)) return 'local-llm';
  if (/(^|[-_/])(ui|ux)($|[-_/])|design|frontend/.test(n)) return 'ui-ux';
  if (/security|rogue|owasp/.test(n)) return 'security';
  return 'general';
}

function mergeRepos(existing, fetched) {
  const byName = new Map(existing.repos.map((r) => [r.full_name, r]));
  const fetchedNames = new Set();
  const newlyAdded = [];

  const merged = fetched.map((repo) => {
    fetchedNames.add(repo.full_name);
    const prev = byName.get(repo.full_name);

    const base = {
      full_name: repo.full_name,
      html_url: repo.html_url,
      description: repo.description || '',
      language: repo.language || '',
      stars: repo.stargazers_count,
      last_pushed: repo.pushed_at ? repo.pushed_at.slice(0, 10) : '',
      archived: Boolean(repo.archived),
      license: repo.license?.spdx_id || '',
      starred: true,
      last_seen: TODAY,
    };

    if (!prev) {
      const created = {
        ...base,
        first_seen: TODAY,
        status: 'Assess',
        category: categorize(repo.full_name),
        rationale: '',
        last_reviewed: '',
        notes: 'Auto-added from GitHub stars sync; pending review.',
      };
      newlyAdded.push(created.full_name);
      return created;
    }

    return {
      ...prev,
      ...base,
      first_seen: prev.first_seen || TODAY,
      status: prev.status || prev.radar_status || 'Assess',
      category: prev.category || categorize(repo.full_name),
      rationale: prev.rationale || '',
      last_reviewed: prev.last_reviewed || '',
      notes: prev.notes || '',
    };
  });

  for (const prev of existing.repos) {
    if (!fetchedNames.has(prev.full_name)) {
      merged.push({
        ...prev,
        starred: false,
      });
    }
  }

  merged.sort((a, b) => {
    const aStatus = a.status || a.radar_status;
    const bStatus = b.status || b.radar_status;
    const statusDelta = (statusRank[aStatus] ?? 99) - (statusRank[bStatus] ?? 99);
    if (statusDelta !== 0) return statusDelta;
    if (a.starred !== b.starred) return a.starred ? -1 : 1;
    return (b.stars || 0) - (a.stars || 0);
  });

  return { merged, newlyAdded };
}

function writeRegistryJSON(user, repos, lastSynced) {
  const payload = {
    source_user: user,
    generated_at: lastSynced,
    lastSynced,
    repos,
  };
  fs.writeFileSync(jsonPath, `${JSON.stringify(payload, null, 2)}\n`, 'utf8');
}

function esc(text) {
  return String(text || '').replace(/\|/g, '\\|').replace(/\n/g, ' ');
}

function writeRegistryMarkdown(user, repos, newlyAdded, generatedAt) {
  const lines = [];
  lines.push('# Starred Repo Registry');
  lines.push('');
  lines.push('Auto-generated from GitHub stars via `scripts/sync_starred_repos.mjs`.');
  lines.push('Source user: `' + user + '`');
  lines.push(`Generated: ${generatedAt}`);
  lines.push('');
  lines.push('## Policy');
  lines.push('- New repos discovered via star sync are defaulted to `Assess`.');
  lines.push('- Keep status changes manual after review (`Assess` -> `Trial` -> `Adopt`/`Reject`).');
  lines.push('- `starred=false` entries are retained as historical context.');
  lines.push('');

  if (newlyAdded.length > 0) {
    lines.push('## Newly Added This Sync (Auto `Assess`)');
    for (const name of newlyAdded.sort()) {
      lines.push(`- ${name}`);
    }
    lines.push('');
  }

  lines.push('## Registry');
  lines.push('| Repo | Status | Category | Stars | Pushed | Starred | Notes |');
  lines.push('|------|--------|----------|------:|--------|---------|-------|');
  for (const r of repos) {
    const status = r.status || r.radar_status || 'Assess';
    lines.push(`| [${esc(r.full_name)}](${r.html_url}) | ${esc(status)} | ${esc(r.category)} | ${r.stars ?? ''} | ${esc(r.last_pushed)} | ${r.starred ? 'yes' : 'no'} | ${esc(r.notes)} |`);
  }
  lines.push('');
  fs.writeFileSync(mdPath, `${lines.join('\n')}\n`, 'utf8');
}

async function main() {
  const existing = readExistingRegistry();
  const allRepos = await fetchAllStarred(USER);
  const { merged, newlyAdded } = mergeRepos(existing, allRepos);

  const timestamp = new Date().toISOString();
  writeRegistryJSON(USER, merged, timestamp);
  writeRegistryMarkdown(USER, merged, newlyAdded, timestamp);

  console.log(`Sync complete: ${allRepos.length} repos fetched at ${timestamp}`);
  console.log(`Registry entries total: ${merged.length}. Newly added: ${newlyAdded.length}.`);
}

main().catch((err) => {
  console.error(err.message || err);
  process.exit(1);
});
