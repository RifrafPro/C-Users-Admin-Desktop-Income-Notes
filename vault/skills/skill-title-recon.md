# S4 — Pre-Offer Title Recon (agent: underwriter) — STAGE 2, before ANY offer

**Strategy (Fullmer):** 20 minutes of free county-records forensics before the offer.
"What you don't know will hurt you." Messy title = discount lever, not a dealbreaker.
**Source docs:** research/guides/distressed-property-secrets-logan-fullmer.md §Ch11

## Checklist (VA parcels: county land records + CPAN/court records; assessments via county GIS)
1. **Deed chain:** current owner of record · how acquired (sale/inheritance/quitclaim) ·
   how many owners in 60 yrs · any will-as-conveyance weirdness
2. **Liens/abstracts:** IRS, judgments, mechanics, child support, HOA, unreleased mortgages
3. **Open mortgages:** how many, when, in default?
4. **Death/probate clues:** owner deceased? probate filed? heirs? (obituary search)
5. **Court docket:** active suits touching the property or seller · bankruptcy history
6. **Tax status:** years delinquent, balance, tax-sale timeline risk

## Red flags → slow down (price them, don't run): bankruptcy estate · stacked liens ·
dead owner w/o probate · active lawsuit · old private seller-finance notes
## Output → Deal Record "Title" section: CLEAN / MESSY-PRICEABLE / RADIOACTIVE + est.
cure cost & time (legal budget norm: $10-26K on messy deals). Messy-priceable deals get
the OPTION-first structure (S7) and a bigger discount demand (S5).

## ✅ Fairfax County — working endpoints (verified 2026-10-03; save these, they were lost once)
- **Parcel geometry/PIN (no owner), open REST, no browser:**
  `https://www.fairfaxcounty.gov/mercator/rest/services/OpenData/OpenData_A9/MapServer/0/query`
  params: `where=PIN LIKE '0304 44%'` · `outFields=*` · `returnGeometry=false` · `f=json`.
  PIN strings are space-padded to fixed width, e.g. `0304 44      A` (6 spaces before a letter
  parcel) or `0304 44  0001` (2 spaces before a 4-digit lot). Use LIKE with a prefix to discover the exact string.
- **iCARE property record (owner, legal, deed book/page, utilities, site code), opens fine in Chrome:**
  `https://icare.fairfaxcounty.gov/ffxcare/datalets/datalet.aspx?mode=profileall&UseSearch=no&pin=<PIN url-encoded with the exact padding>`
  Other tabs: `mode=sales` (transfer history + deed refs), `mode=residential` (year built), `mode=values`.
  ⚠️ The iCARE search form does not submit under browser automation — go straight to the datalet URL.
- **Plat-age proxies when the plat image isn't online:** earliest transfer date on the parcel's PIN +
  year built of sibling lots in the same subdivision block.
