@echo off
cd %systemroot%\system32
call :IsAdmin
cls

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You Must Have Administrator Rights To Continue ... 
 Pause & Exit
)

:PROMPT1
SET /P AREYOUSURE= Do You Want To Delete Download Files? (You can choose which files are deleted)\Chcesz Usunac Pliki Z Folderu Pobrane (Mozesz wybierac,ktore)(Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" goto home
IF /I "%AREYOUSURE%" NEQ "N" goto Y
:Y
cd %userprofile%\Downloads
del *.* /q /p /s
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s || del "%%i" /s)
goto home

:home
rmdir /s /q %SYSTEMDRIVE%\Scripts\
rmdir /s /q %SYSTEMDRIVE%\OTO\
rmdir /s /q %SYSTEMDRIVE%\OneDriveTemp\
rmdir /s /q %SYSTEMDRIVE%\$WinREAgent\
rmdir /s /q %SYSTEMDRIVE%\PerfLogs\
cd C:\Windows\Temp
cls
title Deleting Files And Folders From Temp In Progress\Trwa Usuwanie Plikow I Folderow z Temp 
echo deleting.../usuwanie...
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
del *.* /q 
cd C:\Windows\Prefetch
del *.* /q
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
rd %temp%
md %temp%
mkdir %temp%
goto PromptDism

:PromptDism
cls
echo Do you want to clear you winsxs folder\Czy Chcesz Oczyscic Twoj Folder Winsxs (Good For More Space)\(Dobre zeby zwolnic miejsce) 
SET /P Dism=Yes or No\Tak czy Nie (Y/N)?
IF /I "%DISM%" NEQ "Y" goto TakeOwn
IF /I "%DISM%" NEQ "N" goto Dism

cls
:Dism
cls
Dism.exe /Online /Cleanup-Image /StartComponentCleanup
Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
goto TakeOwn

:TakeOwn
takeown /f %LocalAppData%\Microsoft\Windows\Explorer\ /r /d y
takeown /f %%G\AppData\Local\Temp\ /r /d y
takeown /f %SystemRoot%\TEMP\ /r /d y
takeown /f %systemdrive%\$Recycle.bin\ /r /d y
takeown /f C:\Users\%USERNAME%\AppData\Local\BraveSoftware\Brave-Browser\User Data\Default\Code Cache\ /r /d y
takeown /f C:\Users\%USERNAME%\AppData\Local\Fortnitegame\saved\ /r /d y
takeown /f C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Code Cache\ /r /d y
goto PromptForTrash

:PromptForTrash
cls
echo Do You Want To Clear Your Trash Folder\Chcesz Usunac Pliki Z Kosza
SET /P ISTHATTRUE=Yes or No\Tak Czy Nie? (Y/N)?
IF /I "%ISTHATTRUE%" NEQ "Y" goto Powershell
IF /I "%ISTHATTRUE%" NEQ "N" goto Trash

:Trash
cls
Echo Cleaning Trash\Oczyszczanie Kosza
del /q /s %systemdrive%\$Recycle.bin\*
for /d %%x in (%systemdrive%\$Recycle.bin\*) do @rd /s /q "%%x"
cls
goto PowerShell

:PowerShell
powershell.exe Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue
cls
goto PromptForTempFortniteAndEpicGames

:PromptForTempFortniteAndEpicGames
cls
echo Do You Want To Clear Your Fortnite and Epic Games Temp Files\Chcesz Usunac Pliki Temp Fortnite i Epic Games
SET /P TempFortniteAndEpicGames=Yes or No\Tak Czy Nie? (Y/N)?
IF /I "%TEMPFORTNITEANDEPICGAMES%" NEQ "Y" goto LogFiles
IF /I "%TEMPFORTNITEANDEPICGAMES%" NEQ "N" goto TempFortniteAndEpicGames

:TempFortniteAndEpicGames
cls
Echo Clearing Epic Games and Fortnite Temporary Files\Czyszczenie Plikow Tymczasowych Epic Games I Fortnite:
del /F /S /Q "%SystemRoot%\TEMP*.*"
for /D %%G in ("%SystemRoot%\TEMP*") do RD /S /Q "%%G"
for /D %%G in ("%SystemDrive%\Users*") do erase /F /S /Q "%%G\AppData\Local\Temp*.*"
for /D %%G in ("%SystemDrive%\Users*") do RD /S /Q "%%G\AppData\Local\Temp\" 
del %localappdata%\EpicGamesLauncher\Saved\Logs /F /Q /S
del %localappdata%\CrashReportClient\Saved\Logs /F /Q /S
cls
goto SteamTemp

:SteamTemp
del "%localappdata%\Steam\htmlcache\Code Cache" /F /Q /S
del %localappdata%\Steam\htmlcache\GPUCache /F /Q /S
del %localappdata%\Steam\htmlcache\Cache /F /Q /S
goto OriginTempAndTelemetry

:OriginTempAndTelemetry
del %AppData%\Origin\Telemetry /F /Q /S
del %AppData%\Origin\Logs /F /Q /S
del %AppData%\Origin\NucleusCache /F /Q /S
del %AppData%\Origin\ConsolidatedCache /F /Q /S
del %AppData%\Origin\CatalogCache /F /Q /S
del %localAppData%\Origin\ThinSetup /F /Q /S
del %AppData%\Origin\Telemetry /F /Q /S
del %localAppData%\Origin\Logs /F /Q /S
goto Battle.netTemp

:Battle.netTemp
del %localAppData%\Battle.net\Cache /F /Q /S
del %AppData%\Battle.net\Logs /F /Q /S
del %AppData%\Battle.net\Errors /F /Q /s
goto GoogleChromeTemp

:GoogleChromeTemp
del "%LocalAppData%\Google\Chrome\User Data\Default\Cache" /F /Q /S
del "%LocalAppData%\Google\Chrome\User Data\Default\Media Cache" /F /Q /S
del "%LocalAppData%\Google\Chrome\User Data\Default\GPUCache" /F /Q /S
del "%LocalAppData%\Google\Chrome\User Data\Default\Storage\ext" /F /Q /S
del "%LocalAppData%\Google\Chrome\User Data\Default\Service Worker" /F /Q /S
del "%LocalAppData%\Google\Chrome\User Data\ShaderCache" /F /Q /S
goto MicrosoftEdgeTemp

:MicrosoftEdgeTemp
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Media Cache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge\User Data\Default\GPUCache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Storage\ext" /F /Q /S
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Service Worker" /F /Q /S
del "%LocalAppData%\Microsoft\Edge\User Data\ShaderCache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Cache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Media Cache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\GPUCache" /F /Q /S
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Storage\ext" /F /Q /S
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Service Worker" /F /Q /S
del "%LocalAppData%\Microsoft\Edge SxS\User Data\ShaderCache" /F /Q /S
goto OperaTemp

:OperaTemp
del "%LocalAppData%\Opera Software\Opera Stable\cache" /F /Q /S
del "%AppData%\Opera Software\Opera Stable\GPUCache" /F /Q /S
del "%AppData%\Opera Software\Opera Stable\ShaderCache" /F /Q /S
del "%AppData%\Opera Software\Opera Stable\Jump List Icons" /F /Q /S
del "%AppData%\Opera Software\Opera Stable\Jump List IconsOld\Jump List Icons" /F /Q /S
goto VivaldiTemp

:VivaldiTemp
del "%LocalAppData%\Vivaldi\User Data\Default\Cache" /F /Q /S
goto WindowsDefenderTemp

:WindowsDefenderTemp
del "%ProgramData%\Microsoft\Windows Defender\Network Inspection System\Support\*.log" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\CacheManager" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\ReportLatency\Latency" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Service\*.log" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Scans\MetaStore" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Support" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Quick" /F /Q /S
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Resource" /F /Q /S
goto FontCache

:FontCache
net stop FontCache
net stop FontCache3.0.0.0
del "%WinDir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.dat" /F /Q /S
del "%WinDir%\SysNative\FNTCACHE.DAT" /F /Q /S
del "%WinDir%\System32\FNTCACHE.DAT" /F /Q /S
net start FontCache
net start FontCache3.0.0.0
goto LogFiles

:LogFiles
cls
Echo Clearing Log Files From The System\Usuwanie plikow dziennika z systemu
echo.
@echo off
cd/
del *.log /a /s /q /f
powershell taskkill /F /IM explorer.exe
timeout 2 /nobreak>nul
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
DEL /f /s /q %temp%\
DEL /f /s /q %temp%\*.tmp
DEL /f /s /q %temp%\*
DEL /f /s /q %systemdrive%\*.tmp
DEL /f /s /q %systemdrive%\*._mp
DEL /f /s /q %systemdrive%\*.log
DEL /f /s /q %systemdrive%\*.gid
DEL /f /s /q %systemdrive%\*.chk
DEL /f /s /q %systemdrive%\*.old
DEL /f /s /q %systemdrive%\recycled\*.*
DEL /f /s /q %systemdrive%\$Recycle.Bin\*.*
DEL /f /s /q %windir%\*.bak
DEL /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
DEL /f /q %userprofile%\cookies\*.*
DEL /f /q %userprofile%\recent\*.*
DEL /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
DEL /f /s /q "%userprofile%\Local Settings\Temp\*.*"
DEL /f /s /q "%userprofile%\recent\*.*"
timeout 3 /nobreak>nul
powershell Start explorer.exe
pause
cls
goto Net

:Net
net stop UsoSvc
net stop bits
net stop dosvc
goto PromptForWindowspdateTempFiles

:PromptForWindowsUpdateTempFiles
cls
echo Do You Want To Clear Your Windows Update Temp Folder(Safe)\Chcesz Usunac Pliki Tymczasowe Windows Update(Bezpieczne)
SET /P WindowsUpdate=Yes or No\Tak Czy Nie? (Y/N)?
IF /I "%WINDOWSUPDATE%" NEQ "Y" goto PromptForWindowsCleaner
IF /I "%WINDOWSUPDATE%" NEQ "N" goto WindowsUpdate

:WindowsUpdate
Echo Deleting Windows Update Temp Files\Usuwanie Plikow Tymczasowych Windows Update:
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
cls
echo.
cls
goto PromptForWindowsCleaner

:PromptForWindowsCleaner
cls
echo Do you Want To Start Windows Cleaner (cleanmgr.exe)\Czy Chcesz Uruchomic Narzedzie Do Czyszczenia Systemu Windows(cleanmgr.exe)
SET /P WindowsCleaner=Yes or No\Tak Czy Nie? (Y/N)?
IF /I "%WINDOWSCLEANER%" NEQ "Y" goto done
IF /I "%WINDOWSCLEANER%" NEQ "N" goto WindowsCleaner

:WindowsCleaner
Echo Running Windows Cleaner\Uruchamianie programu Windows Cleaner (cleanmgr.exe)
start "" /wait "C:\Windows\System32\cleanmgr.exe" /sagerun:50 
goto :done

:done
cls
echo Deleting Unnecessary Files Is Now Complete\Usuwanie Niepotrzebnych Plikow Zostalo Zakonczone
TimeOut /T 2 /nobreak
Exit
