@echo off
mkdir %SYSTEMDRIVE%\Hajkusi-Tool\Resources\
goto:IsAdmin

:IsAdmin
cls
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 ( goto UACPrompt
) Else ( cls && goto Filepicker  )

:UACPrompt
cls
Powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b
exit /b 1

:FilePicker
if exist "%SYSTEMDRIVE%\Hajkusi-Tool\Resources\FilePicker.exe" ( goto Again ) else ( goto DownloadFilePicker )
:DownloadFilePicker
curl -g -L -# -o "%SYSTEMDRIVE%\Hajkusi-Tool\Resources\FilePicker.exe" "https://github.com/hajkusi/Hajkusi-Tool/raw/main/Files/FilePicker.exe"
cls
goto Again

:Again
for /f "skip=1 tokens=1" %%A in ('wmic cpu get NumberOfLogicalProcessors') do (
set threads=%%A
goto next
)
:next
cls
echo You have %threads% threads
Set /p "Threads=%DEL% Choose Number Of Threads You Want To Start Your Choosed App With>: 
cls
cd %SYSTEMDRIVE%\Hajkusi-Tool\Resources\
for /f "tokens=* delims=\" %%i in ('FilePicker.exe exe') do (
    if "%%i" == "cancelled by user" exit /b
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Application Name" /t REG_SZ /d "%%~ni%%~xi" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "DSCP Value" /t REG_SZ /d "46" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local IP" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Local Port" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Protocol" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote IP" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Remote Port" /t REG_SZ /d "*" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Throttle Rate" /t REG_SZ /d "-1" /f
    Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\QoS\%%~ni%%~xi" /v "Version" /t REG_SZ /d "1.0" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%~ni%%~xi" /v "MaxLoaderThreads" /t REG_DWORD /d "%Threads%" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX11.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX11.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX11.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX12.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX12.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Control_DX12.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    Goto PromptForDiscordPriority
    :ContinueDiscord
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    Goto PromptForOperaPriority
    :ContinueOpera
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Opera.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Opera.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Opera.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\browser_assistant.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\browser_assistant.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
    Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\browser_assistant.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "5" /f
)
goto End

:PromptForDiscordPriority
cls
SET /P Discord=Change Discord Priority To Below Normal?\Zmienic Priorytet Dicorda Na Ponizej_Normalnego?(Y/N)
IF /I "%DISCORD%" NEQ "Y" goto PromptForOperaPriority
IF /I "%DISCORD%" NEQ "N" goto ContinueDiscord

:PromptForOperaPriority
cls
SET /P Opera=Change Opera Priority To Below Normal?\Zmienic Priorytet Opery Na Ponizej Normalnego?(Y/N)
IF /I "%OPERA%" NEQ "Y" goto End
IF /I "%OPERA%" NEQ "N" goto ContinueOpera

:End
rmdir %SYSTEMDRIVE%\Hajkusi-Tool\ /s /q
cls
echo Finished, Please Reboot Your Device For Changes To Apply.\Zakonczono, Prosze Uruchom Ponownie Twoje Urzadzenie zeby Zastosowac
pause
exit /b
