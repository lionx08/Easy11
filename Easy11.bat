@echo off
title Easy11 v4.0 Apex Edition
cd /d "%~dp0"

if not exist "%~dp0src\easy11.ps1" (
    echo [ERRORE] File src\easy11.ps1 non trovato!
    echo Assicurati di aver estratto l'intero archivio ZIP prima di avviare Easy11.bat.
    pause
    exit /b
)

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

start "" powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0src\easy11.ps1"
exit /b