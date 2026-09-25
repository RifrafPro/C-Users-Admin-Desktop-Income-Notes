# deploy-voice-agent.ps1 - creates the FRESH GROUND builder-call agent on ElevenLabs.
# No Claude session involved. Reads the key from %USERPROFILE%\.elevenlabs.env
# (line: ELEVENLABS_API_KEY=...), creates the agent via API, saves the agent_id
# to the vault, commits and pushes. ASCII only (PS 5.1 encoding rule).

$ErrorActionPreference = "Stop"
# PS 5.1 defaults to old TLS, which modern APIs refuse - force TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Repo = Split-Path -Parent $PSScriptRoot
$Log = Join-Path $Repo "vault\voice-agent-deploy-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Write-Host $m; Add-Content -Path $Log -Value "[$Stamp] $m" }

# 1) Key - accept the file even if Notepad silently added .txt
$EnvFile = "$env:USERPROFILE\.elevenlabs.env"
if (-not (Test-Path $EnvFile)) {
    $Alt = Get-ChildItem "$env:USERPROFILE" -Filter ".elevenlabs.env*" -Force -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($Alt) { $EnvFile = $Alt.FullName; Write-Host "Using key file: $EnvFile" }
}
if (-not (Test-Path $EnvFile)) {
    Write-Host "NO KEY FILE. Run:  notepad `"$env:USERPROFILE\.elevenlabs.env`""
    Write-Host "Put one line in it:  ELEVENLABS_API_KEY=your_key_here   then save and rerun."
    exit 1
}
$KeyLine = Get-Content $EnvFile | Where-Object { $_ -match "ELEVENLABS_API_KEY" } | Select-Object -First 1
$Key = (($KeyLine -split "=",2)[1]).Trim().Trim('"').Trim("'")
if (-not $Key) { Write-Host "Key file exists but no ELEVENLABS_API_KEY= line found in $EnvFile"; exit 1 }
if ($Key -notmatch "^(sk_|xi-)") { Write-Host ("WARNING: key does not start with sk_ - you may have copied the key NAME instead of the key VALUE. Trying anyway...") }

# 2) Validate key - distinguish a bad key from a network problem
try {
    $Me = Invoke-RestMethod -Uri "https://api.elevenlabs.io/v1/user" -Headers @{ "xi-api-key" = $Key }
    Say ("Key VALID. Account tier: " + $Me.subscription.tier)
} catch {
    $Status = $null
    try { $Status = [int]$_.Exception.Response.StatusCode } catch {}
    if ($Status -eq 401) {
        Say "Key REJECTED (HTTP 401) - the key itself is wrong or revoked."
        Write-Host "Make a FRESH key at elevenlabs.io -> My Account -> API Keys, copy it from the"
        Write-Host "creation popup (the only time the full key is shown), update the file, rerun."
    } elseif ($Status) {
        Say ("ElevenLabs returned HTTP " + $Status + " - key may be scope-restricted. Recreate it with default permissions.")
    } else {
        Say ("NETWORK problem, not a key problem: " + $_.Exception.Message)
        Write-Host "Check the internet connection and rerun - do NOT recreate the key for this."
    }
    exit 1
}

# 3) The agent (prompt mirrors vault/automation/voice-agent-builder-buybox.md v1)
$Prompt = @"
You are the AI assistant for FRESH GROUND, a land acquisition business run by Rich Fabiani in the DC Metro area. You are calling a luxury homebuilder's office to learn what lots they buy so FRESH GROUND can bring them exactly what they want. This is a business-to-business call. Be brief, warm, professional. ALWAYS disclose you are an AI in your first sentence. Never claim to be human, never invent a name. If they want a human, say Rich will call personally and ask the best time, then end warmly. Ask these questions ONE at a time, listening fully: 1 Which submarkets are you actively buying lots in right now? 2 What lot size and characteristics do you look for - minimum square footage, width, flat vs slope, trees, utilities? 3 THE KEY QUESTION: When a lot fits your program, what is a realistic range you will pay for the dirt? If they hesitate say: For context we are seeing Langley Forest lots listed around 2.5 million dollars - is that the world you play in or are you buying below that? Do not end the call without a number or range - circle back once politely if dodged. 4 Do you prefer to buy the lot directly or take an assignment of contract? 5 How many lots do you want per year - are you behind or ahead right now? 6 Any areas or lot types you absolutely avoid - RPA, floodplain, busy roads, HOAs? 7 Who should we send opportunities to and how - email, call, or text? Close with: This is exactly what we needed. When we have a lot that fits, Rich will bring it to you before anyone else sees it. Thank you. HARD RULES: You have nothing to sell today. If asked what do you have, say: a couple of things brewing in McLean and Vienna - Rich shares addresses once there is a fit and an agreement in place. NEVER give an address. No price commitments, no negotiation, no legal or contract talk - that is Rich. If voicemail: leave a 20 second message saying who you are, that FRESH GROUND sources McLean and Vienna teardown lots and wants to fit their buy box, and thank them.
"@
$FirstMsg = "Hi, this is the AI assistant for FRESH GROUND - we source teardown lots in the DC area. Rich Fabiani asked me to reach out. Do you have two minutes for a few quick questions about what you look for in lots? I promise to be fast."

$Body = @{
    name = "FRESH GROUND Builder Buy-Box v1"
    conversation_config = @{
        agent = @{
            prompt = @{ prompt = $Prompt }
            first_message = $FirstMsg
            language = "en"
        }
    }
} | ConvertTo-Json -Depth 8

# 4) Create it
try {
    $Resp = Invoke-RestMethod -Method Post -Uri "https://api.elevenlabs.io/v1/convai/agents/create" `
        -Headers @{ "xi-api-key" = $Key; "Content-Type" = "application/json" } -Body $Body
    $AgentId = $Resp.agent_id
    Say ("AGENT CREATED. agent_id: " + $AgentId)
} catch {
    $Err = $_.ErrorDetails.Message
    if (-not $Err) { $Err = $_.Exception.Message }
    Say ("Agent creation FAILED: " + $Err)
    git -C $Repo add -A; git -C $Repo commit -m "voice agent deploy FAILED - log attached"; git -C $Repo push
    Write-Host "Failure pushed to the vault - cloud Claude will see it and fix the script."
    exit 1
}

# 5) Record + push
Add-Content -Path (Join-Path $Repo "vault\automation\voice-agent-builder-buybox.md") -Value @"

## DEPLOYED $Stamp
- **agent_id:** $AgentId
- Key stored locally at %USERPROFILE%\.elevenlabs.env (never committed).
- Next: attach phone number + ear test (cloud has the ball).
"@
git -C $Repo add -A
git -C $Repo commit -m "Voice agent DEPLOYED to ElevenLabs (builder buy-box v1)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01JAc1KaJSMiups51HBar2rh"
git -C $Repo push
Say "Pushed. Test the agent by voice in the ElevenLabs dashboard: elevenlabs.io -> Agents."
Write-Host ""
Write-Host "ALL DONE - the caller exists. Cloud Claude takes it from here."
