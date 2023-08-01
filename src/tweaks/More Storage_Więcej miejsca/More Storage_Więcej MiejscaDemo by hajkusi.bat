@echo off
goto Prompt1

:PROMPT1
SET /P AREYOUSURE= Do you want to Delete download files? (You can choose which files are deleted) (Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" goto home
IF /I "%AREYOUSURE%" NEQ "N" goto GetInput

:PROMPT2
cls
Echo Your User Download directory is %UserDownloadDir%
SET /P ISTHATTRUE=Is that true? (Y/N)?
IF /I "%ISTHATTRUE%" NEQ "Y" goto GetInput
IF /I "%ISTHATTRUE%" NEQ "N" goto Y
:Y
del *.* /q /p /s
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q/p || del "%%i" /s/q)
goto home

:GetInput
cls
Set "UserDownloadDir="
Rem Request input from the user. 
Set /P "UserDownloadDir=Please enter the location of your User Download directory: "\
cls
Rem If input is not a directory ask again
For %%G In ("%UserDownloadDir%") Do If "%%~aG" Lss "d" If "%%~aG" GEq "-" (
    GoTo GetInput) Else GoTo GetInput
Rem Valid directory detected so continuing
Echo Your User Download directory is %UserDownloadDir%
Pause
Rem Make the User Download directory the current directory
CD /D "%UserDownloadDir%"
Echo Your current directory is %CD%
goto PROMPT2

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
goto Trash

:Trash
Echo Cleaning Trash\Oczyszczanie Kosza
del /q /s %systemdrive%\$Recycle.bin\*
for /d %%x in (%systemdrive%\$Recycle.bin\*) do @rd /s /q "%%x"
cls
goto PowerShell

:PowerShell
powershell.exe Remove-Item -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue
cls
goto TempFortniteAndEpicGames

:TempFortniteAndEpicGames
Echo Clearing Epic Games and Fortnite Temporary Files\Czyszczenie plikow tymczasowych Epic Games i Fortnite:
erase /F /S /Q "%SystemRoot%\TEMP*.*"
for /D %%G in ("%SystemRoot%\TEMP*") do RD /S /Q "%%G"
for /D %%G in ("%SystemDrive%\Users*") do erase /F /S /Q "%%G\AppData\Local\Temp*.*"
for /D %%G in ("%SystemDrive%\Users*") do RD /S /Q "%%G\AppData\Local\Temp\" 
cls
goto LogFiles

:LogFiles
Echo Clearing Log Files From The System\Usuwanie plików dziennika z systemu
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
cls
goto Net

:Net
@echo
net stop UsoSvc
@echo
net stop bits
@echo
net stop dosvc
@echo
goto WindowsUpdate

:WindowsUpdate
Echo Deleting Windows Update Temp Files\Usuwanie Plików Tymczasowych Windows Update:
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
cls
echo.
cls
goto WindowsCleaner

:WindowsCleaner
Echo Running Windows Cleaner\Uruchamianie programu Windows Cleaner (cleanmgr.exe)
start "" /wait "C:\Windows\System32\cleanmgr.exe" /sagerun:50 
goto :done

:done
cls
echo Deleting unnecessery files is now complete\Usuwanie niepotrzebnych plikow zostalo zakonczone
TimeOut /T 2 /nobreak
Exit