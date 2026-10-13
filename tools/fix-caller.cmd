@echo off
rem FIX CALLER - VoIP.ms 603 fix step 2: From user = 577131_fg, re-enter SIP password, test call.
rem Asks for the VoIP.ms SIP password in this window; it is never saved.
powershell -ExecutionPolicy Bypass -File "C:\Users\Admin\Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes\tools\fix-caller.ps1"
