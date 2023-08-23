@Echo off
cd %systemroot%\system32
call :IsAdmin
cls

:IsAdmin
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You Must Have Administrator Rights To Continue ... 
 Pause & Exit
)

Title Applying Tweaks
mkdir %SYSTEMDRIVE%\Gaming_Pack\Resources\
cls
echo Applying BCD Tweaks For Lower Input Delay
echo.
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
bcdedit /set tscsyncpolicy enhanced
echo.
goto BluetoothFix
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
echo Fixing Bluetooth
  
:BluetoothFix 
echo Fix Bluetooth By scar#1000
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t Reg_DWORD /d "3" /f
goto gpu

echo Tweaking Your Gpu\Tweakowanie Twojej Karty Graficznej

:gpu
cls
cls
echo What Brand is Your GPU?(If You Don't Have one Just type 2 or 3)\Jakiej Marki Jest Twoja Karta Graficzna (Jesli Nie Masz To Wybierz 2 lub 3)
echo 1. Nvidia
echo 2. AMD
echo 3. Intel
choice /C:123 /N /M "> Enter Your Choice on the Keyboard [1,2,3..] : "	
if errorlevel  3 goto:AMD
if errorlevel  2 goto:AMD
if errorlevel  1 goto:NV

echo Installing Debloated Drivers\Instalowanie Sterownikow Bez Niepotrzebnych Serwisow I Funkcji 

:NV
Reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak\Devices\509901423-0\Color" /v "NvCplUseColorCorrection" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t Reg_DWORD /d "1" /f
cls
Echo Choosing Type Of Drivers\Wybieranie Typu Sterownikow
echo.
echo 1. Ultra Quality\Ultra Jakosc (Good Computer\Dobry komputer)
echo 2. Quality\Jakosc (Average Computer\Przecietny Komputer)
echo 3. Max FPS (for show-off\Dla Pokazu)
echo.   
choice /C:123 /M "> Enter The Choice On The Keyboard: "	
if errorlevel  3 goto NV3
if errorlevel  2 goto NV2
if errorlevel  1 goto NV1

:NV1
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757435759276125/UltraQuality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\UltraQuality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\UltraQuality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AMD

:NV2
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757456349122600/Quality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Quality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%/Gaming_Pack/Resources/NvidiaProfileInspector.exe" "%SYSTEMDRIVE%/Gaming_Pack/Resources/Quality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AMD

:NV3
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138759533838225498/Latency_And_MaxPerformance_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_And_MaxPerformance_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_and_MaxPerformance_By_Hajkusi.nip\"
timeout 2 >nul
goto :AMD

:AMD
Echo Applying SystemProfile (GPU and Network) Tweaks.\Stosowanie Profilu Systemu (Karty Graficznej I Internetu.)
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t Reg_DWORD /d "ffffffff" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t Reg_DWORD /d "16" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t Reg_DWORD /d "16" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ParamReg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t Reg_DWORD /d "65534" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t Reg_DWORD /d "30" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t Reg_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t Reg_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t Reg_SZ /d "False" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t Reg_DWORD /d "8" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t Reg_DWORD /d "6" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t Reg_SZ /d "High" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t Reg_SZ /d "High" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t Reg_DWORD /d "00002710" /f
Reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t Reg_DWORD /d "1024" /f
cls
goto InternetTweaks

:EthernetOptions
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "MIMOPowerSaveMode" /t Reg_SZ /d "3" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "PowerSavingMode" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableGreenEthernet" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*EEE" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableConnectedPowerGating" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableDynamicPowerGating" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableSavePowerNow" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "PnPCapabilities" /t Reg_SZ /d "24" /f
REM more powersaving options
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*NicAutoPowerSaver" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "ULPMode" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnablePME" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "AlternateSemaphoreDelay" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "AutoPowerSaveModeEnabled" /t Reg_SZ /d "0" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PowerMizerEnable" /t Reg_DWORD /d "1" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PowerMizerLevel" /t Reg_DWORD /d "1" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PowerMizerLevelAC" /t Reg_DWORD /d "1" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PerfLevelSrc" /t Reg_DWORD /d "8738" /f
goto PromptChangeDNS

:PromptChangeDNS
cls
SET /P DNS=Change DNS To Faster One?(Y/N)
IF /I "%DNS%" NEQ "Y" goto PromptForTcpIp
IF /I "%DNS%" NEQ "N" goto ChangeDNS

:InternetTweaks
ipconfig /flushdns
ipconfig /release
ipconfig /renew
ipconfig /renew6
goto EthernetOptions

:PromptForTcpIp
SET /P TcpIp=Do You Want To Change TcpIp Settings\Czy Chcesz Zmienic Ustawienia TcpIp?(Y/N)
IF /I "%TCPIP%" NEQ "Y" goto PromptForNetshOptions
IF /I "%TCPIP%" NEQ "N" goto TcpIp

:TcpIp
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxConnectRetransmissions" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t Reg_DWORD /d "32" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckFrequency" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckTicks" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "CongestionAlgorithm" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MultihopSets" /t Reg_DWORD /d "15" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t Reg_DWORD /d "50" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t Reg_DWORD /d "17424" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t Reg_DWORD /d "3" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t Reg_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t Reg_DWORD /d "2" /f
Reg add "HKLM\SYSTEM\CurrDisableNagleentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t Reg_DWORD /d "0" /f
Reg add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t Reg_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t Reg_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpInitialRTT" /d "300" /t Reg_DWORD /f
goto PromptForNetshOptions

:NetshOptions
netsh int tcp set heuristics disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global initialRto=2000
netsh interface tcp set global MaxSynRetransmissions=2
netsh int tcp set supplemental template=custom icw=10
netsh int tcp set global autotuninglevel=normal
netsh int ip set global taskoffload=disabled >nul 2>&1
netsh int tcp set supplemental Internet congestionprovider=CUBIC
netsh interface isatap set state disabled
netsh interface ip set interface ethernet currenthoplimit=64
netsh winsock set autotuning off
Reg add "HKCU\Software\Gaming" /v CongestionAdvancedON /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t Reg_DWORD /d "0" /f
goto DeliveryOptions

:ChangeDNS
netsh interface ipv4 add dnsservers "Ethernet" address=1.1.1.1 index=1
netsh interface ipv4 add dnsservers "Ethernet" address=8.8.8.8 index=2

netsh interface ipv4 add dnsservers "Wi-Fi" address=1.1.1.1 index=1
netsh interface ipv4 add dnsservers "Wi-Fi" address=8.8.8.8 index=2
goto PromptForTcpIp

:PromptForNetshOptions
SET /P Netsh=Do You Want To Change Netsh Settings\Czy Chcesz Zmienic Ustawienia Netsh?(Y/N)
IF /I "%NETSH%" NEQ "Y" goto DeliveryOptions
IF /I "%NETSH%" NEQ "N" goto NetshOptions

:DeliveryOptions
cls
Echo Optimizing Delivery Options
@REM Disable Delivery Optimization P2P Update downlods outside of local network
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t Reg_DWORD /d 0 /f
goto DistributeTimers

:DistributeTimers
cls
Echo Distributing Timers
echo Disable DistributeTimers
Reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "DistributeTimers" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /f
goto MouseOptimize

Echo Optimizing Mouse

:MouseOptimize
Reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t Reg_SZ /d "0" /f
Reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t Reg_SZ /d "0" /f
Reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t Reg_SZ /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorSensitivity" /t Reg_DWORD /d "10000" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "IRRemoteNavigationDelta" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t Reg_DWORD /d "5" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t Reg_DWORD /d "40" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t Reg_DWORD /d "50" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t Reg_DWORD /d "16" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t Reg_DWORD /d "360" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t Reg_SZ /d "8" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t Reg_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t Reg_DWORD /d "31" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t Reg_SZ /d "10" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t Reg_SZ /d "0" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t Reg_SZ /d "0" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t Reg_SZ /d "0" /f
control.exe desk.cpl,Settings,@Settings
:ChooseScale
echo What is your current display scaling percentage? 100, 125, 150, 175, 200, 225, 250, 300, 350 (Don't put a %% symbol)
set /p choice=" Scale > "
if /i "%choice%"=="100" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="125" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000000000100000000000000020000000000000003000000000000000400000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="150" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000303313000000000060662600000000009099390000000000C0CC4C0000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="175" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000006066160000000000C0CC2C000000000020334300000000008099590000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="200" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "000000000000000090991900000000002033330000000000B0CC4C00000000004066660000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="225" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC1C0000000000809939000000000040665600000000000033730000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="250" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000000000200000000000000040000000000000006000000000000000800000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="300" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000006066260000000000C0CC4C000000000020337300000000008099990000000000" /f >nul 2>&1 & goto Continue
if /i "%choice%"=="350" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC2C0000000000809959000000000040668600000000000033B30000000000" /f >nul 2>&1 & goto Continue
goto ChooseScale

:Continue
Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t Reg_BINARY /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t Reg_DWORD /d "4" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t Reg_DWORD /d "3" /f
goto SystemAuto-Loggers

Echo Disabling System Auto-Loggers

:SystemAuto-Loggers
echo Disable System Auto-Loggers 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsClient" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t Reg_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t Reg_DWORD /d "1" /f
cls
goto PowerSaving

:PromptForUSBPowerSaving
SET /P Usb=Do You Want To Disable USB Power Saving Settings\Czy Chcesz Wylaczyc Ustawienia Oszczedzania Energii USB?(Y/N)
IF /I "%USB%" NEQ "Y" goto PowerThrottling
IF /I "%USB%" NEQ "N" goto USBPowerSaving

:PowerSaving
Echo Disabling System energy-saving techniques.
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f
goto PromptForUSBPowerSaving

:USBPowerSaving
for /f "tokens=*" %%i in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "StorPort" ^| findstr "StorPort"') do Reg add "%%i" /v "EnableIdlePowerManagement" /t Reg_DWORD /d "0" /f
for /f "tokens=*" %%i in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr "USB\VID_"') do (
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnhancedPowerManagementEnabled" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "AllowIdleIrpInD3" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnableSelectiveSuspend" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "DeviceSelectiveSuspended" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendEnabled" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendOn" /t Reg_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "D3ColdSupported" /t Reg_DWORD /d "0" /f
)
goto PowerThrottling

:PowerThrottling
Echo Disabling PowerThrottling 
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t Reg_DWORD /d "1" /f
goto Services

:Services
cls
Echo Disabling Unnecessary System Services For Less System Usage\Wylaczanie Niepotrzebnych Serwisow Dla Mniejszego Uzycia Systemu
echo.
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TapiSrv" /v "Start" /t Reg_DWORD /d "4" /f 
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FontCache3.0.0.0" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpcMonSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SEMgrSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PNRPsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LanmanWorkstation" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WEPHOSTSVC" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2psvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2pimsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PhoneSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Wecsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RmSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorDataService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensrSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\perceptionsimulation" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\StiSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\OneSyncSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\autotimesvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationBrokerSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdatem" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MicrosoftEdgeElevationService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ALG" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\QWAVE" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\IpxlatCfgSvc" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DusmSvc" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MapsBroker" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdate" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorService" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\shpamsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\svsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SysMain" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MSiSCSI" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Netlogon" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CscService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ssh-agent" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\AppReadiness" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tzautoupdate" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NfsClnt" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wisvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\defragsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedRealitySvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RetailDemo" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lltdsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TrkWks" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CryptSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t Reg_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t Reg_DWORD /d 1 /f 
Reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t Reg_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "DoSvc" /t Reg_DWORD /d 3 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t Reg_DWORD /d 1 /f
Reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t Reg_DWORD /d 1 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t Reg_DWORD /d 1 /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t Reg_DWORD /d 4 /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t Reg_DWORD /d 0 /f 
Reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t Reg_DWORD /d 0 /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\diagsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DPS" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdiServiceHost" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdiSystemHost" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t Reg_DWORD /d 00000000 /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\dmwappushsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\diagnosticshub.standardcollector.service" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TroubleshootingSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DsSvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t Reg_DWORD /d 1 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t Reg_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t Reg_SZ /d "0.0.0.0" /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoActiveHelp" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t Reg_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\FileHistory" /v "Disabled" /t Reg_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t Reg_DWORD /d 0 /f 
Reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t Reg_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t Reg_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t Reg_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t Reg_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t Reg_DWORD /d 1 /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FrameServer" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\OSRSS" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sedsvc" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t Reg_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t Reg_DWORD /d 4 /f
set toDisable=DiagTrack diagnosticshub.standardcollector.service dmwappushservice RemoteRegistry RemoteAccess SCardSvr SCPolicySvc fax WerSvc NvTelemetryContainer gadjservice AdobeARMservice PSI_SVC_2 lfsvc WalletService RetailDemo SEMgrSvc diagsvc AJRouter amdfendr amdfendrmgr
(for %%a in (%toDisable%) do ( 
   sc stop %%a
   sc config %%a start= disabled 
))
cls
goto fsutil

:PromptForAudio
SET /P Audio=Do You Want To Change Audio Settings\Czy Chcesz Zmienic Ustawienia Audio?(Y/N)
IF /I "%AUDIO%" NEQ "Y" goto Telemetry
IF /I "%AUDIO%" NEQ "N" goto AudioOptions

:fsutil
fsutil behavior set memoryusage 2
fsutil behavior set mftzone 2
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
fsutil behavior set disablecompression 1
fsutil behavior set disabledeletenotify 0
fsutil 8dot3name set 1
fsutil resource setavailable C:\
fsutil resource setlog shrink 10 C:\
cls
goto PromptForAudio

:AudioOptions
cls
cd %SYSTEMDRIVE%\Gaming\Resources
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\nssm.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/nssm.exe"
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/REAL.exe"
nssm install GamingAudio "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe"
nssm set GamingAudio DisplayName Gaming Audio Latency Reducer Service
nssm set GamingAudio Description Reduces Audio Latency
nssm set GamingAudio Start SERVICE_AUTO_START
nssm set GamingAudio AppAffinity 1
nssm set GamingAudio start SERVICE_AUTO_START
nssm start GamingAudio
goto Telemetry

:Telemetry
cls
Echo Disabling Telemetry
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask"
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable"
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh"
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload"
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable
schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy"
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT"
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent"
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable
schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics"
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable
schtasks /end /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks"
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific"
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /disable
schtasks /end /tn "\Microsoft\Windows\HelloFace\FODCleanupTask"
schtasks /change /tn "\Microsoft\Windows\HelloFace\FODCleanupTask" /disable
schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClient"
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /disable
schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask"
schtasks /change /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /disable
schtasks /end /tn "\Microsoft\Windows\Device Information\Device"
schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /disable
schtasks /end /tn "\Microsoft\Windows\Device Information\Device User"
schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /disable
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack" /disable
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn"
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" /disable
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
schtasks /Change /TN "NIUpdateServiceStartupTask" /Disable
schtasks /Change /TN "CCleaner Update" /Disable
schtasks /Change /TN "CCleanerSkipUAC - %username%" /Disable
schtasks /Change /TN "Adobe Acrobat Update Task" /Disable
schtasks /Change /TN "AMDLinkUpdate" /Disable
schtasks /Change /TN "Microsoft\Office\Office Automatic Updates 2.0" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates Logon" /Disable
schtasks /Change /TN "GoogleUpdateTaskMachineCore" /Disable
schtasks /Change /TN "GoogleUpdateTaskMachineUA" /Disable
schtasks /DELETE /TN "AMDInstallLauncher" /f
schtasks /DELETE /TN "AMDLinkUpdate" /f
schtasks /DELETE /TN "AMDRyzenMasterSDKTask" /f
schtasks /DELETE /TN "DUpdaterTask" /f
schtasks /DELETE /TN "ModifyLinkUpdate" /f
Reg DELETE "HKSU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /f
Reg DELETE "HKSU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
Reg DELETE "HKSU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies" /f
Reg DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\RunOnce" /f
Reg DELETE "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /f
Reg DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce" /f
Reg DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices" /f
Reg DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx" /f
Reg DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
Reg DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "MTPW" /f
Reg DELETE "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components" /v "Microsoft Edge" /f
Reg DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch_E9C49D8E9BDC4095F482C844743B9E82" /f
Reg DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch_D3AB3F7FBB44621987441AECEC1156AD" /f
Reg DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch" /f
Reg DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Microsoft Edge Update" /f
Reg DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdgeAutoLaunch_31CF12C7FD715D87B15C2DF57BBF8D3E" /f

Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "accesssolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "olksolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "onenotesolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "pptsolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "projectsolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "publishersolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "visiosolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "wdsolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "xlsolution" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "agave" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "appaddins" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "comaddins" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "documentfiles" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "templatefiles" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\EpicOnlineServices" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GoogleChromeElevationService" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdate" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Origin Client Service" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Origin Web Helper Service" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdatem" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Steam Client Service" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\17.0\Word\Options" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t Reg_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t Reg_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\17.0\Common\ClientTelemetry" /v "DisableTelemetry" /t Reg_DWORD /d 1 /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\17.0\Common" /v "QMEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\VSCommon\17.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\VSCommon\17.0\SQM" /v "OptIn" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t Reg_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t Reg_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t Reg_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t Reg_SZ /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupEnabled" /t Reg_SZ /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /t Reg_SZ /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t Reg_SZ /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "TraceLevelThreshold" /t Reg_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "EnableTracing" /t Reg_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "EnableTracing" /t Reg_DWORD /d "0" /f
Reg add "HKCEnableRID44231EU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "WPPFilePath" /t Reg_SZ /d "%%SYSTEMDRIVE%%\TEMP\Tracing\WPPMedia" /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "WPPFilePath" /t Reg_SZ /d "%%SYSTEMDRIVE%%\TEMP\WPPMedia" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t Reg_DWORD /d "2" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo" /v "Value" /t Reg_DWORD /d "0" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v /t Reg_SZ /d "Deny" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v /t Reg_SZ /d "Deny" /f
Reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "POWERSHELL_TELEMETRY_OPTOUT" /t Reg_SZ /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t Reg_DWORD /d 0 /f
setx POWERSHELL_TELEMETRY_OPTOUT 1
Echo Disabling Data Collection Bloatwares\Wylaczanie Gromadzenie Danych Dla Oprogramowan Typu BloatWare

@rem *** Disable Data Collection bloatwares ***
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t Reg_DWORD /d 1 /f

Echo Disabling Settings App Unnecessary And Telemetry Options\Wylaczanie Niepotrzebnych Ustawien Aplikacji I Opcje Telemetrii

@REM - SmartScreen Filter for Store Apps: Disable
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t Reg_DWORD /d 0 /f
REM - Let websites provide locally...
Reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t Reg_DWORD /d 1 /f
goto FSE

:FSE
Echo Enabling Full-screen Exclusive\Wlaczanie Trybu Ekskluzywny Pelny Ekran
Reg delete "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /f
Reg delete "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t Reg_DWORD /d "0" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t Reg_DWORD /d "2" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t Reg_DWORD /d "2" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t Reg_DWORD /d "1" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t Reg_DWORD /d "1" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t Reg_DWORD /d "0" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t Reg_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v /t Reg_DWORD /d "0" /f
Reg add "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /t Reg_BINARY /d "020001000000c4200000000000000000000000000000000000000000000000000000000000000000" /f
Reg add "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /t Reg_BINARY /d "010001000100670061006d006500700061006e0065006c002e006500780065000000ee001e8af974e0553503201136031e000000e05535031e0000000f000000a0e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
goto GpuTweaks

:GpuTweaks
echo Enabling Hardware Accelerated GPU Scheduling\Wlaczanie Przyspieszonego Sprzetowo Planowania Karty Graficznej
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /f /v "HwSchMode" /t Reg_DWORD /d "2"
cls
goto GetInput

:GetInput
cls
Set "HardwareDataQueueSize="
Rem Request input from the user. 
Set /P "HardwareDataQueueSize=Please enter the size that you want of your HardwareDataQueueSize: "\
cls
Rem If input is not a Number ask again
Rem Valid number detected so continuing
Echo Your size of HardwareDataQueueSize is %HardwareDataQueueSize%
Pause
Rem Make the HardwareDataQueueSize the current choosed number
goto Prompt

:Prompt
cls
SET /P AREYOUSURE=Size of a HardwareDataQueueSize You Choosed Is %HardwareDataQueueSize% Continue?, Or Change Number\Rozmiar Wybranej Kolejki Sprzetu Komputerowego to %HardwareDataQueueSize % Kontynuuj? Czy Zmien Numer(Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" goto GetInput
IF /I "%AREYOUSURE%" NEQ "N" goto HardwareDataQueueSize

:HardwareDataQueueSize
Echo Setting HardwareDataQueueSize\Ustawianie Rozmiaru Sprzetowej Kolejki Komputerowej
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t Reg_DWORD /d "%HardwareDataQueueSize%" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t Reg_DWORD /d "%HardwareDataQueueSize%" /f
goto MemoryTweaks

:MemoryTweaks
echo.
Echo Adding more ram for applications in system memory caching to improve microstuttering\Dodanie wiekszej ilosci pamieci RAM dla aplikacji w buforowaniu pamieci systemowej w celu poprawy mikrozacinania
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t Reg_DWORD /d "1" /f

Echo Paging Executive Is Used To Load System Files Such As Kernel And Hardware Drivers To The Page File When Needed. Disable Will Force Run Into Not Virtual Memory\Paging Executive Sluzy Do ladowania Plikow Systemowych, Takich Jak Sterowniki Kernel I Sprzetu, Do Pliku Stronicowania W Razie Potrzeby. Wylaczenie Spowoduje Wymuszenie Uruchomienia Pamieci Nie Wirtualnej
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t Reg_DWORD /d "1" /f

Echo Disabling Windows Attempt To Save As Much RAM As Possible, Such As Sharing Pages For Images, Copy-On-Write For Data Pages, And Compression\Wylaczanie Systemu Windows Proba Zaoszczedza Jak Najwiekszej Ilosci Pamieci RAM, Na Przyklad Udostepnianie Stron Obrazow, Kopiowanie Przy Zapisie Stron Danych I Kompresji
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t Reg_DWORD /d "1" /f

Reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t Reg_DWORD /d "262144" /f
goto NormalFortnitePriority

:NormalFortnitePriority
Echo Enabling Normal Priority For Fortnite\Wlaczanie Normalnego Piorytetu Dla Fortnite
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t Reg_DWORD /d "2" /f
goto OptimalWin32Priority

:OptimalWin32Priority
Echo Applying Optimal Win32Priority For Balanced FPS And Latency\Zastosowywanie Optymalnych Ustawien Dla Win32Priority Dla Zbalansowanych Fps i Mniejszego Opoznienia Systemu
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t Reg_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ13Priority" /t Reg_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t Reg_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ0Priority" /t Reg_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967286Priority" /t Reg_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967287Priority" /t Reg_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "ConvertibleSlateMode" /t Reg_DWORD /d "00000000" /f
goto Programs

:Programs
Echo
timeout 2 >nul
cls
::========================================================================================================================================
echo 1. Remove Preinstalled Apps\Usun Wstepnie Zainstalowane Aplikacje
echo 2. Keep Preinstalled Apps\Zatrzymaj Wstepnie Zainstalowane Aplikacje
echo.

choice /C:12 /M "> Enter The Choice on the Keyboard: "	
if errorlevel  2 goto:SvcHost
if errorlevel  1 goto:RemovePreinstalledPrograms
::========================================================================================================================================

:RemovePreinstalledPrograms
@Echo on
@rem Debloat Windows & Remove Preinstalled Programs
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *BingWeather* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Office.OneNote* | Remove-AppxPackage"
set listofbloatware=Automate Appconnector Microsoft3DViewer MicrosoftPowerBIForWindows MicrosoftPowerBIForWindows Print3D GetHelp BingFoodAndDrink BingHealthAndFitness BingTravel WindowsReadingList MixedReality.Portal ScreenSketch YourPhone PicsArt-PhotoStudio EclipseManager PolarrPhotoEditorAcademicEdition Wunderlist LinkedInforWindows AutodeskSketchBook Twitter DisneyMagicKingdoms MarchofEmpires ActiproSoftwareLLC Plex iHeartRadio FarmVille2CountryEscape Duolingo CyberLinkMediaSuiteEssentials DolbyAccess DrawboardPDF FitbitCoach Flipboard Asphalt8Airborne Keeper BingNews COOKINGFEVER PandoraMediaInc CaesarsSlotsFreeCasino PhototasticCollage TuneInRadio WinZipUniversal XING MicrosoftOfficeHub ConnectivityStore Hotspot Sketchable Clipchamp ToDo Family NewVoiceNote SamsungNotes SamsungFlux StudioPlus SamsungWelcome SamsungQuickSearch SamsungPCCleaner SamsungCloudBluetoothSync PCGallery OnlineSupportSService HPJumpStarts HPPCHardwareDiagnosticsWindows HPPowerManager HPPrivacySettings HPSupportAssistant HPSureShieldAI HPSystemInformation HPQuickDrop HPWorkWell myHP HPDesktopSupportUtilities HPQuickTouch HPEasyClean HPSystemInformation MicrosoftTeams ACGMediaPlayer AdobePhotoshopExpress HiddenCity Hulu Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe MicrosoftSolitaireCollection MicrosoftStickyNotes Microsoft.people Microsoft.Wallet MinecraftUWP Todos Viber bingsports
(for %%a in (%listofbloatware%) do ( 
   PowerShell -Command "Get-AppxPackage -allusers *%%a* | Remove-AppxPackage"
cls
))
@Echo off
goto SvcHost

:SvcHost
Echo Enter The Amount Of RAM That You Have\Wpisz Ilosc Ramu Ktory Posiadasz. (Example\Np.: 4GB, 6GB, 8GB, 16GB, 32GB, 64GB)
echo.
echo.
set choice=
set /p choice=Amount of RAM:
goto PromptChoice
:Y
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='4' goto :4GBRam
if '%choice%'=='6' goto :6GBRam
if '%choice%'=='8' goto :8GBRam
if '%choice%'=='16' goto :16GBRam
if '%choice%'=='32' goto :32GBRam
if '%choice%'=='64' goto :64GBRam
Echo "%choice%" is not valid, try again
goto SvcHost

:PromptChoice
cls
SET /P RAM=Size Of Ram Which Was Chosen Is %Choice% Continue?, Or Change?\Wielkosc Ramu, Ktora Zostala Wybrana To %Choice% Kontynuuj, Lub Zmienic?(Y/N)
IF /I "%RAM%" NEQ "Y" goto SvcHost
IF /I "%RAM%" NEQ "N" goto Y

:4GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t Reg_DWORD /d "68764420" /f
bcdedit /set increaseuserva 2000
goto PromptForAddTakeOwnerShipInContextMenu
:6GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t Reg_DWORD /d "103355478" /f
bcdedit /set increaseuserva 3000
goto PromptForAddTakeOwnerShipInContextMenu
:8GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t Reg_DWORD /d "137922056" /f
bcdedit /set increaseuserva 4000
goto PromptForAddTakeOwnerShipInContextMenu
:16GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t Reg_DWORD /d "376926742" /f
bcdedit /set increaseuserva 8000
goto PromptForAddTakeOwnerShipInContextMenu
:32GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t Reg_DWORD /d "861226034" /f
bcdedit /set increaseuserva 16000
goto PromptForAddTakeOwnerShipInContextMenu
:64GB
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t Reg_DWORD /d "1729136740" /f
bcdedit /set increaseuserva 32000
goto PromptForAddTakeOwnerShipInContextMenu

:PromptForAddTakeOwnerShipInContextMenu
ET /P TakeOwnerShipInContext=Do You Want To Add Take OwnerShip In Context Menu\Czy Chcesz Dodac Take OwnerShip do Menu Kontekstowego?(Y/N)
IF /I "%TAKEOWNERSHIPINCONTEXTMENU%" NEQ "Y" goto PromptForOptionalTweaks
IF /I "%TAKEOWNERSHIPINCONTEXTMENU%" NEQ "N" goto AddTakeOwnerShipInContextMenu

:AddTakeOwnerShipInContextMenu
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/Show-Take-Ownership-Context-Menu.Reg"
cd %SYSTEMDRIVE%\Gaming_Pack\Resources\
Reg import Show-Take-Ownership-Context-Menu.Reg
cls
goto PromptForOptionalTweaks

:PromptForOptionalTweaks
SET /P Optional=Do You Want To Go To The Optional Tweaks\Czy Chcesz Zastosowac Opcjonalne Tweaki?(Y/N)
IF /I "%OPTIONAL%" NEQ "Y" goto PromptforGPeditEnabler
IF /I "%OPTIONAL%" NEQ "N" goto OptionalTweaks
pause

:OptionalTweaks
cls
@REM Disabling Wifi Sense hotspot sharing
Reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v /t Reg_DWORD /d 0 /f
@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
Reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v /t Reg_DWORD /d 0 /f

@REM Optional Tweaks"
Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v WebWidgetAllowed /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t Reg_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t Reg_DWORD /d "0" /f
Reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t Reg_SZ /d "1" /f
Reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t Reg_SZ /d "1000" /f
Reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t Reg_SZ /d "0" /f
Reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t Reg_SZ /d "1000" /f
Reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t Reg_SZ /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t Reg_SZ /d "5000" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t Reg_DWORD /d "0" /f
Reg add "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t Reg_SZ /d "SwapEffectUpgradeEnable=1;" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "Attributes" /t Reg_DWORD /d "2" /f
Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t Reg_DWORD /d "1" /f
Reg add "HKCR\*" /v "DefaultDropEffect" /t Reg_DWORD /d "1" /f
Reg add "HKCR\AllFilesystemObjects" /v "DefaultDropEffect" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v "ThreadPriority" /t Reg_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t Reg_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t Reg_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t Reg_DWORD /d "31" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v /t "Reg_DWORD" /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d "0" /t Reg_DWORD /f
Reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t Reg_SZ /d 506 /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t Reg_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314559Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t Reg_DWORD /d 1 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RemediationRequired" /t Reg_DWORD /d 0 /f
Reg add "HKLM\Software\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t Reg_DWORD /d "1" /f
Reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions" /f
Reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /f
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsInkWorkspace\AllowSuggestedAppsInWindowsInkWorkspace" /v /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t Reg_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t Reg_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t Reg_DWORD /d "2" /f
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t Reg_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t Reg_DWORD /d "1" /f
Reg add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t Reg_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t Reg_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t Reg_DWORD /d "1" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t Reg_DWORD /d "2" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t Reg_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t Reg_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v TuningTweak /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "AllowDeepCStates" /t Reg_DWORD /d "0" /f
for /f %%i in ('Reg query "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /t Reg_SZ /s /e /f "NVIDIA" ^| findstr "HKEY"') do (
Reg add "%%i" /v "DisableDynamicPstate" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Perflib" /v "DisablePerformanceCounters" /t Reg_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t Reg_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t Reg_DWORD /d "0" /f
)
Reg add "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /t Reg_DWORD /d 0 /f
Reg add "HKCU\AppEvents\Schemes" /f reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t REG_DWORD /d "0" /f
Reg delete "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
Reg delete "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f
schtasks /Change /TN "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /RL LIMITED
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
powercfg -hibernate off
SET DEVMGR_SHOW_NONPRESENT_DEVICES=1
Powershell -Command "%programdata%\NagleAlg.ps1"
powershell -NoProfile -Command "Disable-MMAgent -PagingCombining -mc"
defrag.exe
cls
goto PromptforGPeditEnabler

:GPeditEnablerInHome
@echo off 
pushd "%~dp0" 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del /s /q List.txt
cls
goto PromptforIEUnintaller

:PromptforGPeditEnabler
Echo Do You Want To Enable GPedit\Chcesz Wlaczyc GPedit?
SET /P GPEDIT=Yes or No?(Y/N)
IF /I "%GPEDIT%" NEQ "Y" goto PromptforIEUnintaller
IF /I "%GPEDIT%" NEQ "N" goto GPeditEnablerInHome

:PromptforIEUnintaller
Echo Do You Want to Unintall Internet Explorer version 8,9,10,11\Odinstalowac Internet Explorer Wersje 8,9,10,11?
SET /P UNINSTALL= Yes or No?(Y/N)
IF /I "%UNINSTALL%" NEQ "Y" goto end
IF /I "%UNINSTALL%" NEQ "N" goto IEUnintaller

:IEUnintaller
cls
:: Usage script.bat [version [verify [reboot]]]

:: Version Prompt
setlocal
:Version
cls
set "Input=%~1"
set /p "Input=> Which Version of Internet Explorer\Ktora Wersja Internet Explorer? (8, 9, 10, or 11): "
if defined Input set "Input=%Input:"=%"
if /i "%Input%"=="8" goto SetVersion
if /i "%Input%"=="9" goto SetVersion
if /i "%Input%"=="10" goto SetVersion
if /i "%Input%"=="11" goto SetVersion
endlocal & exit /b 1
:SetVersion
endlocal & set "Version=%Input%"

:: Safety Prompt
setlocal
:Prompt
set "Input=%~2"
set /p "Input=> Uninstall Internet Explorer %Version%?\Odinstalowac Internet Explorer %Version%?(y or n): "
if defined Input set "Input=%Input:"=%"
if /i "%Input%"=="n" goto :Version
if /i not "%Input:~-1%"=="y" goto :Prompt
endlocal

:: Force close any open IE windows
taskkill /IM iexplore.exe /T /F 2>nul

:: Uninstall the IE Update Packages
rd "%userprofile%\Appdata\LocalLow\Microsoft\Internet Explorer\" /s /q
rd %appdata%\Microsoft\Internet Explorer\ /s /q
rd %userprofile%\Appdata\Local\Microsoft\Edge\ /s /q
pushd "%SystemRoot%\servicing\Packages"
for /f "delims=" %%A in ('dir /a-d /b /o-d Microsoft-Windows-InternetExplorer-*~%Version%.*.mum 2^>nul') do (
	echo Uninstalling package %%~nA
	start /w pkgmgr /up:"%%~nA" /quiet /norestart"
) || echo Packages for this product were not found.
popd

:: Restart Notice
echo Packages Have Been Uninstalled.\Pakiety Zostaly Odinstalowane
echo.
echo The Computer Needs To Be Restarted To Finish.\Komputer Musi Byc Zrestartowany zeby Zakonczyc

:: Restart Prompt
setlocal
:Restart
set "Input=%~3"
set /p "Input=> Restart Now? (y or n): "
if defined set "Input=%Input:"=%"
if /i "%Input%"=="n" endlocal & exit /b 3
if /i not "%Input:~-1%"=="y" goto :Restart
endlocal

:: Restart
shutdown /r /t 15 /d p:4:2 /c "IE %Version% Uninstalled by %USERNAME%"
cls
goto PromptForSystemTools

:SystemToolsEnabler
Reg add "HKCR\DesktopBackground\Shell\SystemTools" /v "MUIVerb" /t Reg_SZ /d "System Tools" /f
Reg add "HKCR\DesktopBackground\Shell\SystemTools" /v "SubCommands" /t Reg_SZ /d "control;cleanmgr;devmgr;event;Regedit;secctr;msconfig;taskmgr;taskschd;wu" /f
Reg add "HKCR\DesktopBackground\Shell\SystemTools" /v "icon" /t Reg_SZ /d "imageres.dll,104" /f
Reg delete "HKCR\DesktopBackground\Shell\SystemTools" /v "Position" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /ve /t Reg_SZ /d "Control Panel" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /v "icon" /t Reg_SZ /d "control.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control\command" /ve /t Reg_SZ /d "control.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /ve /t Reg_SZ /d "Disk Cleanup" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /v "icon" /t Reg_SZ /d "cleanmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr\command" /ve /t Reg_SZ /d "cleanmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /ve /t Reg_SZ /d "Device Manager" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /v "Icon" /t Reg_EXPAND_SZ /d "devmgr.dll" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr\command" /ve /t Reg_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe /s %%SystemRoot%%\system32\devmgmt.msc" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /ve /t Reg_SZ /d "Event Viewer" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /v "icon" /t Reg_SZ /d "eventvwr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event\command" /ve /t Reg_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe /s %%SystemRoot%%\system32\eventvwr.msc" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Regedit" /ve /t Reg_SZ /d "Registry Editor" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Regedit" /v "icon" /t Reg_SZ /d "Regedit.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Regedit\command" /ve /t Reg_SZ /d "Regedit.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /ve /t Reg_SZ /d "Security Center" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /v "icon" /t Reg_SZ /d "wscui.cpl" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr\command" /ve /t Reg_SZ /d "control wscui.cpl" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /ve /t Reg_SZ /d "System Configuration" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /v "icon" /t Reg_SZ /d "msconfig.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig\command" /ve /t Reg_SZ /d "msconfig.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /ve /t Reg_SZ /d "Task Manager" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /v "icon" /t Reg_SZ /d "taskmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr\command" /ve /t Reg_SZ /d "taskmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /ve /t Reg_SZ /d "Task Scheduler" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /v "icon" /t Reg_SZ /d "miguiresource.dll,1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd\command" /ve /t Reg_SZ /d "Control schedtasks" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wu" /ve /t Reg_SZ /d "Windows Update" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wu" /v "icon" /t Reg_SZ /d "wucltux.dll" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wu\command" /ve /t Reg_SZ /d "wuapp.exe" /f
goto End

:PromptForSystemTools
Echo Do You Want To Enable System Tools\Chcesz Wlaczyc Narzedzia Systemu?
SET /P System=Yes or No? (Y/N)
IF /I "%SYSTEMTOOLS%" NEQ "Y" goto PromptForSoftRestart
IF /I "%SYSTEMTOOLS%" NEQ "N" goto SystemToolsEnabler

:PromptForSoftRestart
Echo Do You Want To Perform Computer SoftRestart(It's Safe,And It Gives You More Performance)\Czy Chcesz Wykonać Lekkie Uruchomienie Ponownie Komputera(Jest Bezpieczne,I Zapewnia To Wieksza Wydajnosc)?
SET /P SoftRestart=Yes or No? (Y/N)
IF /I "%SOFTRESTART%" NEQ "Y" goto End
IF /I "%SOFTRESTART%" NEQ "N" goto SoftRestart

:SoftRestart
cd %SystemDrive%\Gaming_Pack\Resources\
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\NSudo.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/NSudo.exe"
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "Reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t Reg_DWORD /d "3" /f" >nul 2>&1
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "sc start "TrustedInstaller"" >nul 2>&1
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\Restart64.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/restart64.exe"
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\EmptyStandbyList.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/EmptyStandbyList.exe"
taskkill /f /im explorer.exe >nul 2>&1
cd %SYSTEMROOT% >nul 2>&1
start explorer.exe >nul 2>&1
cd %SystemDrive%\Gaming_Pack\Resources\
echo netsh advfirewall reset >RefreshNet.bat
echo ipconfig /release >>RefreshNet.bat
echo ipconfig /renew >>RefreshNet.bat
echo nbtstat -R >>RefreshNet.bat
echo nbtstat -RR >>RefreshNet.bat
echo ipconfig /flushdns >>RefreshNet.bat
echo ipconfig /Registerdns >>RefreshNet.bat
NSudo -U:T -P:E -M:S -ShowWindowMode:Hide -wait cmd /c "%TEMP%\RefreshNet.bat"
Restart64.exe
EmptyStandbyList.exe standbylist
goto End

:End
rmdir %SYSTEMDRIVE%\Gaming_Pack\ /s /q
cls
Title Done\Zakonczone
Echo   Tweaks Are Done\Tweaksy Sa Zakonczone     
TIMEOUT /T 2 /nobreak
exit