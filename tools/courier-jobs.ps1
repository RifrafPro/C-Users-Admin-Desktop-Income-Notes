# courier-jobs.ps1 - the courier's deterministic payload. Runs at 08:00/18:00 daily
# on Rich's PC (called by courier-run.cmd AFTER git pull, so it is always current).
# Cloud Claude edits THIS file to give the machine new standing work. ASCII only.

$Repo = Split-Path -Parent $PSScriptRoot
$Log = Join-Path $Repo "vault\courier-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Add-Content -Path $Log -Value "[$Stamp] $m" }

Say "courier heartbeat - payload v2 running"

# JOB: deploy the voice caller if not yet deployed and the key file exists
$Cfg = Join-Path $Repo "vault\automation\voice-agent-builder-buybox.md"
$Deployed = (Get-Content $Cfg -Raw) -match "DEPLOYED"
$KeyFile = Get-ChildItem "$env:USERPROFILE" -Filter ".elevenlabs.env*" -Force -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $Deployed) {
    if ($KeyFile) {
        Say "voice agent not yet deployed and key file present - running deploy-voice-agent.ps1"
        & powershell -ExecutionPolicy Bypass -File (Join-Path $Repo "tools\deploy-voice-agent.ps1") >> $Log 2>&1
    } else {
        Say "voice agent not deployed - BLOCKED: no key file at %USERPROFILE%\.elevenlabs.env"
    }
} else {
    Say "voice agent already deployed - nothing to do"
}

# JOB: headless inbox pass (best effort - logs loudly if claude is unavailable)
$ClaudeCmd = Get-Command claude -ErrorAction SilentlyContinue
if ($ClaudeCmd) {
    Say "running headless claude inbox pass"
    & claude -p "Courier run (headless). Read vault/inbox-for-desktop.md. Execute every OPEN job that can be done headlessly, mark each DONE with a one-line result. Write anything cloud Claude needs to know into vault/inbox-for-cloud.md as an OPEN msg. Obey CLAUDE.md: draft-only, no sends, no purchases. Finish with: git add -A, git commit, git push." >> $Log 2>&1
} else {
    Say "claude CLI NOT FOUND in scheduled-task context - inbox pass skipped (PATH issue)"
}

# Push everything this run produced
git -C $Repo add -A 2>&1 | Out-Null
git -C $Repo commit -m "Courier run $Stamp" 2>&1 | Out-Null
git -C $Repo push 2>&1 | Out-Null
Say "courier run complete"
git -C $Repo add -A 2>&1 | Out-Null
git -C $Repo commit -m "Courier run log $Stamp" 2>&1 | Out-Null
git -C $Repo push 2>&1 | Out-Null
