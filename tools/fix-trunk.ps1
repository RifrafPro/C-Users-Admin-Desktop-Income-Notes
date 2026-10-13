# fix-trunk.ps1 - VoIP.ms 603 fix (2026-10-12). Rich runs it himself.
# Sets the FRESH GROUND ElevenLabs trunk back to plain TCP to sanjose2.voip.ms, media encryption
# DISABLED (VoIP.ms TLS only offers RSA-key-exchange ciphers that ElevenLabs will not use, and over
# TCP ElevenLabs offers SRTP-only audio, which VoIP.ms declines with 603), re-enters the SIP
# credentials (a 10-12 PATCH wiped them), then places one test call to Rich's cell.
# The password is typed here (masked), sent only to ElevenLabs, never saved or logged.
# Reads the API key from %USERPROFILE%\.elevenlabs.env. ASCII only (PS 5.1 encoding rule).

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Repo = Split-Path -Parent $PSScriptRoot
$Log = Join-Path $Repo "vault\voice-agent-deploy-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Write-Host $m; Add-Content -Path $Log -Value "[$Stamp] $m" }

$PhoneId = "phnum_4301m4s14cmae3xak2b9smzxchv8"
$AgentId = "agent_9201m3gbrsdcftm8f21bygh8cwgf"
$SipServer = "sanjose2.voip.ms"
$SipUser = "577131_fg"
$TestTo = "19166931900"   # Rich's cell, 11 digits, no '+' (VoIP.ms returns 404 on '+')

$EnvFile = Get-ChildItem "$env:USERPROFILE" -Filter ".elevenlabs.env*" -Force -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $EnvFile) { Say "STOP: no %USERPROFILE%\.elevenlabs.env key file"; Read-Host "Press Enter to close"; exit 1 }
$Key = ((Get-Content $EnvFile.FullName | Where-Object { $_ -match "=" } | Select-Object -First 1) -split "=", 2)[1].Trim().Trim('"')
$H = @{ "xi-api-key" = $Key }
$Url = "https://api.elevenlabs.io/v1/convai/phone-numbers/$PhoneId"

Write-Host ""
Write-Host "This turns OFF audio encryption between ElevenLabs and VoIP.ms (calls to cell phones"
Write-Host "are unencrypted on the phone network anyway). The SIP password stays required."
$Ok = Read-Host "Type YES to continue"
if ($Ok -ne "YES") { Say "fix-trunk: cancelled by Rich"; Read-Host "Press Enter to close"; exit 0 }

Write-Host "Type the SIP password for $SipUser. Nothing shows while you type - that is normal."
$Sec = Read-Host "SIP password" -AsSecureString
$Pw = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Sec))
if (-not $Pw) { Say "STOP: empty password"; Read-Host "Press Enter to close"; exit 1 }

$Body = @{ outbound_trunk_config = @{
    address = $SipServer; transport = "tcp"; media_encryption = "disabled"
    credentials = @{ username = $SipUser; password = $Pw }
} } | ConvertTo-Json -Depth 5
try {
    Invoke-RestMethod $Url -Method Patch -Headers $H -ContentType "application/json" -Body $Body | Out-Null
    $R = Invoke-RestMethod $Url -Headers $H
    $T = $R.outbound_trunk
    Say "fix-trunk: trunk now transport=$($T.transport) encryption=$($T.media_encryption) user=$($T.username) has_auth=$($T.has_auth_credentials)"
} catch {
    Say "fix-trunk: UPDATE FAILED: $($_.ErrorDetails.Message)"; Read-Host "Press Enter to close"; exit 1
} finally { $Pw = $null; $Body = $null }

Write-Host ""
Write-Host "Placing the test call to your cell now - answer it."
$Call = @{ agent_id = $AgentId; agent_phone_number_id = $PhoneId; to_number = $TestTo } | ConvertTo-Json
try {
    $C = Invoke-RestMethod "https://api.elevenlabs.io/v1/convai/sip-trunk/outbound-call" -Method Post -Headers $H -ContentType "application/json" -Body $Call
    Say "fix-trunk: test call success=$($C.success) msg=$($C.message) conv=$($C.conversation_id)"
} catch {
    Say "fix-trunk: TEST CALL FAILED: $($_.ErrorDetails.Message)"
}
Write-Host ""
Write-Host "Done. Tell Claude what this window says (and whether your phone rang)."
Read-Host "Press Enter to close"
