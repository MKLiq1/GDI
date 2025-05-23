@echo off
:: Pure CMD moving colorful characters (no PowerShell, no VBScript)
:: Requires: Windows 10+ (for ANSI support)

setlocal EnableDelayedExpansion
set ESC=

:: Enable ANSI (Virtual Terminal Processing)
>nul 2>&1 reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f

:: Set console size (optional)
mode con: cols=80 lines=25

:loop
for /L %%i in (1,1,3000) do (
    call :drawRandomChar
    timeout /nobreak /t 0 >nul
)
goto :eof

:drawRandomChar
:: Random X (1 to 80) and Y (1 to 25)
set /a x=%random% %% 80 + 1
set /a y=%random% %% 25 + 1

:: Random RGB color
set /a r=%random% %% 256
set /a g=%random% %% 256
set /a b=%random% %% 256

:: Random printable ASCII character
set /a code=33 + (%random% %% 94)
for /f %%c in ('cmd /u /c "echo(!code!"') do set "char=%%c"

:: Move cursor and print colored char
<nul set /p="!ESC![!y!;!x!H!ESC![38;2;!r!;!g!;!b!m!char!!ESC![0m"
exit /b
