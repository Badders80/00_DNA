# Evolution Stables - Faceless TikTok Strategy

**Version:** 1.0  
**Date:** 2026-02-17  
**Status:** Ready to Implement

---

## 🎯 Strategy Overview

**Goal**: Build awareness and drive sophisticated investor signups through faceless TikTok content

**Approach**: Data-driven racing intelligence + fintech transparency narrative

**Content Pillars**:
1. **Racing Intelligence** (40%) - Bloomberg-style analysis
2. **Platform Education** (30%) - How tokenization works
3. **Success Stories** (20%) - ROI data, case studies
4. **Behind the Scenes** (10%) - Technology, team, process

---

## 📱 Content Formats

### 1. "Racehorse ROI" Series (High Performer)
**Format**: 15-30 seconds
**Structure**:
- **0-3s Hook**: "This racehorse returned 340% to investors..."
- **3-10s Setup**: Show horse, race footage, purchase price
- **10-20s Data**: Prize money, breeding value, token appreciation
- **20-30s CTA**: "Link in bio to see current opportunities"

**Visual Style**:
- Split screen: Racing footage + data charts
- Animated numbers counting up
- Professional color scheme (Navy #0A2540, Teal #00D4AA)
- Clean typography (Inter font)

**Audio**:
- Trending sounds (sped up 1.2x)
- OR text-to-speech (professional voice)
- No music during data explanation

### 2. "Tokenization Explained" Series
**Format**: 30-45 seconds
**Structure**:
- **0-3s Hook**: "Own 5% of a racehorse for $2,500"
- **3-15s Problem**: Traditional syndicates lock capital
- **15-30s Solution**: Show tokenization process animation
- **30-45s Proof**: FMA regulation, Dubai partnership

**Visual Style**:
- Motion graphics (not stock footage)
- Blockchain visualization (simplified)
- Platform UI screen recordings
- Trust badges (FMA logo, etc.)

### 3. "Market Intelligence" Series
**Format**: 20-30 seconds
**Structure**:
- **0-3s Hook**: "3YO filly just dropped 0.02s in barrier trials"
- **3-15s Analysis**: Form guide, pedigree, trainer comments
- **15-25s Prediction**: Implied probability, market movement
- **25-30s CTA**: "Full analysis on platform"

**Visual Style**:
- Racing form overlays
- Speed charts, sectional times
- Pedigree trees
- Professional, Bloomberg-terminal aesthetic

### 4. "Weekly Wrap" Series
**Format**: 60 seconds
**Structure**:
- **0-5s Intro**: "This week in Evolution Stables"
- **5-30s Wins**: Race results, ROI updates
- **30-45s Pipeline**: New horses, upcoming races
- **45-60s CTA**: Platform updates, newsletter

---

## 🛠️ Production Workflow

### Option A: ComfyUI + CapCut (Recommended)

**Step 1: Script Generation** (Kimi/OpenClaw)
```bash
# Use Evolution Stables agent
kimi --agent-file ~/.kimi/agents/evolution-stables.json \
  --prompt "Write a 30-second TikTok script about [TOPIC]. Follow brand voice guidelines."
```

**Step 2: Visual Generation** (ComfyUI)
- **Tool**: Wan 2.1 or LTX-Video for motion
- **Style**: Professional, data-forward
- **Resolution**: 1080x1920 (9:16 vertical)
- **FPS**: 30fps for smooth playback

**Step 3: Voiceover** (ElevenLabs or similar)
- Voice: Professional, mature (30-50 sounding)
- Pace: Measured, not hype-y
- Script: Follow brand voice exactly

**Step 4: Editing** (CapCut/Desktop)
- Add captions (large, readable)
- Include data visualizations
- End card with CTA
- Export: H.264, 1080p, 30fps

**Step 5: Publishing** (Manual or Later/Buffer)
- Post: 7-9 AM or 7-9 PM NZ time
- Caption: Include keywords, 3-5 hashtags
- Pin comment with platform link

### Option B: AI-Generated Full Pipeline (Experimental)

**Tools**:
- **Script**: Kimi with Evolution Stables agent
- **Visuals**: ComfyUI + Wan 2.1 video generation
- **Voice**: ElevenLabs API
- **Editing**: Automated via ffmpeg/python

**Workflow**:
1. Input topic → Kimi generates full script + shot list
2. ComfyUI generates video segments per shot list
3. ElevenLabs generates voiceover
4. Python script assembles final video
5. Upload to TikTok via API (or manual)

---

## 📊 Content Calendar (Weekly)

| Day | Content Type | Format | Goal |
|-----|--------------|--------|------|
| Monday | Racing Intelligence | 30s | Engagement |
| Tuesday | Platform Education | 45s | Education |
| Wednesday | Success Story | 30s | Social Proof |
| Thursday | Market Intelligence | 25s | Authority |
| Friday | Weekly Wrap | 60s | Retention |
| Saturday | Racing Day Live | Stories | Real-time |
| Sunday | Behind the Scenes | 30s | Humanize |

---

## 🎨 Visual Guidelines

### Color Palette
```
Primary:   #0A2540 (Navy - Trust, institutional)
Secondary: #1A1A2E (Dark - Professional)
Accent:    #00D4AA (Teal - Racing energy, growth)
Success:   #10B981 (Green - Positive ROI)
Warning:   #F59E0B (Amber - Caution/data)
Text:      #FFFFFF (White on dark)
Text Muted:#94A3B8 (Gray - Secondary info)
```

### Typography
- **Primary**: Inter Bold (headlines, numbers)
- **Secondary**: Inter Medium (body, captions)
- **Data**: Inter Regular (charts, tables)
- **Size**: Minimum 48px for mobile readability

### Motion Style
- **Easing**: Ease-out for data reveals
- **Duration**: 0.3s transitions
- **Effects**: Subtle glow on accent elements
- **No**: Flashing, rapid cuts, dizzying motion

---

## 🔗 Call-to-Action Strategy

### Primary CTA (Always Include)
- "Link in bio to see current opportunities"
- "Join the waitlist - link in bio"
- "See full analysis on our platform"

### Secondary CTA (Rotate)
- "Follow for weekly racing intelligence"
- "Save this for your next investment decision"
- "Share with someone interested in alternative investments"

### Link in Bio
- Landing page: High-conversion, mobile-optimized
- Collect: Email for newsletter
- Track: UTM parameters for attribution

---

## 📈 Success Metrics

### Vanity Metrics (Track but Don't Chase)
- Views per video
- Follower growth
- Likes/comments/shares

### Business Metrics (Focus Here)
- Click-through rate to platform
- Email signups from TikTok
- Qualified investor inquiries
- Token purchases attributed to TikTok

### Content Performance
- Watch time % (target: >50%)
- Share rate (target: >2%)
- Comment sentiment (target: >80% positive/curious)

---

## ⚠️ Compliance & Risk

### FMA Compliance
- ✅ Never promise specific returns
- ✅ Always include "past performance" disclaimer
- ✅ Clear that investments carry risk
- ✅ Don't make it look like gambling

### Platform Rules
- ✅ No misleading thumbnails
- ✅ Accurate data only
- ✅ Respect copyright (racing footage)
- ✅ No spam hashtags

### Brand Safety
- ✅ Professional tone always
- ✅ No hype language
- ✅ No crypto-bro aesthetic
- ✅ No targeting minors

---

## 🚀 Quick Start (Do This Today)

1. **Set up ComfyUI for vertical video**:
   ```bash
   cd /home/evo/projects/ComfyUI
   # Create 1080x1920 workflow
   ```

2. **Create first script**:
   ```bash
   kimi --agent-file ~/.kimi/agents/evolution-stables.json \
     --prompt "Write a 30-second TikTok script about 'How racehorse tokenization works'. Include hook, 3 key points, and CTA."
   ```

3. **Generate test video**:
   - Use ComfyUI with Wan 2.1
   - 1080x1920 resolution
   - Professional style

4. **Post and measure**:
   - Upload to TikTok
   - Track views and link clicks
   - Iterate based on data

---

## 🛠️ Tools & Resources

### Video Generation
- **ComfyUI**: Local, private, full control
- **Models**: Wan 2.1, LTX-Video, AnimateDiff
- **Workflows**: Stored in /home/evo/projects/ComfyUI_Workflows_fresh

### Voice Generation
- **ElevenLabs**: Professional voices
- **Alternative**: Azure TTS, Amazon Polly

### Editing
- **CapCut**: Free, powerful, templates
- **DaVinci Resolve**: Professional (free)
- **ffmpeg**: Automated/scripted

### Analytics
- **TikTok Analytics**: Native insights
- **UTM Builder**: Track link clicks
- **Google Analytics**: Landing page tracking

---

## 📚 Related DNA Documents

- `brand-identity/BRAND_VOICE.md` - Voice guidelines
- `build-philosophy/Master_Config_2026.md` - Hardware setup
- `workflows/STANDARD_WORKFLOWS.md` - General operations
- `system-prompts/PROMPT_LIBRARY.md` - AI agent configs

---

**Next Steps**:
1. Review and approve strategy
2. Set up ComfyUI vertical video workflow
3. Generate first 5 scripts
4. Create content calendar
5. Start posting 3x/week

**Questions to Answer**:
- Do you have existing racing footage/photos?
- What's your target posting frequency?
- Do you want to automate or keep manual?
- Should we integrate with your newsletter/email system?
