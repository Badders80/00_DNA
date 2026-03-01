# Vault Folder: Secret Management Standards

**Purpose:** Defines the standards, schemas, and verification logic for the Evolution Stables "One Vault" system. This folder contains the blueprints for how secrets are managed, without ever containing the secrets themselves.

**Key Rules:**
- **Master Vault:** The only source of truth for actual keys is `/home/evo/.env`.
- **Symlinking:** All projects must symlink to the master vault (`ln -s /home/evo/.env .env`).
- **No Commits:** `.env` files are hard-blocked by git hooks and `.gitignore`.
- **Validation:** Use `evo vault validate` to check if your environment matches the schema defined here.

**Contents:**
- `README.md`: This standard definition.
- `env.schema`: The canonical list of required keys.
- `env.template`: A safe, value-free template for new environments.

**Developer Standards:**
- **env.py Pattern:** Every Python project should include an `env.py` that validates the existence of required keys from the schema at startup.
- **Fail Loudly:** If a key is missing, the application must print a clear error and exit(1).

**Quick Commands:**
- `evo vault check`: Health check of all project symlinks.
- `evo vault edit`: Securely open the master vault.
- `evo vault validate`: Compare current vault against the schema.

**Navigation Tip:** For the human-friendly guide on how to rotate keys or add new services, see `_obsidian/🔐 Secrets Guide.md`.

**Last Updated:** 2026-03-01
