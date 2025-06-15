@echo off
Set /a time=6
cls
goto CheckPermissions


:IsAdmin
cls
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 ( goto Win11Only
) Else ( goto UACPrompt )

:UACPrompt
cls
powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b
exit /b 1

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
Set /a time=%time%-1
If %time% == 0 goto :done
Call Echo %~n0%~x0 Wylaczy Sie Za %time% Sekund
Ping localhost -n 2 >nul
goto Timer


:Done
Exit /b
