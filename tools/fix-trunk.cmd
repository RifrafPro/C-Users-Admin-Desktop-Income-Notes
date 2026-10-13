@echo off
rem FIX TRUNK - VoIP.ms 603 fix: plain TCP, audio encryption off, re-enter SIP password, test call.
rem Asks for the VoIP.ms SIP password in this window; it is never saved.
powershell -ExecutionPolicy Bypass -File "C:\Users\Admin\Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes\tools\fix-trunk.ps1"
