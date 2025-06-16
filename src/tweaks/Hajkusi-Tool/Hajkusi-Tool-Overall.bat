@echo off
goto Appearance

:Appearance
:Appearance
REM Show Detailed BSoD
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1
REM Blank/Color Character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
REM Add ANSI escape sequences
reg add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1 
cls
goto LanguageChooser

:LanguageChooser
Mkdir %SYSTEMDRIVE%\Hajkusi-Tool\Resources\ >nul 2>&1
cls
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Polski                                                                              %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m English
echo.
%SYSTEMROOT%\System32\choice.exe /c:12 /n /m "%DEL%                             Select a corresponding number to the options above > "
set choice=%errorlevel%
If "%choice%"=="1" goto:DownloadPolish
If "%choice%"=="2" goto:DownloadEnglish

:DownloadPolish
cd %~dp0
curl -g -L -# -o "%TEMP%\Hajkusi-Tool-Polish.exe" "https://raw.githubusercontent.com/hajkusi/Hajkusi-Tool/main/src/tweaks/Hajkusi-Tool/Hajkusi-Tool-Polish.exe"
copy %TEMP%\Hajkusi-Tool-Polish.exe %USERPROFILE%\Desktop\
pause

:DownloadEnglish
cd %~dp0
curl -g -L -# -o "%TEMP%\Hajkusi-Tool-English.exe" "https://raw.githubusercontent.com/hajkusi/Hajkusi-Tool/main/src/tweaks/Hajkusi-Tool/Hajkusi-Tool-English.exe"
copy %TEMP%\Hajkusi-Tool-English.exe %USERPROFILE%\Desktop\
pause