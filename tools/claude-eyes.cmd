@echo off
rem Claude Eyes - starts a Remote Control session on this PC so cloud Claude
rem can direct work here (files, browser, DNS) while Rich watches from anywhere.
rem --chrome: spawned RC sessions default to Chrome OFF (per --help, v2.1.295) - force it on.
rem Leave the window open; closing it ends the link.
cd /d "C:\Users\Admin\Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes"
claude remote-control --chrome --name "Claude Eyes"
