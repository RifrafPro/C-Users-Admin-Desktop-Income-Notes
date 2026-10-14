# Fresh sweep 2026-10-14: 24 live NoVA/Bethesda land + teardown listings

Source: `vault/tools/jev/fresh-sweep-raw-2026-10-14.json` (Firecrawl scrape of Redfin/Zillow, 10-14; method notes inside).
Jev test: blind labels committed in `955a128` BEFORE the run. Results are in `vault/tools/jev/README.md`.
Contacts are the **listing agent/brokerage as shown publicly**. No owner skip trace.

## The 5 "pursue" lots: underwriting (Claude, 10-14)
Method: builder lot value from the sold comps in the raw file; MAO = lot value x 0.88 (12% fee).
**[Guessing → Likely]** No builder has confirmed a land price yet (D1). Every number below moves once one does.
Common pattern: **every pursue lot is cheap for a reason.** The motivation signals come from a feasibility problem, so
each offer is conditioned on a feasibility contingency.

| Lot | Ask | Lot value (est.) | MAO @12% | Realistic offer | Verdict | The question for the agent |
|---|---|---|---|---|---|---|
| **2148 S Monroe St, Arlington** (2 parcels, 5,000 sf, R2-7) | $274K (was $699K) | $450-550K IF buildable; ~$0 if not | ~$400-480K | **$225K**, 45-day feasibility (Arlington zoning letter) | **BEST BET. Conditional GO.** | R2-7 needs 6,000 sf; this is 5,000. Does a buildable-lot letter exist? Why did the August contract die? |
| **12205 Waples Mill Rd, Oakton** (0.41 ac, R-1) | $400K (was $495K) | $380-450K if buildable | ~$335-395K | **$300K**, ceiling $340K, feasibility contingency | Conditional GO | R-1 is 36,000 sf; this is ~17,900. Lot of record? Sewer or septic? Why did the 2022 contract at $237K die in 3 weeks? |
| **9203 Potomac Ridge Rd, Great Falls** (2.11 ac, R-E) | $943K (was $1.071M) | $0.95-1.05M | ~$835-925K | **$790K**, ceiling $850K | Conditional GO (low-med) | Sold for $690K in 2022, and failed to sell at $849-887K in 2023. Why did the Jan 2026 contract die? Is perc/septic approved? |
| **748 Kentland Dr, Great Falls** (5 ac, R-E) | $2.0M | $1.5-1.6M (comps 5 ac: $1.51M, $2.2M) | ~$1.32-1.41M | **$1.3M** | Long shot | They asked $890-990K from 2017-22, and the 2022 contract at $980K died. Then the ask doubled. Is the 1985/1992 perc still valid? |
| **650 Walker Rd, Great Falls** (0.5 ac, R-1, 1950 Cape Cod) | $749.9K | $550-650K as a teardown lot | ~$485-570K | ~$550K (likely rejected) | **NO-GO as a teardown** | The house is updated and priced for someone who'll live in it. Two dead contracts: was it the appraisal or the inspection? |

## 🚦 6-check gate results (2026-10-14 PM, these SUPERSEDE the offers above)
Public records only: Fairfax open GIS (iCARE was down), Arlington datahub API, FEMA NFHL, Va. Code, ACZO. Owner names not pulled.
**Every pursue lot had a hidden killer that explains its dead contracts. A "pursue" from Jev means "cheap for a reason".**

| Lot | Zoning | Access | Utilities | Flood/RPA | Title | Perc | Gate verdict | Revised offer |
|---|---|---|---|---|---|---|---|---|
| **2148+2150 S Monroe, Arlington** | ⚠️ 2,500 sf each; **only buildable consolidated** (R2-7 = 5,000 sf / 50 ft; ACZO §16.1 relief excludes R2-7). Corner setbacks 25 ft → by-right strip ~17 ft wide (≈27 ft w/ Zoning Admin reduction). Precedent: 2146 next door (5,000 sf) has a house | ✅ corner, 2 public streets | ⚠️ likely public (MLS says "Water: Other") | ✅ Zone X, no RPA | ⚠️ **1987 escheat to VA** in chain; estate sale; assessed $452K total | ✅ N/A | **CONDITIONAL** | **$225K**, ceiling ~$260K. Contingent on Zoning Admin buildability letter + consolidation, survey, clean title commitment. Skinny-house lot value [Guessing] $350-450K, so this is still the best spread |
| **9203 Potomac Ridge, Great Falls** | ✅ R-E, 2.11 ac, "BUILDABLE-AVERAGE" | ⚠️ **UNPAVED** road + recorded ingress easement (likely private drive) | 🚨 **outside sewer area; septic "Applied For Permit" (not approved)**; well | ✅ no flood/RPA/wetlands nearby | ❓ assessed $720K; owner unknown | 🚨 unproven | **CONDITIONAL, renegotiate** | **$700K** contingent on septic permit approval + recorded easement/road agreement; up to ~$850K only if a permit is in hand |
| **12205 Waples Mill, Oakton** | ⚠️ 17,947 sf vs R-1 36,000 min (platted Penderwood Lot 1; lot-of-record unconfirmed). Assessed **$9K 2018-25** (unbuildable era), now "BUILDABLE-FAIR" $254K | ✅ VDOT road (driveway permit) | 🚨→⚠️ no sewer; septic needed | ✅ Zone X, no RPA | ⚠️ "duress"/"partial interest"/"no consideration" transfers → heirs/estate | ⚠️ no perc record; soils mixed | **CONDITIONAL, long shot** | **$240K** contingent on Health Dept septic permit + lot-of-record letter. The $400K ask will likely reject |
| 748 Kentland, Great Falls | ✅ R-E 5 ac | ✅ VDOT roads | ⚠️ well + septic | 🚨 **~63% in Chesapeake Bay RPA** (mapped 2003, after the percs) | ⚠️ held since 1985 | 🚨 1985/1992 percs ≠ permit (18-mo validity) | **WALK at $2.0M** | none. Revisit only if a soil evaluation + RPA delineation exist |
| 650 Walker, Great Falls | ⚠️ 21,780 sf vs R-1 36,000 | ⚠️ driveway on a purchased 2,000 sf easement | ⚠️ septic sized for 3 BR | ✅ | ⚠️ 2008 "duress" sale | ⚠️ no repair area for a 4-5 BR rebuild | **NO-GO (confirmed)** | none |

**Agent questions, in priority order (for the call sheets):**
- **Monroe:** Why did the August contract die? Has the escheat been cleared and is there a title commitment? Any Zoning Admin determination or consolidation plat? Who has signing authority for the estate?
- **Potomac Ridge:** What is the septic permit status (permit #, soil report, drainfield design)? Is the road public or private (easement book/page + maintenance agreement)? Why did the Jan 2026 contract die? Is the 2022 house permit transferable?
- **Waples Mill:** Who did the engineering study, is there a Health Dept permit, why the $9K assessment until 2025, and can all owners sign?

## All 24 listings: ask, labels, contacts
| Address | Ask | Expected | Jev v4 | Listing agent | Phone | Email shown | URL |
|---|---|---|---|---|---|---|---|
| Old Chesterbrook Rd | $99,000 | skip | skip 0.76 | Mark McConnell, eXp Realty LLC | 703-425-3582 | clientcare@teamdda.com | https://www.redfin.com/VA/McLean/Old-Chesterbrook-Rd-22101/home/143477001 |
| 1313 Ingleside Ave | $1,700,000 | watch | watch 1.00 | Crystal Sheehan, Keller Williams Realty | 703-636-7300 | unknown | https://www.redfin.com/VA/McLean/1313-Ingleside-Ave-22101/home/9390299 |
| 9185 Old Dominion Dr | $2,400,000 | skip | watch 0.92 | Pascale Karam, Long & Foster Real Estate, Inc. | 703-790-1990 | rachel.foster@longandfoster.com (office address, not the named agent) | https://www.redfin.com/VA/Mc-Lean/9185-Old-Dominion-Dr-22102/home/9165806 |
| LOT #1 (Lot B) Brook Rd | $1,590,000 | watch | watch 0.98 | Marianne Prendergast, Washington Fine Properties, LLC | 703-317-7000 | info@wfp.com (brokerage inbox) | https://www.redfin.com/VA/McLean/LOT-1-Brook-Rd-22102/home/205193483 |
| 1026 Towlston Rd | $1,995,000 | watch | watch 0.89 | Jon DeHart, TTR Sotheby's International Realty | 703-319-3344 | mclean@ttrsir.com (office inbox) | https://www.redfin.com/VA/McLean/1026-Towlston-Rd-22102/home/9254002 |
| 9203 Potomac Ridge Rd | $943,000 | pursue | pursue 0.69 | Scott Shawkey, Keller Williams Realty | 703-636-7300 | unknown | https://www.redfin.com/VA/Great-Falls/9203-Potomac-Ridge-Rd-22066/home/143761335 |
| Sterling Montague Dr (3 parcels) | $525,000 | watch | watch 1.00 | Saady Abd-Elfattah, Realty ONE Group Capital | 703-214-5100 | cam@nikkrealtygroup.com (team inbox) | https://www.redfin.com/VA/Great-Falls/Sterling-Montague-Dr-22066/home/143792431 |
| 528 Parcel E River Bend Rd | $1,865,000 | watch | watch 1.00 | Dianne Van Volkenburg, Compass | 703-828-1778 | holly@compass.com (not the named agent) | https://www.redfin.com/VA/Great-Falls/528-River-Bend-Rd-22066/home/9165962 |
| 9112 Potomac Ridge Rd | $4,950,000 | watch | watch 0.80 | Derek Greene, The Greene Realty Group | 888-278-5840 | office@thegreenerealtygroup.com (office inbox) | https://www.redfin.com/VA/Great-Falls/9112-Potomac-Ridge-Rd-22066/home/9071053 |
| 258 Jeffery Ln | $1,200,000 | watch | watch 0.86 | Hunter McFadden, Compass | 202-448-9002 | unknown | https://www.redfin.com/VA/Great-Falls/258-Jeffery-Ln-22066/home/162548174 |
| 748 Kentland Dr | $2,000,000 | pursue | pursue 0.85 | Eugene Curtin, Weichert Company of Virginia | 703-759-6300 | mpergerson@weichertrealtors.net (not the named agent) | https://www.redfin.com/VA/Great-Falls/748-Kentland-Dr-22066/home/141690838 |
| 650 Walker Rd | $749,900 | pursue | pursue 0.89 | Suzanne Fields, Coldwell Banker Realty | 703-759-2600 | debi.hughes@cbmove.com (not the named agent) | https://www.redfin.com/VA/Great-Falls/650-Walker-Rd-22066/home/9085156 |
| 24th St S | $462,000 | skip | watch 0.97 | Omar Sherzai, Long & Foster Real Estate, Inc. | 703-522-0500 (broker line) | unknown | https://www.redfin.com/VA/Arlington/24th-St-S-22206/home/22678031 |
| 1311 N Utah St | $925,000 | watch | watch 0.91 | Brian Cunneff, RE/MAX Distinctive Real Estate, Inc. | 703-821-1840 | broker@remaxdistinctive.com (broker inbox) | https://www.redfin.com/VA/Arlington/1311-N-Utah-St-22201/home/11244047 |
| 2148 S Monroe St (with 2150) | $274,000 | pursue | pursue 1.00 | Boris Miric, Fathom Realty DC, LLC | 888-455-6040 | admin@badaliangroup.com (team inbox) | https://www.redfin.com/VA/Arlington/2148-S-Monroe-St-22204/home/200699178 |
| 0 Pollard St S | $700,000 | watch | watch 0.98 | Vanessa Hardee, Long & Foster Real Estate, Inc. | 202-299-0424 (broker line) | unknown | https://www.redfin.com/VA/Arlington/Pollard-S-22201/home/204579264 |
| 919 S Monroe St | $725,000 | watch | watch 0.76 | Nathan B. Carnes, Berkshire Hathaway HomeServices PenFed Realty | 202-608-1880 | capitolhill@penfedrealty.com (office inbox) | https://www.redfin.com/VA/Arlington/919-S-Monroe-St-22204/home/191161200 |
| 1114 N Stuart St | $1,130,000 | watch | watch 0.80 | David Cabo, Keller Williams Realty | 703-915-4277 | unknown | https://www.zillow.com/homedetails/1114-N-Stuart-St-Arlington-VA-22201/12075562_zpid/ |
| 3970 26th St N | $624,900 | watch | watch 0.97 | Jessica Walker, Coldwell Banker Realty | 571-217-0633 | unknown | https://www.zillow.com/homedetails/3970-26th-St-N-Arlington-VA-22207/12061989_zpid/ |
| 12205 Waples Mill Rd | $400,000 | pursue | pursue 0.91 | Michelle Fisher, Pearson Smith Realty, LLC | 571-386-1075 | listinginquires@pearsonsmithrealty.com (brokerage inbox) | https://www.redfin.com/VA/Oakton/12205-Waples-Mill-Rd-22124/home/9509392 |
| 3013 Graham Rd | $544,900 | skip | watch 0.88 | Kelly Sweitzer, Long & Foster Real Estate, Inc. | 703-790-1990 | rachel.foster@longandfoster.com (office address, not the named agent) | https://www.redfin.com/VA/Falls-Church/3013-Graham-Rd-22042/home/9556043 |
| 1295 Colvin Forest Dr | $998,500 | skip | watch 0.94 | Najma Oudada, TTR Sotheby's International Realty | 703-745-1212 | unknown | https://www.redfin.com/VA/Vienna/1295-Colvin-Forest-Dr-22182/home/9245351 |
| 8801 Jarrett Valley Dr | $2,500,000 | skip | watch 0.95 | Carole Stadfield, Samson Properties | 703-378-8810 (broker line) | donnysamson@samsonpropeties.net (as shown, apparent typo in domain; broker, not the named agent) | https://www.redfin.com/VA/Vienna/8801-Jarrett-Valley-Dr-22182/home/9373124 |
| 8606 Jefferson St | $830,000 | skip | watch 0.91 | Amy Presley, Samson Properties | 240-630-8689 | kara@samsonproperties.net (not the named agent) | https://www.redfin.com/MD/Bethesda/8606-Jefferson-St-20817/home/10649537 |
