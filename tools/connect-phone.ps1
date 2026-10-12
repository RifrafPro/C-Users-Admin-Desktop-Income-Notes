# connect-phone.ps1 - Job 017 step 2+3: imports +1-571-832-2832 (VoIP.ms) into ElevenLabs as a
# SIP trunk and assigns it to the builder-call agent. Rich runs it himself; the window asks for
# the VoIP.ms SIP password (masked). The password is sent only to ElevenLabs, never saved or logged.
# Reads the API key from %USERPROFILE%\.elevenlabs.env. ASCII only (PS 5.1 encoding rule).

$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Repo = Split-Path -Parent $PSScriptRoot
$Log = Join-Path $Repo "vault\voice-agent-deploy-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Write-Host $m; Add-Content -Path $Log -Value "[$Stamp] $m" }

$AgentId = "agent_9201m3gbrsdcftm8f21bygh8cwgf"
$Number = "+15718322832"
$SipServer = "sanjose2.voip.ms"   # the DID's POP in the VoIP.ms portal (10-12); change both if the POP moves
$SipUser = "577131"

$EnvFile = Get-ChildItem "$env:USERPROFILE" -Filter ".elevenlabs.env*" -Force -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $EnvFile) { Say "STOP: no %USERPROFILE%\.elevenlabs.env key file"; Read-Host "Press Enter to close"; exit 1 }
$Key = ((Get-Content $EnvFile.FullName | Where-Object { $_ -match "=" } | Select-Object -First 1) -split "=", 2)[1].Trim().Trim('"')
$H = @{ "xi-api-key" = $Key }

$Existing = @(Invoke-RestMethod "https://api.elevenlabs.io/v1/convai/phone-numbers" -Headers $H) | Where-Object { $_.phone_number -eq $Number }
if ($Existing) { Say "Already imported: $Number (id $($Existing[0].phone_number_id)) - nothing to do"; Read-Host "Press Enter to close"; exit 0 }

Write-Host ""
Write-Host "Type your VoIP.ms SIP password (main account $SipUser). Nothing shows while you type - that is normal."
$Sec = Read-Host "SIP password" -AsSecureString
$Pw = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($Sec))
if (-not $Pw) { Say "STOP: empty password"; Read-Host "Press Enter to close"; exit 1 }

$Body = @{
    phone_number = $Number
    label = "FRESH GROUND VoIP.ms"
    provider = "sip_trunk"
    agent_id = $AgentId
    outbound_trunk_config = @{
        address = $SipServer
        transport = "tcp"
        media_encryption = "allowed"
        credentials = @{ username = $SipUser; password = $Pw }
    }
} | ConvertTo-Json -Depth 5

try {
    $R = Invoke-RestMethod "https://api.elevenlabs.io/v1/convai/phone-numbers" -Method Post -Headers $H -ContentType "application/json" -Body $Body
    Say "IMPORTED $Number -> phone_number_id $($R.phone_number_id), assigned to $AgentId (outbound via $SipServer TCP)"
} catch {
    $Msg = $_.ErrorDetails.Message
    Say "IMPORT FAILED: $Msg"
} finally {
    $Pw = $null; $Body = $null
}
Write-Host ""
Write-Host "Done. Tell Claude what this window says."
Read-Host "Press Enter to close"
