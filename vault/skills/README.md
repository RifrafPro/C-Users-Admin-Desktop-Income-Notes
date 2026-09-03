# FRESH GROUND Skills Library — strategy → skill → agent

Each strategy is packaged as a SKILL FILE an agent loads when doing that job.
Agents read their assigned skills at task start (each skill lists its source docs).

## Skill → Agent assignment
| # | Skill file | Owner agent | Strategy it packages |
|---|---|---|---|
| S1 | `skill-buybox-capture.md` | **buyer-matcher** | Buyer-first: capture builder buy-boxes BEFORE sourcing |
| S2 | `skill-tax-list-mining.md` | **lead-intake** | Fullmer: delinquent-tax-list lead channel (free, off-radar) |
| S3 | `skill-inbound-lead-triage.md` | **lead-intake** | iSpeedToLead + inbound leads → Deal Records |
| S4 | `skill-title-recon.md` | **underwriter** | Fullmer: pre-offer title forensics (20-min county recon) |
| S5 | `skill-desktop-valuation.md` | **underwriter** | As-is/land-residual valuation from the desk; MAO math |
| S6 | `skill-seller-negotiation.md` | **seller-negotiator** | Scripts + Fullmer conversation rules + MAO carve-out |
| S7 | `skill-deal-structuring.md` | **seller-negotiator** (drafts) + **deal-orchestrator** (routing) | Options-first, PSA, heir silos, deferred payoffs |
| S8 | `skill-disposition-control.md` | **disposition** | Control-Before-Disclosure: blind teaser → NCND → assignment; MLS fallback |
| S9 | `skill-escrow-handoff.md` | **deal-orchestrator** | Title company handoff (Eastern Title) + closing checklist |
| S10 | `skill-stale-listing-sweep.md` | **lead-intake** | On-market stale/price-cut sweep (Redfin+Zillow), low-hanging fruit |
| S11 | `skill-propwire-mining.md` | **lead-intake** (sources) + **underwriter** (comps) | OFF-market mining: teardown-owner stacks, 105 MLS keywords, free comps + skip trace |

## Pipeline map (which skill fires at which stage)
```
STAGE 0  Buy-box capture (S1, buyer-matcher)          ← runs CONTINUOUSLY, feeds everything
STAGE 1  Lead generation (S2 tax lists + S3 inbound + S10 on-market stale
         + S11 OFF-market Propwire stacks, lead-intake) → Deal Record
STAGE 2  Title recon (S4, underwriter)                 ← BEFORE any offer
STAGE 3  Valuation + MAO (S5, underwriter)             → GO/NO-GO + max offer
STAGE 4  Buyer match check (S1 data, buyer-matcher)    → confirm a real buyer exists at these numbers
STAGE 5  Seller negotiation (S6+S7, seller-negotiator) → option/PSA signed  [🔒 send-gate: Rich]
STAGE 6  Disposition (S8, disposition)                 → blind teaser → NCND → assignment [🔒 send-gate]
STAGE 7  Escrow + close (S9, deal-orchestrator)        → Eastern Title, fee collected
```

## Standing rules (bind EVERY skill)
- Agents research/compute/DRAFT autonomously. **No send/call/text/blast to a real person
  without Rich's "send it"** (exception: Carve-out #1 once voice pipeline is live —
  see vault/policies-ai-autonomy.md).
- Control-Before-Disclosure: no address to any buyer until PSA-signed or NCND.
- MAO is a hard ceiling. Walk-away discipline ("the best deal I ever did was the one I didn't do").
- Every skill updates the Deal Record (vault/deals/) so state survives sessions.
