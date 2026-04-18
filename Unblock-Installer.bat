@echo off
:: ==========================================
:: Autumn Installer Unlocker
:: Removes Windows "blocked from another computer"
:: security flag from the installer.
:: ==========================================
title Autumn — Unblock Installer

echo.
echo  =============================================
echo   Autumn Installer Unlocker
echo  =============================================
echo.

:: Find the installer in the same folder as this script
set "SCRIPT_DIR=%~dp0"
set "FOUND="

for %%F in ("%SCRIPT_DIR%Autumn_*_x64-setup.exe" "%SCRIPT_DIR%Autumn_*.exe") do (
    if exist "%%F" (
        set "FOUND=%%F"
    )
)

if not defined FOUND (
    echo  [!] No Autumn installer found in this folder.
    echo      Make sure this file is in the same folder as the installer.
    echo.
    pause
    exit /b 1
)

echo  [*] Found installer: %FOUND%
echo  [*] Unblocking...
echo.

powershell -NoProfile -Command "Unblock-File -Path '%FOUND%'; Write-Host ' [OK] Unblocked successfully!' -ForegroundColor Green"

echo.
echo  You can now double-click the installer to run it.
echo.
pause
