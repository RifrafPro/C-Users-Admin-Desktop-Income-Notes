# diagnose-dns.ps1 - reads the PUBLIC DNS state of freshgroundllc.com, prints a
# plain-language verdict, pushes facts to the vault, opens the fix-it pages.
# ASCII only. Queries 8.8.8.8 directly so local caching cannot lie to us.

$Repo = Split-Path -Parent $PSScriptRoot
$Out = Join-Path $Repo "vault\dns-check-freshgroundllc.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
"== DNS check $Stamp (public resolver 8.8.8.8) ==" | Set-Content $Out

function Q($type) {
    try { Resolve-DnsName freshgroundllc.com -Type $type -Server 8.8.8.8 -ErrorAction Stop }
    catch { $null }
}

$NS  = Q NS
$TXT = Q TXT
$MX  = Q MX

"--- NS ---"  | Add-Content $Out; ($NS  | Out-String) | Add-Content $Out
"--- TXT ---" | Add-Content $Out; ($TXT | Out-String) | Add-Content $Out
"--- MX ---"  | Add-Content $Out; ($MX  | Out-String) | Add-Content $Out

Write-Host ""
Write-Host "================ VERDICT ================"
$NsNames = ($NS | Where-Object {$_.Type -eq 'NS'} | ForEach-Object {$_.NameHost}) -join ", "
Write-Host ("Nameservers: " + $NsNames)

$Verdict = ""
if (-not $NS) {
    $Verdict = "DOMAIN NOT RESOLVING AT ALL yet. Brand-new domains can take up to ~1 hour to go live. Wait 30-60 min, double-click me again."
} elseif ($NsNames -notmatch "registrar-servers.com") {
    $Verdict = "FOUND IT: the domain is NOT using Namecheap's standard DNS (" + $NsNames + "). Records typed into Namecheap's Advanced DNS page DO NOTHING in this state. Fix: Namecheap -> Domain -> NAMESERVERS section -> set to 'Namecheap BasicDNS' -> save -> wait 30 min -> redo the TXT record -> verify in Google."
} else {
    $HasGoogleTxt = $TXT | Where-Object { $_.Strings -match "google-site-verification" }
    if ($HasGoogleTxt) {
        $Verdict = "The Google verification TXT record IS PUBLISHED and visible to the world. If Google still says it cannot verify, click Verify again now - and if it still fails, the code in DNS may not match the code Google expects (delete the TXT row, re-copy the code from Google's screen, re-add)."
    } else {
        $Verdict = "Nameservers are correct (Namecheap BasicDNS) but NO google-site-verification TXT record is published. The record was not saved, was saved with the wrong Host (must be @), or needs more time. Fix: Namecheap -> Advanced DNS -> Add New Record -> TXT Record -> Host: @ -> Value: the long google-site-verification=... code from Google's screen -> green checkmark to SAVE -> wait 15-30 min -> Verify in Google."
    }
}
Write-Host $Verdict
Write-Host "========================================="
("VERDICT: " + $Verdict) | Add-Content $Out

git -C $Repo add -A 2>&1 | Out-Null
git -C $Repo commit -m "DNS diagnosis freshgroundllc.com $Stamp" 2>&1 | Out-Null
git -C $Repo push 2>&1 | Out-Null
Write-Host "Facts pushed to cloud Claude."

# Open the two pages where any fix happens
Start-Process "https://ap.www.namecheap.com/Domains/DomainControlPanel/freshgroundllc.com/advancedns"
Start-Process "https://admin.google.com"
