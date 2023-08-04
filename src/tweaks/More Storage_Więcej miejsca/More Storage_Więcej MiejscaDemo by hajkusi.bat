@echo off
goto Prompt1

:PROMPT1
SET /P AREYOUSURE= Do You Want To Delete Download Files? (You can choose which files are deleted)\Chcesz Usunac Pliki Z Folderu Pobrane (Mozesz wybierac,ktore)(Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" goto home
IF /I "%AREYOUSURE%" NEQ "N" goto y
:Y
cd %userprofile%\Downloads
del *.* /q /p /s
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q/p || del "%%i" /s/q)
goto home

:home
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
Dism.exe /online /Cleanup-Image /StartComponentCleanup
Dism.exe
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
Echo Clearing Epic Games and Fortnite Temporary Files\Czyszczenie plikow tymczasowych Epic Games i Fortnite:
erase /F /S /Q "%SystemRoot%\TEMP*.*"
for /D %%G in ("%SystemRoot%\TEMP*") do RD /S /Q "%%G"
for /D %%G in ("%SystemDrive%\Users*") do erase /F /S /Q "%%G\AppData\Local\Temp*.*"
for /D %%G in ("%SystemDrive%\Users*") do RD /S /Q "%%G\AppData\Local\Temp\" 
cls
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
Invoke-Command COMPUTERNAME -command{Stop-Process -ProcessName Explorer}
Invoke-Command COMPUTERNAME -command{Start-Process -ProcessName Explorer}
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
echo Do you Want To Start Windows Cleaner (cleanmgr.exe)\Czy chcesz uruchomic narzedzie do czyszczenia systemu Windows(cleanmgr.exe)
SET /P WindowsCleaner=Yes or No\Tak Czy Nie? (Y/N)?
IF /I "%WINDOWSCLEANER%" NEQ "Y" goto done
IF /I "%WINDOWSCLEANER%" NEQ "N" goto WindowsCleaner

:WindowsCleaner
Echo Running Windows Cleaner\Uruchamianie programu Windows Cleaner (cleanmgr.exe)
start "" /wait "C:\Windows\System32\cleanmgr.exe" /sagerun:50 
goto :done

:done
cls
echo Deleting Unnecessery Files Is Now Complete\Usuwanie Niepotrzebnych Plikow Zostalo Zakonczone
TimeOut /T 2 /nobreak
Exit
