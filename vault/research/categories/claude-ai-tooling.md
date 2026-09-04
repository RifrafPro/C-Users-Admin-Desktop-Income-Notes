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
| OmniRoute (github, from "Omniroute" reels, 2 saves) | Gateway routing Claude Code through 350 providers/90 free tiers + token compression | 🔴 **SKIP — verdict CONFIRMED on re-check 09-03** (Rich re-sent the repo). Original inspection 08-29 stands. See the detailed entry below before inspecting a third time |
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

---

## 🔴 OmniRoute — SKIP. Verdict confirmed twice. Do not inspect a third time without a trigger below.

`github.com/diegosouzapw/OmniRoute` · omniroute.online
**Inspected 08-29 (cloud Claude) → skip. Re-sent by Rich 09-03 → re-checked → same verdict, sharper reasoning.**

### Safety: CLEAN. This is not a malware question.
Install-safety protocol run per `policies-software-install-safety.md`:
**`fork: false`**, no parent — the original repo. **60,904 stars · 8,462 forks · MIT · pushed 2026-09-04
· not archived · 298 open issues · created 2026-02-13.** Legitimate, popular, actively maintained.
**The skip is about FIT and DATA EXPOSURE, not trustworthiness of the code.**

### Why we skip — three reasons, all still true
1. **It solves a bill we don't have.** The entire value proposition is routing to cheaper/free
   providers to cut **per-token API costs**. Rich is on a **flat-rate plan** — there is no per-token
   bill to reduce. **Savings: $0.**
2. 🚩 **Data exposure — the strongest reason, and stronger than first recorded.** Its own
   `SECURITY.md` is good on *local* handling (AES-256-GCM at rest, PII detection/masking,
   prompt-injection screening) but states plainly:
   > *"The policy does not explicitly address trust relationships with third-party providers or
   > assert what happens to data once transmitted upstream."*
   > *"No explicit privacy policy or data deletion guarantees for provider-forwarded information."*
   - **Guardrails run FAIL-OPEN** — "exceptions never block traffic." If the PII masker errors,
     data forwards **unmasked**.
   - Its own docs flag **13 providers as "avoid."**
   - **Why this matters for us specifically:** the vault now holds **named trustees and their
     mailing address** (Filipour, 2754 Chain Bridge), seller motivations, deal economics, draft
     contracts, builder buy-boxes and our strategy. Routing that through 350 providers — many free
     tiers that train on inputs — with **no deletion guarantee** is a live exposure. The software is
     fine; **the upstream providers are the unknown.**
3. **Quality downgrade.** Free-tier fallback routes to weaker models. We are optimising for judgment
   on six-figure decisions, not for cheap tokens.

### ⏳ Two triggers that WOULD flip this to "evaluate"
1. **We start paying per-token API bills.** Most likely at the **voice pipeline** (Bland / Vapi /
   Retell — see `automation-stack.md` Hole 1), which bills per minute/call. **Different risk profile:
   that traffic is seller-call audio, not vault data.** Worth a genuine fresh look at that point.
2. **We repeatedly hit plan usage limits mid-deal.** Its **quota-aware auto-fallback** is real
   break-glass value — but as a fallback path, never as the daily router, and never carrying vault data.

### Standing rule
**Do not route vault data through any third-party gateway.** If OmniRoute is ever adopted under
trigger #1, scope it to the specific paid workload only and keep the vault out of it entirely.
