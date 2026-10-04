"""Convert FRESH GROUND contract templates (Markdown) to clean, signable PDFs.

Strips internal-only content (>> notes <<, '<- annotations', leading DRAFT banners,
instruction sub-headings) so nothing meant for Rich reaches a counterparty.
Stdlib only; PDF rendering via headless Chrome.
"""
import html
import re
import subprocess
import sys
from pathlib import Path

CONTRACTS = Path(sys.argv[1])
OUT = Path(sys.argv[2])
CHROME = r"C:\Program Files\Google\Chrome\Application\chrome.exe"
FOOTER_PLAIN = "FRESH GROUND template v1 (2026-10-03) \\2014  pending attorney review  \\00B7  page \" counter(page) \" of \" counter(pages) \""

# (output name, source file, first line, last line) — 1-based inclusive; None = whole file
JOBS = [
    ("FRESH-GROUND-Purchase-and-Sale-Agreement", "_TEMPLATE-purchase-and-sale-agreement.md", 1, 109),
    ("FRESH-GROUND-Assignment-of-Contract", "_TEMPLATE-assignment-of-contract.md", None, None),
    ("FRESH-GROUND-MD-Disclosure-1-Seller", "_TEMPLATE-md-assignment-disclosures.md", 39, 76),
    ("FRESH-GROUND-MD-Disclosure-2-Assignee", "_TEMPLATE-md-assignment-disclosures.md", 85, 122),
]


def clean(text: str) -> str:
    text = re.sub(r">>.*?<<", "", text, flags=re.S)          # internal notes (may span lines)
    text = re.sub(r"\s*←.*$", "", text, flags=re.M)           # '<- THE CLAUSE...' annotations
    lines = text.splitlines()
    # drop a leading blockquote banner (DRAFT / instructions) that sits right after the title
    out, i = [], 0
    while i < len(lines):
        if lines[i].startswith(">") and re.search(r"DRAFT|placeholder|Nothing sends", lines[i], re.I):
            while i < len(lines) and lines[i].startswith(">"):
                i += 1
            continue
        out.append(lines[i])
        i += 1
    return "\n".join(out)


def inline(s: str) -> str:
    s = html.escape(s, quote=False)
    s = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", s)
    s = re.sub(r"(?<!\*)\*(?!\s)(.+?)\*", r"<i>\1</i>", s)
    s = re.sub(r"`(.+?)`", r"\1", s)
    return s


BREAK_BEFORE = re.compile(
    r"^(\*\*[^*]+\*\*\s*$|\*\*[^*]+:\*\*|[A-Z][\w /.'-]{0,30}:|_{5,}|[A-C]\.\s|Method of delivery|\[|\*[^*])")
NL = "\x00"


def join_para(lines):
    """Re-flow hard-wrapped source lines; keep a line break only before label-style lines
    and after signature lines (ending in underscores)."""
    text = lines[0]
    for prev, ln in zip(lines, lines[1:]):
        brk = BREAK_BEFORE.match(ln) or prev.rstrip().endswith("_")
        text += (NL if brk else " ") + ln
    return inline(text).replace(NL, "<br>")


def to_html(md: str) -> str:
    blocks, para, lst = [], [], []

    def flush():
        if para:
            blocks.append("<p>" + join_para(para) + "</p>")
            para.clear()
        if lst:
            blocks.append("<ul>" + "".join(f"<li>{inline(x)}</li>" for x in lst) + "</ul>")
            lst.clear()

    md = re.sub(r"^(>.*)\n>\s?(.*)$", r"\1 \2", md, flags=re.M)  # merge 2-line callouts
    md = re.sub(r"^(>.*)\n>\s?(.*)$", r"\1 \2", md, flags=re.M)
    for raw in md.splitlines():
        line = raw.rstrip()
        if not line.strip():
            flush(); continue
        if line.strip() == "---":
            flush(); blocks.append("<hr>"); continue
        m = re.match(r"(#{1,3})\s+(.*)", line)
        if m:
            flush(); n = len(m.group(1)); blocks.append(f"<h{n}>{inline(m.group(2))}</h{n}>"); continue
        if line.startswith(">"):
            flush(); blocks.append(f"<p class='callout'>{inline(line.lstrip('> ').strip())}</p>"); continue
        m = re.match(r"(?:[-*]|\d+\.)\s+(.*)", line)
        if m and not line.startswith("**"):
            if para:
                blocks.append("<p>" + join_para(para) + "</p>"); para.clear()
            lst.append(m.group(1)); continue
        if lst and raw.startswith("  "):
            lst[-1] += " " + line.strip(); continue
        if lst:
            flush()
        para.append(line.strip())
    flush()
    body = "\n".join(blocks)
    body = re.sub(r"(<hr>\s*)+$", "", body)
    return f"""<!doctype html><html><head><meta charset="utf-8"><style>
@page {{ size: Letter; margin: 0.9in 0.9in 0.8in 0.9in;
  @bottom-center {{ content: "{FOOTER_PLAIN}"; font-family: Georgia, serif; font-size: 8pt; color: #777; }} }}
body {{ font-family: Georgia, 'Times New Roman', serif; font-size: 11pt; line-height: 1.45; color:#111; }}
h1 {{ font-size: 15pt; text-align:center; margin: 0 0 14pt; }}
h2 {{ font-size: 12pt; margin: 14pt 0 4pt; }}
h3 {{ font-size: 11pt; margin: 10pt 0 4pt; }}
p {{ margin: 0 0 8pt; }} ul {{ margin: 0 0 8pt 18pt; padding:0; }}
.callout {{ border-left: 3px solid #333; padding: 4pt 10pt; font-weight: bold; }}
hr {{ border: 0; border-top: 1px solid #999; margin: 12pt 0; }}
</style></head><body>{body}</body></html>"""


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    for name, src, a, b in JOBS:
        lines = (CONTRACTS / src).read_text(encoding="utf-8").splitlines()
        part = "\n".join(lines[(a - 1 if a else 0):(b if b else None)])
        page = to_html(clean(part))
        leaks = [t for t in (">>", "<<", "←", "[[FILL]]", "**") if t in page]
        htm = OUT / f"{name}.html"
        htm.write_text(page, encoding="utf-8")
        pdf = OUT / f"{name}.pdf"
        subprocess.run([CHROME, "--headless=new", "--disable-gpu", "--no-pdf-header-footer",
                        f"--print-to-pdf={pdf}", htm.as_uri()], check=True, capture_output=True)
        print(f"{pdf.name}: {pdf.stat().st_size} bytes  leaks={leaks or 'none'}")


if __name__ == "__main__":
    main()

