# deploy-voice-agent.ps1 - creates the FRESH GROUND builder-call agent on ElevenLabs.
# No Claude session involved. Reads the key from %USERPROFILE%\.elevenlabs.env
# (line: ELEVENLABS_API_KEY=...), creates the agent via API, saves the agent_id
# to the vault, commits and pushes. ASCII only (PS 5.1 encoding rule).

$ErrorActionPreference = "Stop"
& powershell -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot "install-advisor-rules.ps1")
# PS 5.1 defaults to old TLS, which modern APIs refuse - force TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Repo = Split-Path -Parent $PSScriptRoot
$Log = Join-Path $Repo "vault\voice-agent-deploy-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Write-Host $m; Add-Content -Path $Log -Value "[$Stamp] $m" }

function Get-ErrBody($e) {
    $b = $e.ErrorDetails.Message
    if (-not $b) {
        try {
            $S = $e.Exception.Response.GetResponseStream()
            $b = (New-Object System.IO.StreamReader($S)).ReadToEnd()
        } catch { $b = $e.Exception.Message }
    }
    return $b
}

# 1) Key - read the stored one if any; the window itself collects a new one when needed.
$EnvFile = "$env:USERPROFILE\.elevenlabs.env"
$Alt = Get-ChildItem "$env:USERPROFILE" -Filter ".elevenlabs.env*" -Force -ErrorAction SilentlyContinue | Select-Object -First 1
if ($Alt) { $EnvFile = $Alt.FullName }
$Key = ""
if (Test-Path $EnvFile) {
    $KeyLine = Get-Content $EnvFile | Where-Object { $_ -match "ELEVENLABS_API_KEY" } | Select-Object -First 1
    if ($KeyLine) { $Key = (($KeyLine -split "=",2)[1]).Trim().Trim('"').Trim("'") }
}

# 2) Validate; if the key is dead, ask for a fresh one RIGHT HERE in this window.
#    (invalid_api_key -> prompt; any other error, e.g. permissions, passes through.)
$script:LastErr = ""
function Test-Key($k) {
    if (-not $k -or $k -notmatch "^sk_") { $script:LastErr = "no usable key stored"; return $false }
    try {
        $Me = Invoke-RestMethod -Uri "https://api.elevenlabs.io/v1/user" -Headers @{ "xi-api-key" = $k }
        Say ("Key VALID. Tier: " + $Me.subscription.tier)
        return $true
    } catch {
        $script:LastErr = Get-ErrBody $_
        if ($script:LastErr -match "invalid_api_key") { return $false }
        Say ("Account-read limited (key may be scope-restricted) - proceeding: " + $script:LastErr)
        return $true
    }
}

$Tries = 0
while (-not (Test-Key $Key)) {
    if ($Tries -ge 4) { Say "Four failed key attempts - stopping so we do not lock anything."; exit 1 }
    Write-Host ""
    Write-Host "==========================================================="
    Write-Host " THE STORED KEY IS DEAD ($script:LastErr)"
    Write-Host " Get a fresh one - 60 seconds:"
    Write-Host "  1. Browser: elevenlabs.io -> sign in -> profile icon -> API Keys"
    Write-Host "  2. Click 'Create API Key' -> name it anything -> create"
    Write-Host "  3. In the popup click COPY (only moment the full key shows)"
    Write-Host "  4. Come BACK TO THIS WINDOW, RIGHT-CLICK once, press Enter"
    Write-Host "==========================================================="
    $NewKey = Read-Host " Paste the new key now"
    $Key = $NewKey.Trim().Trim('"').Trim("'")
    if ($Key -match "^sk_") {
        Set-Content -Path "$env:USERPROFILE\.elevenlabs.env" -Value ("ELEVENLABS_API_KEY=" + $Key)
        $EnvFile = "$env:USERPROFILE\.elevenlabs.env"
        Write-Host " Saved. Checking it with ElevenLabs..."
    } else {
        Write-Host " That text does not start with sk_ so it is not the key value. Try step 3 again."
    }
    $Tries++
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

# 4) Create it - if the key lacks permissions or died, collect a better one right here
$AgentId = $null
$CTries = 0
while (-not $AgentId) {
    try {
        $Resp = Invoke-RestMethod -Method Post -Uri "https://api.elevenlabs.io/v1/convai/agents/create" `
            -Headers @{ "xi-api-key" = $Key; "Content-Type" = "application/json" } -Body $Body
        $AgentId = $Resp.agent_id
        Say ("AGENT CREATED. agent_id: " + $AgentId)
    } catch {
        $Err = Get-ErrBody $_
        Say ("Agent creation FAILED. ElevenLabs said EXACTLY: " + $Err)
        if (($Err -match "missing_permissions|invalid_api_key") -and ($CTries -lt 3)) {
            Write-Host ""
            Write-Host "==========================================================="
            Write-Host " THIS KEY IS REAL BUT WAS CREATED WITH PERMISSIONS SWITCHED OFF."
            Write-Host " Make one more key, UNRESTRICTED this time - 60 seconds:"
            Write-Host "  1. Browser: elevenlabs.io -> profile icon -> API Keys -> Create API Key"
            Write-Host "  2. IMPORTANT: if the dialog shows a 'Restrict key' option or a list of"
            Write-Host "     permission toggles, choose FULL ACCESS / leave EVERYTHING ON."
            Write-Host "  3. Click COPY in the popup."
            Write-Host "  4. Come back HERE, RIGHT-CLICK once, press Enter."
            Write-Host "==========================================================="
            $NewKey = Read-Host " Paste the unrestricted key now"
            $NewKey = $NewKey.Trim().Trim('"').Trim("'")
            if ($NewKey -match "^sk_") {
                $Key = $NewKey
                Set-Content -Path "$env:USERPROFILE\.elevenlabs.env" -Value ("ELEVENLABS_API_KEY=" + $Key)
                Write-Host " Saved. Retrying agent creation..."
            } else {
                Write-Host " That text does not start with sk_ - copy the key VALUE from the popup and try again."
            }
            $CTries++
        } else {
            git -C $Repo add -A; git -C $Repo commit -m "voice agent deploy FAILED - verbatim ElevenLabs error in log"; git -C $Repo push
            Write-Host "Failure pushed to the vault - cloud Claude sees the exact error and acts on it."
            exit 1
        }
    }
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
