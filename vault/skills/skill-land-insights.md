# SKILL — Land Insights data platform (sellers AND buyers from deed data)

Scraped 2026-10-12 from the logged-in app (Chrome, Rich's account) + landinsights.co/lite.
App: **https://app.landinsights.co/data** · Rich's plan: **Lite (free)** · balance **5,000 credits**.
Data source: First American / DataTree (refreshed daily, per vendor).

## Cost (Lite) — 1 credit = $0.01
| Action | Lite | Starter $47/mo | Pro $500/mo |
|---|---|---|---|
| Export a property record | 10 cr ($0.10) | $0.08 | $0.05 |
| Skip trace standard / premium (premium adds owner age + emails) | 6 / 7 cr per HIT | $0.04 | $0.02 |
| SellerIQ (AI tags owners High/Med/Low motivated) | 3 cr / record | | |
| Filtering, previewing, AI scrubbing, de-dup | FREE | | |
5,000 credits ≈ 500 exported records, or ~380 records + skip trace on the best 100.
**"Purchase Now" spends credits → ask Rich first** (house rule: no spend without OK).

## What Lite has / doesn't
- ✅ Map + 100+ filters + exports + skip trace + data layers (parcels, owner name, last purchase price,
  assessed value, AI building layer, land use, flood, wetlands, slope/contours, soil, roads, city limits).
- ❌ (Starter) MLS comps layer (3-yr history) + Comping Tool → keep comping with the underwriter agent.
- ❌ (Pro) Market Research, Saved Markets, Agent Database ("double close" agents), Campaign Kanban,
  Listing Photo Editor. Not worth $500/mo at deal zero.
- Tools menu = Ruler + Draw Polygons only. Data Layers → MLS Data / My Markets / Campaigns are upsell.
- Ignore the "export within the hour → $25 credits" onboarding popup (sales nudge).

## Filter panel (Filter & Export Parcels) — full field list
- **Parcel:** Polygons (draw zone), Counties, Subdivision, Include/Exclude ZIPs, Acres range,
  **Max Improvement %** (house value ÷ total), City Limits, Zoning Type, Land Use.
- **AI scrubbing (free):** vacant-only, remove bad slope, remove/only landlocked, remove HOA,
  max wetland %, max flood %, road frontage, slope >20% on X% of parcel.
- **Owner:** SellerIQ, de-dup owners, out-of-state / out-of-county / out-of-ZIP owner,
  exclude corporate owners, only inter-family transfers, tax delinquent, ownership length (months),
  include/exclude keywords (owner name).
- **County assessor:** total / land / improvement value, market total / land / improvement value,
  years of unpaid taxes.
- **Sale info:** sale price, sale price type, **last sale date**, **seller name**, deed type,
  open lien, mortgage amount + recording date, financing type, mortgage type, interest rate.
- **Structure:** total structure sq ft, structure count / max structure count.
- **Export options:** skip trace type, parcel KML, AI market value estimate.

## RECIPE A — teardown SELLERS (FRESH GROUND acquisitions)
ZIP 22101/22102/22182/22066 (or polygon) · acres 0.25–2 · **Improvement Value MIN $100K** (a real house —
without this you get HOA common land, see test below) · Max Improvement % 25–35 · ownership ≥ 180 mo ·
✔ Remove HOA · ✔ Exclude Corporate Owners · ✔ De-dup owners · optional: out-of-state owner, tax delinquent,
no open lien / old mortgage date (free-and-clear = flexible seller).
Preview → count → Rich OKs credits → export → underwriter → skip trace only the top 10–15.
- Test 10-12 (22101, 0.25–3 ac, impr ≤25%, owned ≥180 mo): **48 parcels**, but top hits were HOA common
  areas (Kings Manor Assn, Bryn Mawr Cluster HOA…) — improvement $0. Fix = Improvement Value MIN.
  Claude's clicks on the HOA/corporate checkboxes didn't visibly change the count — verify toggles by eye.

## RECIPE B — BUYERS from deed data (builders who bought teardowns) ⭐ [untested idea, Claude 10-12]
The same filters run backwards find who is ACTUALLY buying lots: same ZIPs · **Last Sale Date = last
24 months** · **do NOT exclude corporate** · owner keywords `LLC, HOMES, BUILDERS, CUSTOM, DEVELOPMENT,
CONSTRUCTION` · sale price ≥ $800K · (optional) Max Improvement % ≤ 35 at time of sale.
Output = builder LLCs + what they paid for dirt per ZIP → feeds `vault/buyers.md` + answers the voice
agent's Q3 ("what do you pay for the dirt?") with real numbers before we even call.
Works for the Phoenix/Glendale buyer list too (the 9 LLC cash buyers found in the 5902 W Orange comps).
Cost: export only the buyer rows (≈ 30–80 records = 300–800 cr). Skip trace the LLCs' registered agents
is usually useless → use SCC (VA) / ACC (AZ) entity lookup for the principal instead.

## Chrome extension (separate thing) — see skill-stale-listing-sweep.md item 8
Zillow search cards: $/acre badge works · Redfin: broken ("no acreage").
