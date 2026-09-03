# Stale-Listing Sweep — 2026-08-28 (S10 / Inbox Job 001)

**Markets swept:** McLean · Vienna · Great Falls · Falls Church · Arlington · Oakton · Bethesda MD
**Sources:** Zillow (`/land/` + `/price-reduced/` per market) and Redfin (`/zipcode/NNNNN/filter/property-type=land`)
**Screens:** LAND 60+ DOM · HOUSES 100+ DOM · price-cut flagged · distress keywords (as-is, estate, TLC, fixer, teardown, investor)

## ⚠️ Method note — read before trusting the numbers
Rich's Chrome extension was **not connected** this session (no paired browser), so this sweep ran through a
web-scraping fallback, not his logged-in browser. Consequences:
- **No Land Insights overlay data** ($/acre, $/sqft, Market Score) — that extension only runs in Rich's browser.
  Every row below is missing it. Re-run in-browser to fill that column.
- Zillow list pages lazy-load: header counts (e.g. "McLean 30 listings") exceed what page 1 renders.
  This captured **page 1 per market** — deep pages not walked. Treat as a strong first pass, not exhaustive.
- **DOM differs by source.** Zillow "days on Zillow" counts across relistings; Redfin "Listed X days" counts the
  current listing only. Both are shown where they disagree (e.g. Chain Bridge: 662 Zillow / 301 Redfin).

---

## 🔥 A-RANK — the two real finds

### A-1 · 2754 Chain Bridge Rd, Vienna VA 22181 — $879,000 · 1.49 ac · R-2
> **CORRECTED 2026-09-03 — see `deals/2754-chain-bridge-rd-vienna-22181.md` for the real picture.**
> The "51% cut" below is **WRONG**: $1,795,000 was the price for BOTH lots; $795K/$879K are PER-LOT.
> Real movement is **~2% below the original ask**, and they RAISED it 10.6% off the Nov-2024 low.
> County record also contradicts the listing: **1.066 ac, not 1.49 ac** (a 40% overstatement), and
> the "two lots" are a subdivision of ONE parcel (PIN 0481 01 0017), not two parcels.
> Owner = **Filipour Amir John & Sharon V, Trustees**, living at 2764 Chain Bridge Rd. **Taxes are
> current — no distress.** Assessed $801K vs the $1,758,000 both-lots ask.
> **Downgraded A-1 → conditional.**

**This is the best lead in the sweep.**
- **DOM:** 301 (Redfin, current listing) / 662 (Zillow, across relistings)
- **Price history:** Listed **$1,795,000** (May 2024) → $1,595,000 (Aug 2024) → relisted $1,795,000 (Nov 2024)
  → **$795,000** (Nov 2024) → Contingent Mar 2025 → **relisted $879,000 (Mar 2026)**. Sold $245,000 (2000).
- **Net: down 51% from original ask, and a contract already died once.**
- **It's TWO lots.** Listing: "2 lots each approximately 3/4 acre of buildable **flat** land… **$879,000 FOR ONE
  LOT OR BOTH LOTS FOR $1,758,000**." Public electric/water/gas/sewer available.
- **Seller offers PARTIAL OWNER FINANCING** to qualified buyers — this is the headline. Owner financing on a
  51%-reduced, 300+ day listing is a seller telling you the terms are negotiable.
- Agent's own comp claim: "Vienna, where homes go for **over $3 million**."
- **Agent:** Bruce Goudarzi · Samson Properties · **703-378-8810** · MLS VAFX2209186
- URL: https://www.redfin.com/VA/Vienna/2754-Chain-Bridge-Rd-22181/home/162467394
- **Why it fits FRESH GROUND:** two finished-ish flat lots, all utilities, in a $3M+ finished-home market, from a
  seller who has cut 51%, lost a deal, and is dangling owner financing. Honest-lowball frame (S6) fits exactly.
- **NEXT:** title recon (why did the Mar-2025 contract die?) · confirm both lots are separately platted &
  buildable · Fairfax GIS on R-2 yield · then buyer-match to Vienna builders before making the offer.

### A-2 · 9338 Campbell Rd, Vienna VA 22182 — $995,000 · 6.76 ac · R-1
- **DOM:** 218 · **$147,189/acre**
- **Price history:** Listed **$3,000,000** (Apr 2024) → $2,500,000 (Aug 2024) → **$800,000** (Jul 2025)
  → **Pending Jul 2025 (fell through)** → $1,200,000 (Sep 2025) → **Pending Sep 2025 (fell through again)**
  → Listing removed Dec 2025 → relisted $1,100,000 (Jan 2026) → **$995,000 (Jun 2026)**. Sold $775,000 (2005).
- **Net: down 67% from original ask, with TWO contracts that died.**
- ⚠️ **Two failed contracts on a 6.76-acre R-1 parcel is a red flag, not just motivation.** Something surfaced in
  due diligence twice — perc/septic, access/frontage, easement, or floodplain. Do NOT offer before title + GIS.
- **Agent:** Christina Rice · Pearson Smith Realty · **571-386-1075** · MLS VAFX2286584
- URL: https://www.redfin.com/VA/Vienna/9338-Campbell-Rd-22182/home/162570663
- **Upside if it's clean:** 6.76 ac R-1 in 22182 at $995K is subdivision math, not single-lot math.
- **Structure:** option contract first, Fullmer-style. Nothing hard down before the GIS answer.

---

## 🅱️ B-RANK — stale, worth a call

| Address | Ask | Lot | DOM | Cut / history | Agent phone |
|---|---|---|---|---|---|
| **0 Linway Ter, McLean 22101** | $999,999 | 0.99 ac R-1 | **114** | $1,200,000 → $1,100,000 (6/5) → **$999,999 (8/10)**; went **Contingent 4/29, relisted 6/5 = deal died** | Michelle Doherty, RLAH @properties · **703-390-9460** |
| **4318 9th St S, Arlington 22204** | $1,695,000 | 0.77 ac | **691** | No cut in ~2 yrs — stubborn seller, but 691 days is 691 days | **540-347-5277** (Piedmont Fine Properties) |
| **2810 5th St S, Arlington 22204** | $975,000 | 9,229 sf | **464** | Samson Properties | — |
| **28th St S, Arlington 22202** | $950,000 | 0.29 ac | **934** | Longest-stale in Arlington | **703-328-3351** |
| **Madrillon Rd, Tysons/Vienna 22182** | $1,425,000 | 0.72 ac | **889** | Realty One Group Capital | **703-214-5100** |
| **Lot 2 Knolewood, McLean 22102** | $2,450,000 | 0.83 ac | **840** | Corcoran McEnearney | **703-790-9090** |
| **Lot 5 Knolewood, McLean 22102** | $2,500,000 | 0.83 ac | **791** | TTR Sotheby's | **703-319-3344** |
| **10221 Oakton Dr, Oakton 22124** | $1,700,000 | 1.35 ac | **111** | Samson Properties | **703-378-8810** (same agent as A-1) |
| **3203 W Ox Rd, Herndon 20171** (Oakton-adj.) | $695,000 | 0.67 ac | **186** | BHHS PenFed | — |
| **5719 Leesburg Pike, Falls Church 22041** | $2,750,000 | 0.58 ac | **182** | Arlington Realty | **703-836-6000** |
| **7314 Idylwood Rd, Falls Church 22043** | $1,100,000 | 0.42 ac | **63** | TTR Sotheby's | — |
| **10848 Patowmack Dr, Great Falls 22066** | $1,250,000 | 1.72 ac | **149** | Compass | **703-828-1778** |
| **9113 Jeffery Rd, Great Falls 22066** | $1,219,000 | 2.88 ac | **98** | Long & Foster | **703-790-1990** |
| **264 Golden Woods Ct, Great Falls 22066** | $1,850,000 | **8.57 ac** | — | **Price cut $149,900 (8/25)** — big acreage, actively cutting | Blue Heron Realty · **571-408-4241** |
| **6411 83rd Pl, Cabin John MD 20818** | $635,000 | 5,528 sf | **465** | Perennial Real Estate | — |
| **Anchorage Dr, Bethesda MD 20817** | $89,900 | 0.59 ac | — | Price cut $5,100 (8/21) — cheap; likely unbuildable, verify | Marathon Real Estate |
| **Blake Ln Service Rd, Fairfax 22031** | $25,000 | 9,600 sf | **872** | Cheapest dirt found; almost certainly a remnant/unbuildable outlot | **703-538-1113** |
| **1865 Old Reston Ave, Reston 20190** | $2,500,000 | 10,212 sf | **194** | Weichert | — |
| **1101 Finley Ln, Alexandria 22304** | $1,175,000 | 1.09 ac | **1,071** | Longest-stale land in the whole sweep | Middle Bay Realty |
| **4214 Pine Ln, Alexandria 22312** | $1,350,000 | 4.23 ac | **543** | SVN Providence | — |

## 🕵️ West McLean "undisclosed address" cluster (22102) — Job 002 item 3
Redfin lists **three** undisclosed-address land parcels in West McLean, all behind the same broker line
**(703) 564-4000** — reads as one seller / one small subdivision:
- **$1,925,000 · 0.96 ac** — https://www.redfin.com/VA/West-McLean/Undisclosed-address-22102/home/195068680 ← the one from the batch file
- **$2,000,000 · 1.21 ac** — .../home/195068796
- **$1,850,000 · 0.83 ac** — .../home/195068795

The address is **suppressed on both Redfin and Zillow** — it is not publicly scrapeable. Getting it means either
calling 703-564-4000 and asking, or matching the parcels in Fairfax GIS by acreage within 22102.
**Not resolved by scraping; needs a call or a GIS parcel match.**

---

## 🏚️ Price-cut houses (100+ DOM screen)
Zillow's `/price-reduced/` pages returned **~150 cut listings** across the seven markets. Honest read: nearly all
are **retail resales and builder new-construction trimming spec pricing** — not distress, and not FRESH GROUND
shaped. Zillow does not expose DOM on those cards, so the 100+ DOM screen **could not be applied to houses** from
the list view. **No house in the price-cut set carried an as-is / estate / TLC / fixer / teardown keyword** in its
card text. Largest cuts, for the record:

| Address | Ask | Cut | Note |
|---|---|---|---|
| 9112/9120 Mine Run Dr, Great Falls | $9,999,500 | **−$1,250,500 (8/24)** | Luxury, 14,000 sf |
| 1753 Army Navy Dr, Arlington 22202 | $2,450,000 | **−$500,000 (8/11)** | Biggest cut on a sub-$3M house |
| 9500 Georgetown Pike, Great Falls | $5,495,000 | −$500,000 (8/12) | Luxury resale |
| 1701 Briar Ridge Rd, McLean 22101 | $5,995,000 | −$300,000 (8/19) | |
| 2106 Bobbyber Dr, Vienna 22182 | $1,140,000 | −$109,000 (8/10) | −8.7%, smaller house — closest to a genuinely motivated seller |
| 2539 Washington Blvd, Arlington 22201 | $998,500 | −$96,500 (8/21) | −8.8% |

**Assessment:** the house side of this sweep produced nothing A-rank. The teardown / estate / probate flow the
skill is really after does **not** surface through Zillow's price-reduced filter — those sellers show up in the
tax and probate lists (S8 tax-list mining), not on-market. Recommend the house screen move there next cycle.

## ⚠️ False positive, flagged so it doesn't get re-chased
**1037 Springvale Rd, Great Falls 22066** shows a **−$3,000,888 price cut (8/20)** — the largest "cut" in the
entire sweep. **It is not distress.** Listed 8/14/2026 at $3,999,888 and corrected to $999,000 six days later: a
listing typo, not a motivated seller. Only 8 DOM. Sold $720,000 Feb 2025; has approved plans, permits and an
approved septic. At $999K / 1.75 ac with permits in Great Falls it is fairly priced, not a steal.
Agent Ali Farhadov, Compass, 703.989.3344. **Skip.**

---

## Recommended next actions
1. **Call 703-378-8810 (Bruce Goudarzi) on 2754 Chain Bridge.** Three questions: why the Mar-2025 contract died;
   are both lots separately platted and recorded; what the owner-financing terms actually are.
2. **Fairfax GIS on 9338 Campbell Rd before anything else** — two dead contracts means find the defect first.
3. Title recon on 0 Linway Ter (114 DOM + a dead contingency = the same question).
4. Re-run this sweep **inside Rich's browser** once the Chrome extension is connected, to attach Land Insights
   $/acre + Market Score to every row above and to walk Zillow pages 2+.
5. Move the house-side screen from Zillow price-cuts to the **tax/probate lists (S8)** — that is where the
   as-is / estate / TLC inventory actually lives.
