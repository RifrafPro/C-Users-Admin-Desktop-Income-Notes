@echo off
rem Courier runner v2 - Task Scheduler entry point (08:00 / 18:00 daily).
rem FROZEN FILE: never edit this - put all logic in tools\courier-jobs.ps1,
rem which is pulled fresh each run. (Editing a .cmd that is mid-execution
rem corrupts it; the .ps1 payload has no such hazard.)
set REPO=C:\Users\Admin\Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes
cd /d "%REPO%"
git pull > nul 2>&1
powershell -ExecutionPolicy Bypass -File "%REPO%\tools\courier-jobs.ps1"
