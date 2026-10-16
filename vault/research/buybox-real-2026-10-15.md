# REAL builder buy-box: from public sales + permit records (2026-10-15)

**Rich's ask:** "find the buyer/builder buy-box for that area that is REAL."
**Method (all free public data, pulled 2026-10-15):**
- **Arlington:** `datahub-v2.arlingtonva.us` SalesHistory (8,325 sales over $100K since 2023-10, with buyer names) + Property (zoning, lot size, year built) + Permit (80,196 permits since 2023-06; **585 "Residential New" single-family permits with the contractor's name**).
- **Fairfax:** open GIS Sales (41,306 sales > $300K since 2023-10) + Legal (address/ZIP/acres) + Dwelling (year built ≥ 2023, 5,146 new houses).
- **Teardown pattern** = an old house sold, a new house was built on the same parcel, and the new house resold for ≥ 1.6× the purchase price.
  The first price is what the builder actually paid for the lot. The second is what they sold it for.
- Scripts and raw pulls: session scratchpad `bb/` (not committed; re-runnable). Caveat: a purchase price includes the old house, but builders
  tore those down, so it IS their land price. [Certain about the data; Likely about the interpretation]

## 1. The number that changes our math: builders pay ~37% of the finished price for the lot
| Area | Teardowns (bought → built → resold) | Lot price paid (median, range) | New home (median) | **Land share (median, middle half)** |
|---|---|---|---|---|
| Vienna | 96 | **$900K** ($650K-1.4M) | $2.42M, 4,475 sf | **38%** (35-40%) |
| McLean | 72 | **$1.25M** ($985K-2.55M) | $3.23M, 5,356 sf | **37%** (35-42%) |
| Falls Church (Fairfax) | 49 | **$850K** ($450K-1.33M) | $2.29M, 4,685 sf | **37%** (34-41%) |
| Falls Church City | 17 | **$900K** ($525K-1.24M) | $2.25M, 4,545 sf | **38%** (34-43%) |
| Fairfax | 7 | $760K | $2.24M | 35% |
| Great Falls | 5 | $1.04M ($628K-2.25M) | $4.36M, 7,171 sf | 35% (30-35%) |
| Arlington North (R-6/R-10) | ~40 | **$0.9-1.35M** (MR, Classic, Prime, Sunnyside, Matthews…) | $2.2-3.6M | ~39-45% |
| **Arlington South R2-7 / R-5 (Monroe's zone)** | 5 | **$567K-730K** for ~5,000-5,250 sf | $1.21-1.51M | ~48-57% |
[Certain: computed from county records.] **The underwriter's 21-36% band is too low.** Real builders pay 35-40% of the finished price in NoVA.
Our MAOs have been too conservative. That's the safe direction, but it means we've been sizing offers that sellers turn down.

## 2. What this means for our live deals
- **2148 S Monroe (R2-7, 22204, ask $274K):** builders paid **$567K-730K** for buildable R2-7 lots within blocks of it in 2025-26:
  - 2022 S Monroe: $567K, 3SELS Properties LLC, Dec 2025
  - 2010 S Kenmore: $652K (built by Verity)
  - 2100 S Nelson: $730K, resold at $1.51M
  - 3515 19th St S: $609K, Lynn Homes LLC
  **If the lots are buildable once combined,** a fair builder price is roughly **$450-550K** after a corner/narrow-strip discount [Likely].
  That's about double the ask. **Everything rests on the zoning letter.** That explains the 9 price cuts and the dead contract. This is the call to make.
  **Verity Builders is building at 2145 S Monroe, directly across the street,** plus 2010 & 1955 S Kenmore and 2022 S Nelson. They're the #1 buyer for this lot.
- **9203 Potomac Ridge (Great Falls):** only 5 Great Falls teardowns resold. Lots there ran $628K-2.25M (median $1.04M) [Likely low sample].
  The $700K figure holds only if septic is approved.
- **Waples Mill (Oakton/Fairfax):** thin data (1-7 sales). Keep it as a long shot.

## 3. Who ACTUALLY builds (Arlington new single-family permits, mid-2023 → now)
| Rank | Builder (contractor of record) | New houses | Where | Their buying LLCs (from deeds) | Contact | On our old list? |
|---|---|---|---|---|---|---|
| 1 | **MR Project Management / M-R Custom Homes** | **85** | North Arlington R-6/R-10/R-20 | MR PROJECT MANAGEMENT INC (bought 37 properties; $875K-2.47M, median $1.15M) | (703) 314-4250 (Tammy Moore, Houzz) · 1408 N Fillmore St Ste 1 · mrcustomhomes.com | ❌ NEW |
| 2 | **BeaconCrest Homes** | **71** | Arlington-wide | Address-named LLCs (1922 N Van Buren LLC, 1800 N Quincy LLC, 817 Woodrow St LLC…) | 703-342-2020 · info@beaconcresthomes.com | ✅ |
| 3 | **Classic Cottages** | **59** (18 in South Arlington) | All Arlington | CLASSIC PARTNERS 8/9/10 LLC; paid $780K-1.39M | 703-256-1400 · form only | ✅ |
| 4 | **Enhanced Homes** (builds for **Prime Custom Homes LLC**) | **42** | North Arlington | PRIME CUSTOM HOMES LLC (19 buys, $850K-1.6M) | (571) 573-9000 · (703) 844-3358 · pm@enhanced-homes.com · 2205 S Shirlington Rd | ❌ NEW |
| 5 | Wormald Commercial Construction | 31 | North Arlington | "ASP ___ LLC" entities ($792K-948K) | Frederick MD (find) | ❌ NEW |
| 6 | **BCN Design Build / BCN Homes** | 24 | North Arlington | "___ Investment LLC" entities | bcnhomes.com · 4614 36th St N | ❌ NEW |
| 7 | **Verity Builders** | **20** (16 in South Arlington) | **South Arlington R2-7: S Monroe, S Kenmore, S Nelson** | 2145 S MONROE LLC, 2010 S KENMORE LLC, 1955 S KENMORE LLC, 5307 20TH LLC | verity-builders.com (Squarespace; no phone listed) · IG @veritybuilders · FB | ❌ NEW, **#1 for Monroe** |
| 8 | Sunnyside Development | 11 | 22205/22207 | SUNNYSIDE DEVELOPMENT LLC ($925K-1.06M) | 1400 N Buchanan St | ❌ NEW |
| 9 | **Old Creek Homes** | 10+4 | Arlington/Alexandria, incl. South | OCH AT ___ LLC | oldcreekhomes.com (Matthew Gray) | ❌ NEW |
| 10 | Bode Construction | 10 | North Arlington | BODE RESIDENTIAL 2 LLC ($804K-1.27M, 2025-26) | 2111 Wilson Blvd #1050 | ❌ NEW |
| — | Also active | | | Evergreene ($1.19-1.23M), Anchor Homes ($827K-1.18M), Elevation Homes, Matthews Investments/Romeros, McMullin/FMH, Focal Point, Troutman & Co, Old Dominion Classic, Paradigm (2 South) | | partly |
| — | **Paramount Construction** (our old "start here") | **5** | | | | ✅ but small in Arlington |
**Honest correction:** our old "start here" pick, Paramount, built only 5 Arlington houses in this window. MR, BeaconCrest, Classic Cottages
and Enhanced/Prime built 257 between them. **The website-built list missed 6 of the top 10 real buyers.** [Certain for Arlington]

## 4. Gaps (not done yet; say so plainly)
- **Fairfax builder NAMES:** Fairfax's open data has prices but no owner names. iCARE (which has them) was **down for maintenance** tonight.
  Fix: the courier pulls grantee names from iCARE for the ~240 resold teardowns, then ranks McLean/Vienna/Falls Church builders the same way.
- **Maryland (Bethesda/Potomac) + DC:** not pulled yet. MD SDAT and DC's tax office publish owner names, so the same method works. Next pass.
- Phone numbers for Verity, Wormald, Sunnyside and Bode are still missing. Verity: website form or Instagram DM, or ask the 2145 S Monroe site super.
