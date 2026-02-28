# Brand Identity

**Source of truth for all brand standards.**

## Structure

| File/Folder | Purpose |
|-------------|---------|
| `BRAND_VOICE.md` | Voice & tone guidelines |
| `Branding.md` | Q7 layer institutional voice |
| `MESSAGING_CHEAT_SHEET.md` | Quick messaging reference |
| `TYPOGRAPHY_SYSTEM.md` | Fonts, sizes, hierarchy |
| `Evolution_Content_Factory.md` | Content Factory brand guidelines |
| `visual/` | Visual assets (logos, colors) |
| `Brand_Voice_System/` | **Detailed brand voice architecture** |
|   ├── `00_kernel/` | Core brand values |
|   ├── `01_modules/` | Brand modules |
|   └── `02_logic/` | Brand logic/rules |

## Principle

Brand standards live in DNA, not in projects.  
Projects reference these standards. They don't define them.

## Usage

Content projects (Evolution_Content, Evolution_Studio) should reference:
- `BRAND_VOICE.md` for tone
- `Brand_Voice_System/` for detailed logic
- `visual/` for assets

Never hardcode brand rules in project code. Always reference DNA.
