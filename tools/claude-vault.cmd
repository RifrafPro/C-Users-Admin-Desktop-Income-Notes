@echo off
rem Claude Vault launcher — always opens Claude Code in the REAL vault repo,
rem WITH Chrome integration on (--chrome) so the browser hands are live every session.
rem The outer "Income Notes" folder is NOT the repo; the vault is nested inside it.
cd /d "C:\Users\Admin\Desktop\Income Notes\C-Users-Admin-Desktop-Income-Notes"
claude --chrome
