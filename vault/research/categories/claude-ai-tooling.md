# Claude / AI Tooling

Most of this category is ALREADY BUILT in this vault (memory, agents, hooks, skills).
Check here before installing anything new — usually we have it.

## Saved guides (full copies in ../guides/)
- **the-4-plugs-mcp-install.md** — THE "4 plugins" doc (Perplexity, Firecrawl, Playwright,
  Context7). Status: Firecrawl ✅ connected (claude.ai connector) · Playwright = local-only
  (cloud container has Chromium already) · **Perplexity ❌ not installed (paid, ~$5 credit)** ·
  **Context7 ❌ not installed (FREE key — easy win for Rich's local Claude Code)**
- **ai-agent-basics.md** — beginner agent guide; our agency (.claude/agents/) is already
  years beyond it. Archived for reference.

## Notable links
| Item | What | Verdict |
|---|---|---|
| hermes-gbrain-bridge (github, from "Hermies Jarvis" reel) | Converts agent chat logs to markdown for gBrain (separate DB+cloud project) = searchable AI-conversation brain | 🔴 INSPECTED 08-29, skip: the vault already does this; would add Postgres+Railway for a worse duplicate |
| OmniRoute (github, from "Omniroute" reels, 2 saves) | Gateway routing Claude Code through 350 providers/90 free tiers + token compression | 🔴 INSPECTED 08-29, skip: built for per-token API bills — saves $0 on Max flat-rate; routes business data through dozens of 3rd parties (13 flagged "avoid" by its own docs); downgrades model quality |
| github.com/open-free-llm-api/awesome-freellm-apis | Free LLM API list (real repo) | 🟡 |
| "Claude vault" FB post (07-26) | The vault-concept inspiration | ✅ built (this repo) |
| Jarvis cluster (install-guide YouTube, Zoey OS, Hermies, etc.) | Personal-assistant builds | 🟡 vault = our Jarvis |
| Obsidian skills / Claude+Obsidian (multiple) | Obsidian knowledge-base setups | 🟡 vault plays this role |
| skool.com/full-stack-ai-marketing ("Control claude from my phone") | Community | 🟡 claude.ai mobile app already does this |
| ⚠️ ai.mydeepchat.com "Claude 5.0" (2 sends) | NOT Anthropic — knockoff app funnel | 🔴 skip |
| "15000 claude skills" (shop.app checkout) · skills bundles · 181/147/70 skills reels | Skill packs | 🟡 free skill marketplaces exist; don't buy packs |
| Huge reel queue (~55 items) | Claude tips reels | 📹 see research-email-findings.md queue |

---

## ✅ book-to-skill — INSTALLED 2026-09-03 (free, MIT)

Turns a book/document (PDF, EPUB, DOCX, HTML, MD, TXT, RTF; MOBI/AZW w/ Calibre) into a **structured
agent skill** — frameworks, decision rules, anti-patterns, per-chapter files. Not a summary; structure.
Processing is **local** (files aren't uploaded by the tool). Claims 24×–51× fewer tokens than dumping a
book into context. Registers as **`/book-to-skill`**.

- **Official repo (verified):** `github.com/virgiliojr94/book-to-skill` — 28,198★, MIT, `"fork": false`
  confirmed via GitHub API. Installed to `C:\Users\Admin\.claude\skills\book-to-skill`.
- **Extractors ready:** PDF (text-heavy) ✓ · EPUB ✓ · DOCX ✓ · HTML ✓ · RTF ✓
  *(installed ebooklib, python-docx, striprtf, trafilatura on 09-03)*
- **Not installed, by choice:** `docling` (only for `--mode technical` — tables/code/formulas; heavy
  ML install, unnecessary for prose books) · **Calibre** (only for Kindle MOBI/AZW; full desktop app).
  Install either only if a specific file needs it.

### 🚨 SECURITY — a malicious clone of this tool exists. Verify before installing anything like it.
The project ships a `SECURITY-NOTICE.md` (dated 2026-08-17) documenting that
**`Leutenegger/book-to-skill` is a malicious re-upload**, not affiliated with the project. The
maintainer's review found it: disables TLS verification · sends host/system/repo metadata to an
external Cloudflare Worker · **enumerates crypto-wallet browser-extension storage and Ledger data** ·
archives and uploads local data on macOS · **ships a Windows ZIP/EXE payload the CLI can auto-extract
and launch.** Tracking: issue #174 on the official repo.

⚠️ **Near-miss worth remembering: a plain web search for "book-to-skill" returned the MALICIOUS repo
as the top result.** What saved us was checking the GitHub API (`fork: false`, no parent) instead of
trusting search ranking. **Standing rule going forward: before installing any repo, verify provenance
via `api.github.com/repos/<owner>/<name>` — check `fork`, `parent`, `stargazers_count`, `created_at`
— and read any SECURITY*.md in the repo. Never install from a search result alone.**

### How to use
`/book-to-skill <path-to-file-or-folder-or-glob> [skill-name-slug]` — it asks whether the source is
*technical* or *text-heavy* and picks the extractor. Scanned/image-only PDFs need OCR first
(`ocrmypdf in.pdf out.pdf`). Generated skills land in the skills folder and load on demand.

**Copyright:** the project's own guidance — use your own copy, output is synthesised notes not
reproduction, and **keep skills of third-party books private, don't redistribute.** Our vault is a
private repo, which fits; just never publish a generated skill of a purchased book.

### Candidate first targets for FRESH GROUND
- The **10 FRESH GROUND script PDFs** (source PDFs live in Drive per `projects/fresh-ground-scripts.md`)
  → fold the whole folder into one queryable playbook skill.
- Any owned real-estate books (wholesaling, land development, entitlements) — **entitlement/subdivision
  material would be immediately useful given the 2754 Chain Bridge subdivision problem.**
- `vault/research/guides/` itself — already-extracted guides could be folded into a single skill.
