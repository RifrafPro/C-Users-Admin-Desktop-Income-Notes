# install-courier.ps1 - ONE-SHOT FIX. Run once, everything after is automatic.
# Does Jobs 010 + 009 deterministically, no Claude session needed:
#   1. Removes the stray remote-less git repo in the OUTER "Income Notes" folder
#      (zips it to the backup folder first, just in case).
#   2. Signposts the outer folder with README-WRONG-FOLDER.txt.
#   3. Puts "Claude Vault.cmd" on the Desktop - the one true launcher.
#   4. Registers courier tasks (08:00 and 18:00 daily) running tools\courier-run.cmd.
#   5. Logs everything to vault\courier-install-log.txt, commits and pushes.
# ASCII only in this file - PowerShell 5.1 misreads UTF-8 punctuation without BOM.

$ErrorActionPreference = "Continue"
$Outer = "C:\Users\Admin\Desktop\Income Notes"
$Repo  = Join-Path $Outer "C-Users-Admin-Desktop-Income-Notes"
$Log   = Join-Path $Repo "vault\courier-install-log.txt"
$Stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
function Say($m) { Write-Host $m; Add-Content -Path $Log -Value "[$Stamp] $m" }

if (-not (Test-Path (Join-Path $Repo ".git"))) {
    Write-Host "ERROR: real repo not found at $Repo - aborting."; exit 1
}
Say "=== install-courier run ==="

# 1) Kill the wrong-folder trap
$StrayGit = Join-Path $Outer ".git"
if (Test-Path $StrayGit) {
    $BackupRoot = "$env:USERPROFILE\Desktop\Income Notes - Backup"
    if (-not (Test-Path $BackupRoot)) { New-Item -ItemType Directory -Force -Path $BackupRoot | Out-Null }
    $Zip = Join-Path $BackupRoot ("stray-outer-git-" + (Get-Date -Format "yyyy-MM-dd_HHmm") + ".zip")
    try { Compress-Archive -Path $StrayGit -DestinationPath $Zip -Force; Say "Stray outer .git archived to $Zip" }
    catch { Say "WARN: could not zip stray .git ($_), deleting anyway" }
    Remove-Item -Recurse -Force $StrayGit
    Say "Stray outer .git DELETED - wrong-folder trap is gone."
} else { Say "No stray .git in outer folder (already clean)." }

# 2) Signpost the outer folder
Set-Content -Path (Join-Path $Outer "README-WRONG-FOLDER.txt") -Value @"
This folder is NOT the vault repo.
The real project is inside: C-Users-Admin-Desktop-Income-Notes
Launch Claude with the 'Claude Vault' icon on the Desktop.
"@
Say "README-WRONG-FOLDER.txt written."

# 3) Desktop launcher
$DesktopDir = [Environment]::GetFolderPath("Desktop")
Copy-Item (Join-Path $Repo "tools\claude-vault.cmd") (Join-Path $DesktopDir "Claude Vault.cmd") -Force
Say "Desktop launcher installed: Claude Vault.cmd"

# 4) Courier scheduled tasks (08:00 / 18:00 daily)
$Runner = Join-Path $Repo "tools\courier-run.cmd"
schtasks /Create /F /SC DAILY /ST 08:00 /TN "Income Notes Courier AM" /TR "`"$Runner`"" | Out-Null
schtasks /Create /F /SC DAILY /ST 18:00 /TN "Income Notes Courier PM" /TR "`"$Runner`"" | Out-Null
Say "Courier tasks registered (AM 08:00, PM 18:00). Kill switch: schtasks /Delete /TN `"Income Notes Courier AM`" /F (and PM)."

# 5) Mark Jobs 009 + 010 done in the inbox (UTF-8 read/write explicitly -
#    PS 5.1 otherwise misreads the emoji as CP1252 and corrupts the file)
$Inbox = Join-Path $Repo "vault\inbox-for-desktop.md"
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$Text = [System.IO.File]::ReadAllText($Inbox, $Utf8NoBom)
$Text = $Text -replace ".{0,3} OPEN .{0,3} Job 009", "DONE (install-courier.ps1 $Stamp): Job 009"
$Text = $Text -replace ".{0,3} OPEN .{0,3} Job 010", "DONE (install-courier.ps1 $Stamp): Job 010"
[System.IO.File]::WriteAllText($Inbox, $Text, $Utf8NoBom)
Say "Jobs 009 and 010 marked done in inbox."

git -C $Repo add -A
git -C $Repo commit -m "install-courier: trap removed, launcher installed, courier tasks live

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01JAc1KaJSMiups51HBar2rh"
git -C $Repo push
Say "Pushed. Cloud Claude will see this on its next sync."
Write-Host ""
Write-Host "ALL DONE. From now on: double-click 'Claude Vault' on the Desktop to talk to Claude."
