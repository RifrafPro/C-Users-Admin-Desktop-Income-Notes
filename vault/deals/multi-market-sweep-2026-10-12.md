# Multi-Market Motivated-Seller Sweep — 2026-10-12 (Inbox Job 004)

**Status:** COMPLETE (first pass). 40 hits: DC 13 · S. Florida 15 · Phoenix 12. Not committed or pushed (desktop job instruction).
**Markets:** Washington DC (District) · South Florida (Miami-Dade/Broward/Palm Beach, SFH only) · Phoenix metro
**Data as of:** 2026-10-12 (live Redfin data pulled today)

## Method, sources, limits — read before trusting the numbers
- **Not Rich's Chrome.** Another session had Chrome, so this ran through scripts + Firecrawl.
- **Step 1, the list:** Redfin's "Download" CSV export (the same file as the "Download top 350" link) for each area:
  - DC: every active house/townhouse in the District (1,591 listings), filtered locally to 90+ days on market (DOM) = 333 listings.
  - S. Florida: the 350 single-family listings with the most days on market, per county (Miami-Dade, Broward, Palm Beach).
  - Phoenix: the 350 single-family listings with the most days on market, for each of Phoenix, Mesa, Glendale, Scottsdale, plus vacant land in all four.
- **Step 2, the detail check:** for the top candidates (longest DOM, under a price cap, not new-build) I opened each Redfin
  listing page to get the full price history, the listing agent and phone, and the agent's remarks (the keyword screen).
  Redfin's anti-bot wall (AWS WAF) blocked direct fetches after about 4 pages, so the rest were pulled one at a time through Firecrawl.
  **Only the top slice of each market got the detail check** (DC 16, S.FL 18, PHX 16 listing pages opened). So these tables are "the most motivated among the
  longest-sitting listings", NOT a full census. A listing with 95 DOM and a 30% cut could be missing.
- **Price-cut %** = (first list price of the current listing run − today's price) ÷ first list price. A "run" starts at the first
  "Listed" after the last recorded sale, so relists and delist/relist cycles count as one campaign.
- **DOM** = Redfin's figure from today's CSV. Redfin counts the current listing only; cumulative DOM can be higher.
- **Phone:** the number the listing page shows for the listing agent. Where Redfin shows a separate brokerage line it is in brackets.
  Some pages show only the brokerage number; that is noted.
- **Land Insights:** skipped. It needs Rich's login. No Land Insights column.
- **"Last sold" / "owned since"** come from Redfin's sale history (public record). A long hold (1970s–1990s) often means an older or
  inherited owner, but **nothing here confirms an estate or probate**. That needs a DC Superior Court probate search or a title pull.
- Nothing was contacted, signed up for, or messaged.

---

## Call first — top 3 overall

> **UNDERWRITTEN 2026-10-12. None of the 3 works at ask:**
> - 405 60th St NE DC: NO-GO at $349K; GO-CONDITIONAL at ≤$195K (MAO base $173K; RA-1; NOT a builder lot, since Ward 7 land residual ≈ $0) → deals/405-60th-st-ne-dc-20019.md
> - 6730 NE Miami Pl: NO-GO (ask $600K vs MAO $263–338K; seller priced off the MiMo side) → deals/6730-ne-miami-pl-miami-33138.md
> - 5902 W Orange Dr Glendale: GO-CONDITIONAL at ~$190K vs $295K ask (owner likely Amherst/ARVM 5 LLC; base MAO $183K) → deals/5902-w-orange-dr-glendale-az.md


**The trap first:** the listings with the most visible "motivation" are often the worst for a wholesale offer. An underwater owner
(14 Nicholson DC, 1820 SW 11th Ct FTL, 326 N 39th Dr PHX) or a short sale (1187 NW 29th Ter FTL) is desperate but **has no equity to give
you a discount**. Only the lender can approve a lower price. The three below combine motivation with room to negotiate.

1. **405 60th St NE, Washington DC 20019: $349,000, down 55% from $779K, 12 cuts, 634 DOM.** The agent's own words are "as-is",
   "investor", and "bring all offers". The lot is 9,760 sf, very large for DC. The owner paid $268K in 2018, so there is equity to
   negotiate with. **Fits FRESH GROUND's teardown/builder model directly.**
   Nishta Gupta, Samson Properties · 703-629-5768 · [Redfin](https://www.redfin.com/DC/Washington/405-60th-St-NE-20019/home/10131422)
2. **6730 NE Miami Pl, Miami FL 33138: $600,000, down 20% from $750K, cut again on Oct 6, "Sold AS IS", 618 DOM.** The owner paid
   **$42,900 in 2013**, so the equity is deep, and a fresh cut means the seller is moving now. Near Little River/Miami Shores.
   Esmeralda Laraque, NXT LVL Realty · 305-972-2975 · [Redfin](https://www.redfin.com/FL/Miami/6730-NE-Miami-Pl-33138/home/42682250)
3. **5902 W Orange Dr, Glendale AZ 85301: $295,000, 7 cuts, 508 DOM.** "Sold as-is", "not currently livable", "investors or builders",
   9,300 sf R-1 corner lot. This is a classic cash-buyer wholesale. ⚠️ The phone shown is a Redfin routing line, so get the agent's
   (George Laughton, EveryPlace) direct number first. [Redfin](https://www.redfin.com/AZ/Glendale/5902-W-Orange-Dr-85301/home/28394636)

**Runners-up:** 2208 R St SE, DC ($400K, −58%, "two lots", 10,800 sf: the best pure lot play, but the owner paid $340K in 2023, so the
floor is close) · 2236 Chester St SE, DC ($289K, −31%, owned since 1972, a contract died) · 1009 E Taylor St, Phoenix (R-5 land, −41%)
· 10250 SW 177th St, Miami (−33%, 9 cuts, comes with an extra lot).

**Next steps before any offer:** (1) pull county records on #1–#3 for owner, liens, and mortgage balance; (2) ask each agent why the
last contract died or why the price keeps dropping; (3) per the brief, S.FL and PHX have **no buyers yet**, so underwrite to investor
math (MAO = 70% of as-is value − repairs − fee) and run Script 01 buyer-capture in parallel.

## Coverage summary
| Market | Candidates in the pull | Detail pages opened | In table | Dropped |
|---|---|---|---|---|
| DC | 333 (90+ DOM, of 1,591 active) | 16 | 13 | 3 |
| S. Florida | 1,037 longest-DOM SFH (3 × ~350) | 18 | 15 | 3 |
| Phoenix | 1,958 longest-DOM SFH + land (8 × ≤350) | 16 (+2 blocked by rate limit) | 12 (8 houses + 4 land) | 4, incl. 1 off-market lead |

---

## Washington DC (District) — 13 hits

Screen: houses/rowhouses, 90+ DOM or a price cut of 5% or more. All 13 below pass both tests. Ranked most-motivated first.

| # | Address | Ask | Original | DOM | Cut history | Beds/Baths · SqFt · Lot | Distress signals | Listing agent · phone | Link |
|---|---|---|---|---|---|---|---|---|---|
| 1 | **405 60th St NE, 20019** | $349,000 | $779,000 | 634 | **−55%, 12 cuts:** $779K → $699,990 (Feb'25) → $650K → $624K → $599.9K → $589K → $549K (Jan'26) → $499.9K → $449.9K → $399.9K → $389K → $369K (Jun'26) → $349K (Oct'26) | 4/2 · 1,910 · **9,760 sf lot** | "as-is", "investor", "bring all offers"; last sold $268K (Oct'18) | Nishta Gupta, Samson Properties · 703-629-5768 (brkr 703-378-8810) | [Redfin](https://www.redfin.com/DC/Washington/405-60th-St-NE-20019/home/10131422) |
| 2 | **14 Nicholson St NW, 20011** | $325,000 | $695,999 | 91 (194 cumulative) | **−53%:** $695,999 (Mar'26) → $595,999 → $460K → pulled Jul'26 → relisted $460K → $429,995 → $395,999 → **contract fell through Sep 28** → relisted → $325K (Oct 6) | 2/1 · 1,381 · 5,000 sf lot | "Motivated seller", "Attention investors", "use caution when entering"; **owner paid $420K in May'25 and is now asking $95K less** (underwater flipper); approved plans for a 6-bed/4-bath, 3,000 sf house. Listed as **short sale** on the search card. | Rena Champaco, EXP Realty · 202-907-0052 (brkr 866-825-7169) | [Redfin](https://www.redfin.com/DC/Washington/14-Nicholson-St-NW-20011/home/10068569) |
| 3 | **2208 R St SE, 20020** | $400,000 | $950,000 | 439 | **−58%:** $950K (Jul'25) → $475K (Aug 11'26) → $400K (Aug 25'26) | 4/4.5 · 1,014 · **10,800 sf, "two lots"** | "Development opportunity… builder or investor"; bought $340K (Oct'23) | Larry Crenshaw, Keller Williams Capital Properties · 240-383-1350 | [Redfin](https://www.redfin.com/DC/Washington/2208-R-St-SE-20020/home/10148330) |
| 4 | 2236 Chester St SE, 20020 | $289,000 | $420,000 | 305 | **−31%:** $420K (Feb'25) → $380K → $360,050 → pulled → $324K (Nov'25) → **went pending Apr'26, fell through** → $299K → $289K (Aug'26) | 3/2 · 1,652 · 2,886 | "investor or handy homeowner"; **last sale Aug 1972 ($14,500)**, a long-held owner | David Conforti, Aegis Realty · 202-286-1302 | [Redfin](https://www.redfin.com/DC/Washington/2236-Chester-St-SE-20020/home/10158737) |
| 5 | 2607 Martin Luther King Jr Ave SE, 20020 | $329,000 | $450,000 | 351 | **−27%, 5 cuts:** $450K (Oct'25) → $399K → $379K → $349K → $339K → $329K (Aug'26) | 4/1 · 2,952 · **8,832 sf lot** | "INVESTOR ALERT", near Metro; owned since 1995 ($80K) | Jon Malcolm, Keller Williams Capital Properties · 202-243-7700 | [Redfin](https://www.redfin.com/DC/Washington/2607-Martin-Luther-King-Jr-Ave-SE-20020/home/10160858) |
| 6 | 24 55th St NE, 20019 | $339,900 | $450,000 | 422 | **−24%, 13 changes:** $450K (Aug'25) → … → $329.9K (Sep'26) → **contract fell through Oct 6** → $339.9K, relisted Oct 11 | 2/1.5 · 1,150 · 1,813 | Flip (bought **$70K** Jun'25), remodeled; seller still has a big margin, so room to negotiate | Tony Mraihi, Long & Foster · 301-388-2600 | [Redfin](https://www.redfin.com/DC/Washington/24-55th-St-NE-20019/home/10130447) |
| 7 | 1520 Montana Ave NE, 20018 | $699,900 | $999,999 | 614 | **−30%, 8 cuts:** $999,999 (Feb'25) → $899,999 → … → $699,900 (Dec'25); on and off the market since 2019 (first ask $950K) | 7/3 · 3,174 · 4,151 | **"short sale"**, "bring all offers"; owned since 1974 | Frances Castillo · 240-286-1684 (brkr 301-445-5900) | [Redfin](https://www.redfin.com/DC/Washington/1520-Montana-Ave-NE-20018/home/10098886) |
| 8 | 1117 Clifton St NW, 20009 | $940,000 | $1,600,000 (peak) | 578 | **−41% from peak:** $1.5M → $1.6M (Sep'22) → $1.2M (Mar'25) → $1.14M → $1.015M → $940K (Oct'26) | 3/1.5 · 1,788 · 1,872 | "cash"; owned since 1985 ($60K); Columbia Heights rowhouse | Leah Webster · 571-217-4658 (brkr 703-971-5555) | [Redfin](https://www.redfin.com/DC/Washington/1117-Clifton-St-NW-20009/home/10030991) |
| 9 | 4542 Eads St NE, 20019 | $399,900 | $449,500 | 502 | **−11%, 6 cuts;** contract fell through Jan'26; pulled and relisted Jul'26 | 3/2 · 1,216 · 2,316 | Flip (bought $185K Jun'23), "currently undergoing updates" | Matt Spicer, RLAH @properties · 301-652-0643 | [Redfin](https://www.redfin.com/DC/Washington/4542-Eads-St-NE-20019/home/10122855) |
| 10 | 1444 T St SE, 20020 | $275,000 | $317,000 | 405 | **−13%:** $317K (Jul'25) → $301K (Jan'26) → $275K (Aug'26) | 3/1.5 · 1,348 · 4,000 | "Calling all investors", "project", could be multi-family; owned since 1985 ($64K) | Latasha Hemsley, Century 21 Harris Hawkins · 410-321-1035 | [Redfin](https://www.redfin.com/DC/Washington/1444-T-St-SE-20020/home/10149315) |
| 11 | 319 60th St NE, 20019 | $199,000 | $199,000 | 383 | No cuts; pulled and relisted Oct'25 | **Vacant lot** (house torn down) · 3,500 sf | Teardown done; owner has plans for a 2,400 sf house; agent says the lot fits 2 houses (front + alley). **FRESH GROUND-type lot.** Bought $125K (2017) | Peter Mallios · 202-374-0123 | [Redfin](https://www.redfin.com/DC/Washington/319-60th-St-NE-20019/home/10131636) |
| 12 | 1834 Providence St NE, 20002 | $499,900 | $539,900 | 374 | **−7%, 3 cuts:** $539.9K (Oct'25) → $529.9K → $514.9K → $499.9K (Jul'26) | 2/2.5 · 1,320 · 2,178 | Flip (bought $290K May'24) | Kenneth Lewis, Realty Advantage of MD · 301-881-9800 | [Redfin](https://www.redfin.com/DC/Washington/1834-Providence-St-NE-20002/home/10094226) |
| 13 | 315 34th St NE, 20019 | $350,000 | $375,000 | 438 | **−7%:** $375K (Jul'25) → $365K → $350K (May'26); also failed to sell in 2018 | 3/2.5 · 1,324 · 1,600 | "ready for you to personalize" (dated) | Joyce Jenkins, HomeSmart · 301-352-4065 | [Redfin](https://www.redfin.com/DC/Washington/315-34th-St-NE-20019/home/10117242) |

**Checked and dropped (DC):** 4616 6th St SE (no cuts, a flip), 1616 W St SE (only −1%, day-care rental), 5017 Ayers Pl SE (no cuts;
its price went UP from $300K in 2023 to $499.9K).

**DC read:** #1–#3 are the real ones. Each has 50%+ cut and a big lot (9,760 / 5,000 / 10,800 sf). #3 (2208 R St SE, "two lots") and #11
(319 60th St NE, an already-cleared lot) are the closest to the FRESH GROUND teardown-lot model. #2 and #4 each had a contract fall through.
That is motivation, but **find out why the contract died before offering**.

---

## South Florida (Miami-Dade · Broward · Palm Beach), single-family only — 15 hits

Screen: single-family, 90+ DOM or 2+ price cuts, no condos. Every listing below has 200+ DOM. 18 pages opened, 3 dropped.
**Caveat:** the pull sorted by longest DOM, so this market's list leans toward stale listings (500–700 days). Fresher listings with
steep cuts (90–200 DOM) were not reached. A second pass sorted by price-cut size is the next step.

| # | Address | Ask | Original | DOM | Cut history | Beds/Baths · SqFt · Lot | Distress signals | Listing agent · phone | Link |
|---|---|---|---|---|---|---|---|---|---|
| 1 | **1187 NW 29th Ter, Fort Lauderdale 33311** (Broward) | $284,900 | $420,500 | 533 | **−32%, 5 cuts:** $420.5K (Jan'25) → $385K → $340K → $330K → $289.9K → $284.9K (Sep'26). **3 contracts fell through** (Dec'25, Apr'26, Aug'26) | 2/2 · 792 · 3,001 | **SHORT SALE**, "Sold As-Is", vacant; owner paid $330K (Jul'23) and is now under that | Marice Jaramillo, Casabella Miami Realty · 305-497-9797 (brkr 786-542-1655) | [Redfin](https://www.redfin.com/FL/Fort-Lauderdale/1187-NW-29th-Ter-33311/home/41683425) |
| 2 | **10250 SW 177th St, Miami 33157** (Miami-Dade) | $549,900 | $825,900 | 522 | **−33%, 9 cuts:** $825.9K (May'25) → $789.9K → $749.9K → $689.9K → $629.9K → $619.9K → $599.9K → $575.9K → $559.9K → $549.9K (Jul'26) | 3/2 · 1,025 · 8,600 **+ an extra lot** sold with it | "Development opportunity", the extra lot could allow "up to 12 units" (agent's claim, not verified); rental income now | Rolando Garcia, Florida Capital Realty · 305-987-6407 (brkr 786-953-5870) | [Redfin](https://www.redfin.com/FL/Miami/10250-SW-177th-St-33157/home/43173537) |
| 3 | **1820 SW 11th Ct, Fort Lauderdale 33312** (Broward) | $375,000 | $498,000 (this run; $565K in 2023) | 663 | **−25% this run:** $498K (Dec'24) → $475K → $398K (Jul'26) → $375K (Sep'26). Selling since Jul'23 ($565K → $499,997 → pulled); tried renting at $4,200 then $3,700 | 2/1 · 878 · 8,250 | **Owner paid $451,800 (Jul'22) and is asking $77K below that**: underwater, 3+ years trying | Patty Da Silva, Green Realty Properties · 954-399-0356 | [Redfin](https://www.redfin.com/FL/Fort-Lauderdale/1820-SW-11th-Ct-33312/home/41795372) |
| 4 | 1223 NE 181st St, North Miami Beach 33162 | $535,000 | $750,000 | 633 | **−29%:** $750K (Jan'25) → raised to $890K (May'26) → relisted → $552.9K (Sep'26) → $535K (Oct 1'26) | 2/1 · 880 · 5,700 | "Needs some TLC"; owned since 1998 ($65K); erratic pricing = seller unsure | Javier Gaitan, Beachfront Realty · 305-469-3117 (brkr 305-534-4242) | [Redfin](https://www.redfin.com/FL/North-Miami-Beach/1223-NE-181st-St-33162/home/42875920) |
| 5 | 833 Briggs St, West Palm Beach 33405 (Palm Beach) | $490,000 | $650,000 | 647 | **−25%, 4 cuts:** $650K (Jan'25) → $580K (Dec'25) → $510K → $500K → $490K (May'26). Also failed to sell in 2021 (17 cuts) and 2022 | 3/2 · 1,200 · n/a | Serial failed listings since 2021 | Gena Seulmot, Partnership Realty · 561-220-5873 (brkr 877-366-2213) | [Redfin](https://www.redfin.com/FL/West-Palm-Beach/833-Briggs-St-33405/home/42527532) |
| 6 | 6730 NE Miami Pl, Miami 33138 | $600,000 | $750,000 | 618 | **−20%, 3 cuts:** $750K (Feb'25) → $690K → $700K → **$600K (Oct 6'26)** | 3/1 · 1,413 · 5,280 | **"Sold AS IS"**; bought $42,900 in 2013 (deep equity) | Esmeralda Laraque, NXT LVL Realty · 305-972-2975 (brkr 305-302-4963) | [Redfin](https://www.redfin.com/FL/Miami/6730-NE-Miami-Pl-33138/home/42682250) |
| 7 | 2905 SW 54th St, Fort Lauderdale 33312 | $279,000 | $279,000 | 297 | No cuts | 2/1.5 · 1,506 · 3,200 | **"Estate sale"**, **FSBO** (no agent); owned since 1989. ⚠️ Remarks mention "maintenance fees", so check for an HOA | FSBO via ForSaleByOwner.com · phone n/a on Redfin | [Redfin](https://www.redfin.com/FL/Fort-Lauderdale/2905-SW-54th-St-33312/home/41814945) |
| 8 | 2542 Fillmore St, Hollywood 33020 (Broward) | $525,000 | $619,000 | 563 | **−15%, 3 cuts:** $619K (Mar'25) → $589K → $549K → $525K (Jan'26) | 2/2 · 925 · 9,530 | "Reduced", "Seller is motivated"; renovated flip (bought $280K 2019) | Arthur Shabetayev, Cardinal Realty Group · 786-201-4221 (brkr 305-910-2902) | [Redfin](https://www.redfin.com/FL/Hollywood/2542-Fillmore-St-33020/home/41938044) |
| 9 | 2381 NE 137th St, North Miami Beach 33181 | $450,000 | $525,000 | 600 | **−14%:** $525K (Feb'25) → $450K (Sep'25) | 2/1.5 · 660 · 2,400 | "Investors Dream", tenant in place; owned since 2003 ($51K). Beds/baths unclear: Redfin says 2/1.5, agent says 3/2, tax roll says 1/1 | Renald Chery, Dalton Wade · 786-781-1989 (brkr 888-668-8283) | [Redfin](https://www.redfin.com/FL/North-Miami-Beach/2381-NE-137th-St-33181/home/42887551) |
| 10 | 1560 NE 42nd Ct, Pompano Beach 33064 | $454,990 | $515,000 | 640 | **−12%** from first ask: $515K (May'24) → $498K → $490K → relisted $440K (Nov'24) → $475K (Jan'25) → $465K → $455K (Sep'26). 3 relists | 4/2 · 1,300 · 7,725 | Owned since 1982; renovated | Luis Tabares, Prime One Realty · 786-587-4239 | [Redfin](https://www.redfin.com/FL/Pompano-Beach/1560-NE-42nd-Ct-33064/home/41473764) |
| 11 | 8320 NW 10th Ave, Miami 33150 | $672,500 | $750,000 | 564 | **−10%:** $750K (Dec'24) → pulled and relisted → $672.5K (Nov'25) | 4/4 · 2,070 · ~9,800 (agent) | Waterfront; corporate tenant paying $5,500/mo (agent's figure) | James Bunyan, Millennium III Realty · 786-525-5984 | [Redfin](https://www.redfin.com/FL/Miami/8320-NW-10th-Ave-33150/home/43042008) |
| 12 | 1300 NW 7th Ter, Fort Lauderdale 33311 | $499,000 | $550,000 | 584 | **−9%:** $550K (Mar'25) → $535K → $499K (Aug'25). Failed to sell in 2023 ($450–465K); failed to rent in 2023 and 2025 | 3/1 · 945 · 4,725 | Owned since 2012 ($58.5K) | Karin Benyamin, Compass · 754-422-6406 (brkr 305-851-2820) | [Redfin](https://www.redfin.com/FL/Fort-Lauderdale/1300-NW-7th-Ter-33311/home/41688436) |
| 13 | 1317 SE 2nd Ave, Fort Lauderdale 33316 | $795,000 | $844,000 | 215 | **−6%, 2 cuts;** contract fell through Mar'26 | 3/2.5 · 2,416 · **9,375** | **"House needs work"**; redevelopment site (ROA zoning, South RAC, flood zone X); owned since 2003 ($360K) | Rhonda Kramer, RE/MAX Consultants Realty 1 · 561-515-5936 (brkr 954-477-7332) | [Redfin](https://www.redfin.com/FL/Fort-Lauderdale/1317-SE-2nd-Ave-33316/home/41809611) |
| 14 | 853 SW 12th St, Fort Lauderdale 33315 | $530,000 | $517,000 (first ask) | 527 | Up then down: $517K (May'25) → $499K → raised to $560K → $550K → $530K (Aug'26), **−5% from the $560K peak** | 3/2 · 1,181 · 6,378 | **"Sold AS IS"**, tenant, agent says the land fits 2 townhouses; tax record says 2/1 | Daniel Gleizer, Adonait Business LLC · 954-594-4900 (brkr 954-588-7564) | [Redfin](https://www.redfin.com/FL/Fort-Lauderdale/853-SW-12th-St-33315/home/41798911) |
| 15 | 520 SW 11th Ave, Miami 33130 (Little Havana) | $800,000 | $800,000 | 699 | No cuts. History shows "Listing Removed" Dec'25, but the page still says For Sale. **Confirm it is active** | 3/1 · 1,456 · 5,000 | T4-R zoning (agent says up to 4 units by right, Live Local Act upside); owned since 2018 ($315K) | Ashley Alvarez, Sterling One Realty · 786-877-7548 (brkr 305-285-2322) | [Redfin](https://www.redfin.com/FL/Miami/520-SW-11th-Ave-33130/home/42733923) |

**Checked and dropped (S.FL):** 121 Lake Gloria Dr WPB (villa in a 55+ guard-gated HOA, condo-like), 303 NW 28th Way FTL (flip, no cuts),
5810 SW 22nd St Miami (only −4%, tenants).

**S.FL read:** #1 (short sale, 3 dead contracts, vacant, as-is) and #3 (owner underwater against a 2022 purchase) are motivated in a way
an investor can use. A short sale needs **lender approval**, so price is set by the bank, not the seller; plan for a slow close.
#2 and #13 are land/redevelopment plays.

---

## Phoenix metro (Phoenix · Mesa · Glendale · Scottsdale edges) — 12 hits (8 houses + 4 land)

Screen: single-family 60+ DOM or 2+ price cuts, plus vacant land as a bonus. Every listing below passes the DOM test.
16 pages opened, 4 dropped. Firecrawl's per-minute rate limit cut this market short, so it has 12 hits, not 15.

⚠️ **Phoenix phone numbers:** Redfin shows the same number, **623-207-1769**, on seven different agents' listings at different brokerages
(eXp, EveryPlace, Realty ONE, Windermere, Barrett, Coldwell Banker, Berkshire Hathaway). **602-560-4103** appears on three. These are
almost certainly **Redfin call-routing lines, not the agents' direct numbers.** They are marked "(routing line)". Get the agent's direct
number from ARMLS or the brokerage site before calling.

| # | Address | Ask | Original | DOM | Cut history | Beds/Baths · SqFt · Lot | Distress signals | Listing agent · phone | Link |
|---|---|---|---|---|---|---|---|---|---|
| 1 | **1009 E Taylor St (Units 13-15), Phoenix 85006** · LAND | $950,000 | $1,600,000 | 654 | **−41%:** $1.6M (Dec'24) → $1.375M → $1.15M (Dec'25) → $950K (Sep'26) | **0.474 ac (3 lots combined), R-5 multifamily**, downtown/Garfield | Infill; owner claims 48 ft height, "maybe 22–24 units" (not verified) | Thomas Ross, Coldwell Banker · 623-207-1769 (routing line) | [Redfin](https://www.redfin.com/AZ/Phoenix/1009-E-Taylor-St-85006/unit-13-14-15/home/194043136) |
| 2 | **3638 S 12th St #48, Phoenix 85040** · LAND | $449,000 | $750,000 | 645 | **−40%, 7 cuts:** $750K (Jan'25) → $725K → $699K → $675K → pulled and relisted → $599K → $475K → $449K (Sep'26) | **0.82 ac**; includes old residential buildings | Phoenix Opportunity Zone, near the South Phoenix light rail | Daniel Brown, My Home Group · 623-526-1432 | [Redfin](https://www.redfin.com/AZ/Phoenix/3638-S-12th-St-85040/unit-48/home/194105724) |
| 3 | **5902 W Orange Dr, Glendale 85301** | $295,000 | $339,900 | 508 | **−13%, 7 cuts:** $339.9K (May'25) → $329.9K → $325K → pulled and relisted → $319.9K → $309.9K → $303.7K → $297.5K → $295K (Dec'25) | 3/2 · 1,506 · **9,300 corner lot, R-1** | **"Sold as-is", "not currently livable"**, "investors or builders", renovate or rebuild | George Laughton, EveryPlace · 623-207-1769 (routing line) | [Redfin](https://www.redfin.com/AZ/Glendale/5902-W-Orange-Dr-85301/home/28394636) |
| 4 | 4815 E Windsor Ave, Phoenix 85008 | $344,995 | $495,000 | 443 | **−30%, 9 cuts:** $495K (May'25) → $490K → $468K → $449K → $425K → $400K → $355K → pulled Mar'26 → $354.9K → $354K → $345K (Sep'26) | 2/3 · 1,000 · 4,112 | Remodeled flip (bought $185K 2020) that hasn't sold | Claudia Jara, Realty ONE Group · 623-207-1769 (routing line) | [Redfin](https://www.redfin.com/AZ/Phoenix/4815-E-Windsor-Ave-85008/home/27859125) |
| 5 | 326 N 39th Dr, Phoenix 85009 | $239,900 | $274,000 | 374 | **−12%, 17 cuts in 4 months:** $274K (Jun 3'26) → … → $239.9K (**Oct 11'26**) | 3/2 · 1,116 · 7,841 | **Owner paid $283K (Jan'24) and is now $43K under that.** Multi-family zoning (agent) | Kathy Patino, Wise Choice Properties · 480-526-9769 | [Redfin](https://www.redfin.com/AZ/Phoenix/326-N-39th-Dr-85009/home/27506408) |
| 6 | 4301 E Bluefield Ave, Phoenix 85032 | $499,000 | $615,000 | 394 | **−19%, 6 cuts:** $615K (Aug'25) → … → $499K (Jun'26); pulled and relisted Aug'26. Also failed to sell Sep'24–May'25 ($550K → $525K) | 3/2 · 2,250 · 8,784 | Flip (bought $305K Aug'23), second failed campaign | Theresa Marquez, Barrett Real Estate · 623-207-1769 (routing line) | [Redfin](https://www.redfin.com/AZ/Phoenix/4301-E-Bluefield-Ave-85032/home/28170350) |
| 7 | 2642 N 31st St, Phoenix 85008 | $548,000 | $599,000 | 218 | **−8.5%, 5 cuts:** $599K (Mar'26) → $598K → $597K → $594,990 → $549K → $548K (Oct 6'26) | 6/3.5 · 3,147 · **~17,000 sf** | "ATTENTION INVESTORS AND BUILDERS"; agent says R1-6 zoning allows a split into 2 lots with no variance; rented at $3,500/mo | Bruce Swift, Windermere · 623-207-1769 (routing line) | [Redfin](https://www.redfin.com/AZ/Phoenix/2642-N-31st-St-85008/home/28215407) |
| 8 | 6706 N 54th Dr, Glendale 85301 | $399,000 | $460,000 | 519 | **−13%:** $460K (May'25) → $425K → $429K → $399K (Jul'26) | 3/1 · 1,074 · 7,000 + 1-bed guest house | 1925 house. Two sales on the same day in Aug 2018 ($65K, then $80K) look like a wholesale double close | Raoul Loustaunau, eXp Realty · 623-207-1769 (routing line) | [Redfin](https://www.redfin.com/AZ/Glendale/6706-N-54th-Dr-85301/home/27551115) |
| 9 | 3241 N 27th Pl, Phoenix 85016 | $679,888 | $779,900 | 444 | **−13%, 13 cuts:** $779.9K (Jul'25) → … → $679,888 (Sep'26) | 4/2 · 2,003 · 9,997 | Remodeled flip, steady small cuts | David Labeda, 1st Southwest Realty · 480-703-1976 | [Redfin](https://www.redfin.com/AZ/Phoenix/3241-N-27th-Pl-85016/home/196619174) |
| 10 | 202 N 58th St, Mesa 85205 | $310,000 | $355,000 | 432 | **−13%, 5 cuts:** $355K (Jul'25) → $349K → $340K → $330K → $319,888 → $310K (Jun'26); pulled and relisted Jul'26 | 1/1 · 646 · 7,232 | Flip (bought $265K 2022), sold furnished | Shelsi Guthrie, Realty of America · 602-560-4103 (routing line) | [Redfin](https://www.redfin.com/AZ/Mesa/202-N-58th-St-85205/home/28010697) |
| 11 | 28839 N 165th Pl #5, Scottsdale 85262 (Rio Verde Foothills) · LAND | $130,000 | $150,000 | 685 | **−13%, 3 cuts:** $150K (Nov'24) → $145K → $140K → $130K (Mar'26). Also failed to sell in 2022 and 2023 | **1 acre** | EPCOR water fee already paid (agent). ⚠️ Rio Verde Foothills has a known water-supply history, so verify | George Laughton / Taylor Schalk, EveryPlace · phone n/a | [Redfin](https://www.redfin.com/AZ/Scottsdale/28839-N-165th-St-85262/unit-5/home/177823610) |
| 12 | 3915 E Melody Dr #18, Phoenix 85042 · LAND | $499,000 | $499,000 | 583 | No cuts | **0.56 ac** hillside view lot | Plans for a 4,123 sf home "in final review with the city"; bought $205K (2019) | Jacqueline Miller, My Home Group · 602-560-4103 (routing line) | [Redfin](https://www.redfin.com/AZ/Phoenix/3915-E-Melody-Dr-85042/unit-18/home/173929121) |

**Checked and dropped (PHX):** 6700 E Thomas Rd Scottsdale (a lot in a 55+ mobile-home park), 2228 N 74th Way Scottsdale (only −2.6%),
16728 S 31st Ln #40 Phoenix (gated-community lot; Redfin's history is garbled), 1114 E Orchid Ln Phoenix (**pulled off the market today,
Oct 12**; see the off-market lead below).

**Off-market lead (not in the table):** **1114 E Orchid Ln, Phoenix 85020.** Owned since **1969** ($13,900). Listed Jul'25 at $375K, cut to
$325K, relisted at $375K → $365K → $355K → $345K, went contingent Jan'26, then the listing was **removed today**. A 56-year owner whose
sale just died is a direct-mail or skip-trace candidate. Redfin estimate: $420,887.

**PHX read:** the land is where the big cuts are: #1 and #2 are both down 40%+. #3 is the textbook wholesale house: unlivable, as-is,
corner R-1 lot, $295K. Most Phoenix houses here are **flips that failed to sell**, not distressed owners. The flipper is motivated, but
their floor is their purchase price plus rehab cost, so expect less room than on an estate or tired-landlord seller.

