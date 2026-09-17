@echo off
rem Courier run - executed by Task Scheduler at 08:00 and 18:00 daily.
rem Pulls the vault, lets Claude execute inbox jobs headlessly, pushes results.
set REPO=C:\Users\Admin\Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes
cd /d "%REPO%"
git pull >> "%REPO%\vault\courier-log.txt" 2>&1
claude -p "Courier run (headless). Read vault/inbox-for-desktop.md. Execute every OPEN job that can be done headlessly, mark each DONE with a one-line result. Write anything cloud Claude needs to know into vault/inbox-for-cloud.md as an OPEN msg. Obey CLAUDE.md: draft-only, no sends, no purchases. Finish with: git add -A, git commit, git push." >> "%REPO%\vault\courier-log.txt" 2>&1
rem Safety net: push anything Claude staged but did not push.
git add -A >nul 2>&1
git commit -m "Courier run leftovers" >nul 2>&1
git push >nul 2>&1
