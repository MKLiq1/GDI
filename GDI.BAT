@echo off
title RGBQUAD GDI Color Simulator

:: Simulate a full screen RGB fill using PowerShell
:loop
set /p r=Enter RED value (0-255): 
set /p g=Enter GREEN value (0-255): 
set /p b=Enter BLUE value (0-255): 

:: Launch PowerShell to draw a fullscreen window with that color
powershell -NoProfile -Command ^
"[void][Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); ^
$form = New-Object Windows.Forms.Form; ^
$form.WindowState = 'Maximized'; ^
$form.BackColor = [System.Drawing.Color]::FromArgb(%r%,%g%,%b%); ^
$form.TopMost = $true; ^
$form.ShowDialog()"

goto loop
