@echo off
title GDI Flashing Fake OS
mode con: cols=80 lines=25

:: Try to make the window full-screen
powershell -command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('{F11}')}" 2>nul

:: Disable echo and clear screen
cls

:loop
color 1F
cls
echo.
echo            ████████  FAKE OS BOOT SEQUENCE ████████
echo.
echo               Simulating GDI Flashing Screen
echo               Press CTRL+C to exit at any time.
timeout /nobreak /t 1 >nul

color 4F
cls
echo.
echo            ████████  FAKE OS WARNING ████████
echo.
echo               ERROR 0x0000FF: SCREEN RENDER FAILURE
echo               Press CTRL+C to exit at any time.
timeout /
