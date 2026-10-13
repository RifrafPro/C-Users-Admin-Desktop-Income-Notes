# fix-caller.ps1 - VoIP.ms 603 fix, step 2 (2026-10-12). Rich runs it himself.
# Evidence: SIP trace shows VoIP.ms answers 603 within ~50 ms and never asks for credentials. The INVITE
# says From: +15718322832; VoIP.ms (per its staff on voip-info.org) needs the sub-account name in From.
# ElevenLabs uses the imported "phone number" as the From user, so this adds a second ElevenLabs number
# entry named 577131_fg (callers still see 571-832-2832: the sub account forces its DID as CallerID),
# with the SIP password Rich types (masked, sent only to ElevenLabs, never saved), then test-calls his cell
# and prints the SIP replies. Reads the API key from %USERPROFILE%\.elevenlabs.env. ASCII only.

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Repo = Split-Path -Parent $PSScriptRoot
$Log = Join-Path $Repo "vault\voice-agent-deploy-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Write-Host $m; Add-Content -Path $Log -Value "[$Stamp] $m" }

$AgentId = "agent_9201m3gbrsdcftm8f21bygh8cwgf"
$Ident = "577131_fg"
$TestTo = "19166931900"   # Rich's cell
$Api = "https://api.elevenlabs.io/v1/convai"

$EnvFile = Get-ChildItem "$env:USERPROFILE" -Filter ".elevenlabs.env*" -Force -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $EnvFile) { Say "STOP: no %USERPROFILE%\.elevenlabs.env key file"; Read-Host "Press Enter to close"; exit 1 }
$Key = ((Get-Content $EnvFile.FullName | Where-Object { $_ -match "=" } | Select-Object -First 1) -split "=", 2)[1].Trim().Trim('"')
$H = @{ "xi-api-key" = $Key }

Write-Host ""
Write-Host "Type the SIP password for 577131_fg (the newest one). Nothing shows while you type."
$Sec = Read-Host "SIP password" -AsSecureString
$Pw = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Sec))
if (-not $Pw) { Say "STOP: empty password"; Read-Host "Press Enter to close"; exit 1 }

$Trunk = @{ address = "sanjose2.voip.ms"; transport = "tcp"; media_encryption = "disabled"; credentials = @{ username = $Ident; password = $Pw } }
try {
    $Existing = @(Invoke-RestMethod "$Api/phone-numbers" -Headers $H) | Where-Object { $_.phone_number -eq $Ident }
    if ($Existing) {
        $Id = $Existing[0].phone_number_id
        Invoke-RestMethod "$Api/phone-numbers/$Id" -Method Patch -Headers $H -ContentType "application/json" -Body (@{ outbound_trunk_config = $Trunk } | ConvertTo-Json -Depth 5) | Out-Null
        Say "fix-caller: updated existing entry $Id"
    } else {
        $Body = @{ phone_number = $Ident; label = "FRESH GROUND VoIP.ms (from 577131_fg)"; provider = "sip_trunk"; agent_id = $AgentId; outbound_trunk_config = $Trunk } | ConvertTo-Json -Depth 5
        $Id = (Invoke-RestMethod "$Api/phone-numbers" -Method Post -Headers $H -ContentType "application/json" -Body $Body).phone_number_id
        Say "fix-caller: created entry $Id (From user $Ident)"
    }
} catch {
    Say "fix-caller: SETUP FAILED: $($_.ErrorDetails.Message)"; Read-Host "Press Enter to close"; exit 1
} finally { $Pw = $null; $Trunk = $null }

Write-Host ""
Write-Host "Placing the test call to your cell now - answer it."
$Conv = $null
try {
    $C = Invoke-RestMethod "$Api/sip-trunk/outbound-call" -Method Post -Headers $H -ContentType "application/json" -Body (@{ agent_id = $AgentId; agent_phone_number_id = $Id; to_number = $TestTo } | ConvertTo-Json)
    $Conv = $C.conversation_id
    Say "fix-caller: test call success=$($C.success) msg=$($C.message) conv=$Conv"
} catch { Say "fix-caller: TEST CALL FAILED: $($_.ErrorDetails.Message)" }

if ($Conv) {
    Start-Sleep -Seconds 3
    try {
        $S = Invoke-RestMethod "$Api/conversations/$Conv/sip-messages" -Headers $H
        $Replies = $S.sip_messages | Where-Object { $_.direction -eq "in" } | ForEach-Object { ($_.raw_message -split "`r`n")[0] }
        Say "fix-caller: VoIP.ms replies: $($Replies -join ' / ')"
    } catch { Say "fix-caller: could not read SIP replies" }
}
Write-Host ""
Write-Host "Done. Tell Claude what this window says (and whether your phone rang)."
Read-Host "Press Enter to close"
