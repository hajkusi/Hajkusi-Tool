@echo off
set /a time=6
cls
goto CheckPermissions


:CheckPermissions
  Net File 
   if "%errorlevel%"=="0" ( goto W11Only ) else ( goto UACPrompt )

:UACPrompt
cls
powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b
goto Timer

:W11Only
cls
netsh int tcp set supplemental Internet CongestionProvider=BBR2
netsh int tcp set supplemental Custom CongestionProvider=BBR2
netsh int tcp set supplemental InternetCustom CongestionProvider=BBR2
netsh int tcp set supplemental Datacenter CongestionProvider=BBR2
netsh int tcp set supplemental Compat CongestionProvider=BBR2
netsh int tcp set supplemental Template=Internet CongestionProvider=BBR2
netsh int tcp set supplemental Template=Datacenter CongestionProvider=BBR2
netsh int tcp set supplemental Template=Compat CongestionProvider=BBR2
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=BBR2
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=BBR2
Echo BBR2 ( Najlepszy CongestionProvider Jest Ustawiony! )
Timeout /t 2 /nobreak  > Nul
goto Timer


:Timer
cls
cls
set /a time=%time%-1
if %time% == 0 goto :done
call echo %~n0%~x0 wylaczy sie za %time% sekund
ping localhost -n 2 >nul
goto Timer


:Done
Exit /b
