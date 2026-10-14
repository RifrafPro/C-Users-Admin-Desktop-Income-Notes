"""Build Jev items + BLIND expected labels from a raw sweep file.

Usage: python3 -I fresh_sweep_prep.py <raw.json> <items_out.json> <expected_out.json>
Expected labels apply the v4 preset rules mechanically, before Jev ever sees the rows.
"""
import json
import re
import sys

SKIP_WORDS = ("remnant", "unbuildable", "not buildable", "non-buildable", "outlot", "no perc", "failed perc")


def num(v):
    if isinstance(v, (int, float)):
        return v
    if isinstance(v, str):
        m = re.sub(r"[^\d.]", "", v)
        return float(m) if m else None
    return None


def signals(row):
    pct, dead, fin, dom = row["pct_below_original_ask"], row["dead_contracts"], row["seller_financing"], row["dom_days"]
    return sum([
        isinstance(pct, (int, float)) and pct >= 20,
        isinstance(dead, (int, float)) and dead >= 1,
        fin == "yes",
        isinstance(dom, (int, float)) and dom > 200,
    ])


def expected(row):
    notes = (row["listing_notes"] or "").lower()
    if row["property_type"] not in ("land", "teardown") or any(w in notes for w in SKIP_WORDS):
        return "skip"
    if isinstance(row["days_since_first_listed"], (int, float)) and row["days_since_first_listed"] < 30:
        return "skip"
    return "pursue" if signals(row) >= 2 else "watch"


def to_item(i, l):
    cur, orig = num(l.get("list_price")), num(l.get("original_list_price"))
    pct = round((orig - cur) / orig * 100, 1) if cur and orig and orig > 0 else "unknown"
    # Rule fixed 10-14 BEFORE the Jev run: relists reset the portal clock but not the seller's
    # exposure, so use days across relists, and count dead contracts from earlier runs too.
    dom = num(l.get("dom_cumulative_est"))
    if dom is None:
        dom = num(l.get("days_on_market"))
    dead_now, dead_prior = num(l.get("dead_contracts")), num(l.get("dead_contracts_prior_runs")) or 0
    dead = dead_now + dead_prior if dead_now is not None else "unknown"
    return {
        "_id": "f%02d" % i,
        "address": l["address"],
        "property_type": l.get("property_type", "unknown"),
        "dom_days": dom if dom is not None else "unknown",
        "pct_below_original_ask": pct,
        "dead_contracts": dead if isinstance(dead, (int, float)) else "unknown",
        "seller_financing": l.get("seller_financing", "unknown"),
        "days_since_first_listed": dom if dom is not None else "unknown",
        "listing_notes": l.get("remarks", "") or "",
    }


def main(raw_path, items_path, expected_path):
    raw = json.load(open(raw_path, encoding="utf-8"))
    items = [to_item(i, l) for i, l in enumerate(raw["listings"], 1)]
    exp = {it["_id"]: {"address": it["address"], "expected": expected(it), "signals": signals(it)} for it in items}
    json.dump(items, open(items_path, "w", encoding="utf-8"), indent=1)
    json.dump(exp, open(expected_path, "w", encoding="utf-8"), indent=1)
    counts = {}
    for e in exp.values():
        counts[e["expected"]] = counts.get(e["expected"], 0) + 1
    print("items:", len(items), "expected:", counts)


if __name__ == "__main__":
    main(*sys.argv[1:4])
