# backup-vault.ps1 — snapshot the whole vault into the local backup folder.
# Run from anywhere:  powershell -ExecutionPolicy Bypass -File "C:\Users\Admin\Desktop\Income Notes\tools\backup-vault.ps1"
# What it makes, per run, inside the backup folder:
#   vault-YYYY-MM-DD_HHmm\           full readable copy of every file (no .git)
#   vault-YYYY-MM-DD_HHmm\vault-YYYY-MM-DD_HHmm.bundle   git bundle = FULL history,
#       restorable with: git clone vault-....bundle restored-vault
# Keeps the newest 10 snapshots, deletes older ones automatically.

param(
    # Default assumes the folder Rich described. Pass -BackupRoot to override.
    [string]$BackupRoot = "$env:USERPROFILE\Desktop\Income Notes - Backup"
)

$ErrorActionPreference = "Stop"
$Repo = Split-Path -Parent $PSScriptRoot   # script lives in <repo>\tools\

if (-not (Test-Path (Join-Path $Repo ".git"))) {
    Write-Error "Not a git repo: $Repo — aborting."
    exit 1
}

# Find the backup folder even if the name varies slightly (e.g. "income noted - backup")
if (-not (Test-Path $BackupRoot)) {
    $desktop = Join-Path $env:USERPROFILE "Desktop"
    $candidate = Get-ChildItem $desktop -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match "income" -and $_.Name -match "backup" } |
        Select-Object -First 1
    if ($candidate) { $BackupRoot = $candidate.FullName }
    else {
        New-Item -ItemType Directory -Force -Path $BackupRoot | Out-Null
        Write-Host "Created backup folder: $BackupRoot"
    }
}

$Stamp = Get-Date -Format "yyyy-MM-dd_HHmm"
$Dest  = Join-Path $BackupRoot "vault-$Stamp"
New-Item -ItemType Directory -Force -Path $Dest | Out-Null

# 1) Full readable copy (everything except .git — the bundle carries history)
robocopy $Repo $Dest /E /XD .git /R:2 /W:2 /NFL /NDL /NJH | Out-Null
if ($LASTEXITCODE -ge 8) { Write-Error "robocopy failed (code $LASTEXITCODE)"; exit 1 }

# 2) Git bundle — complete history, single restorable file
git -C $Repo bundle create (Join-Path $Dest "vault-$Stamp.bundle") --all
if ($LASTEXITCODE -ne 0) { Write-Error "git bundle failed"; exit 1 }

# 3) Rotate: keep newest 10 snapshots
Get-ChildItem $BackupRoot -Directory -Filter "vault-*" |
    Sort-Object Name -Descending | Select-Object -Skip 10 |
    Remove-Item -Recurse -Force

$Count = (Get-ChildItem $Dest -Recurse -File | Measure-Object).Count
Write-Host "✅ Backup complete: $Dest ($Count files + full-history bundle)"
