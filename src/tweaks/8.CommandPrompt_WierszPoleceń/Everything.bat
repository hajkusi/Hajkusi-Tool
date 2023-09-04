@Echo off
cd %systemdrive%\
call :IsAdmin

:IsAdmin
cls
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You Must Have Administrator Rights To Continue ... 
 Pause & Exit
)

REM Show Detailed BSoD
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1
REM Blank/Color Character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a" & set "COL=%%b")
REM Add ANSI escape sequences
reg add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1
:TweaksPG1
cls
echo.
echo                                                                                                     %COL%[36mPage 1/2
echo                                                               %COL%[1;4;34mTweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Power Plan                 %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m OptimizeMemory             %COL%[33m[%COL%[37m 3 %COL%[33m]%COL%[37m MSI Mode
echo              %COL%[90mDesktop Power Plan, Good         %COL%[90mOptimizes Ram,SvcHost, And More   %COL%[90mEnable MSI Mode For Gpu And
echo              %COL%[90mTo Use With A Laptop Battery.    %COL%[90mService Host To Your RAM          %COL%[90mNetwork Adapters
echo.
echo              %COL%[33m[%COL%[37m 4 %COL%[33m]%COL%[37m Affinity                   %COL%[33m[%COL%[37m 5 %COL%[33m]%COL%[37m W32 Priority Seperation    %COL%[33m[%COL%[37m 6 %COL%[33m]%COL%[37m Mouse Fix
echo              %COL%[90mThis Tweak Will Spread Devices   %COL%[90mOptimizes The Usage Priority Of   %COL%[90mOptimizes The Usage Priority Of
echo              %COL%[90mOn Multiple Cpu Cores            %COL%[90mYour Running Services             %COL%[90mYour Running Services
echo.
echo              %COL%[33m[%COL%[37m 7 %COL%[33m]%COL%[37m Telemetry          
echo              %COL%[90mDisabled\Deletes Telemetry
echo              %COL%[90mServices
echo.
echo                                                            %COL%[1;4;34mNvidia Tweaks%COL%[0m"
echo.
echo              %COL%[33m[%COL%[37m 8 %COL%[33m]%COL%[37m Disable HDCP               %COL%[33m[%COL%[37m 9 %COL%[33m]%COL%[37m Disable Preemption         %COL%[33m[%COL%[37m 10 %COL%[33m]%COL%[37m ProfileInspector
echo              %COL%[90mDisable Copy Protection Technology   %COL%[90mDisable Preemption Requests  %COL%[90mWill Edit Your Nvidia Control Panel
echo              %COL%[90mOf Illegal High Definition Content   %COL%[90mFrom The GPU Scheduler       %COL%[90mAnd Add Various Tweaks
echo.
echo              %COL%[33m[%COL%[37m 11 %COL%[33m]%COL%[37m Disable Write Combining
echo              %COL%[90mStops Data From Being Combined
echo              %COL%[90mAnd Temporarily Stored
echo.
echo.
echo.
echo                                     %COL%[90m[ B for back ]         %COL%[31m[ X to close ]         %COL%[36m[ N page two ]
echo.
set /p choice="%DEL%                                        %COL%[37mSelect a corresponding number to the options above > "
if /i "%choice%"=="1" goto PowerCfg
if /i "%choice%"=="2" goto SvcHost
if /i "%choice%"=="3" goto MsiMode
if /i "%choice%"=="4" goto Affinity
if /i "%choice%"=="5" goto Win32Priority
if /i "%choice%"=="6" goto MouseOptimize
if /i "%choice%"=="7" goto Telemetry
if /i "%choice%"=="8" goto DisableHDCP
if /i "%choice%"=="9" goto DisablePreemption
if /i "%choice%"=="10" goto Nvidia
if /i "%choice%"=="11" goto DisableWriteCombining
if /i "%choice%"=="X" exit /b
if /i "%choice%"=="B" goto TitleEnglish
if /i "%choice%"=="N" (set "PG=TweaksPG2") & goto TweaksPG2

:TweaksPG2
cls
echo.
echo                                                                                                              %COL%[36mPage 2/2
echo                                                           %COL%[1;4;34mNetwork Tweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Optimize TCP/IP             %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m Optimize NIC               %COL%[33m[%COL%[37m 3 %COL%[33m]%COL%[37m Optimize Netsh
echo              %COL%[90mTweaks your Internet Protocol       %COL%[90mOptimize your Network Card settings  %COL%[90mThis Tweak Will Optimize Your
echo              %COL%[91mDon't use if you are using Wi-Fi    %COL%[91mDon't use if you are using Wi-Fi     %COL%[90mComputer Network Configuration
echo.
echo                                                             %COL%[1;4;34mGPU ^& CPU%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 4 %COL%[33m]%COL%[37m All GPU Tweaks %ALLOF%             %COL%[33m[%COL%[37m 5 %COL%[33m]%COL%[37m Optimize Intel iGPU        %COL%[33m[%COL%[37m 6 %COL%[33m]%COL%[37m AMD GPU Tweaks
echo              %COL%[90mVarious essential tweaks for all  %COL%[90mIncrease dedicated video Vram On   %COL%[90mConfigure AMD GPU To Optimized
echo              %COL%[90mGPU Brands And Manufacturers      %COL%[90ma Intel iGPU                       %COL%[90mSettings
echo.
echo                                                        %COL%[1;4;34mMiscellaneous Tweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 7 %COL%[33m]%COL%[37m Reduce Audio Latency        %COL%[33m[%COL%[37m 8 %COL%[33m]%COL%[37m Debloat                    %COL%[33m[%COL%[37m 9 %COL%[33m]%COL%[37m Bluetooth Fix
echo              %COL%[90mReduces Audio Latency  	       %COL%[90mDelete Preinstalled	       %COL%[90mFixes Bluetooth If It
echo              %COL%[91mDon't Use On Slow Or Old CPU's    %COL%[90mPrograms                         %COL%[90mWon't Connect To Device
echo.
echo              %COL%[33m[%COL%[37m 10 %COL%[33m]%COL%[37m BCD Tweaks                 %COL%[33m[%COL%[37m 11 %COL%[33m]%COL%[37m System Tools Enabler      %COL%[33m[%COL%[37m 12 %COL%[33m]%COL%[37m Soft Restart
echo              %COL%[90mApply BCD Tweaks For              %COL%[90mSystem Tools Is An Utility Added %COL%[90mIf You PC Has Been Running A While
echo              %COL%[90mLess Boot Time                    %COL%[90mTo Right Click Context Menu      %COL%[90mUse This For A Quick Boost
echo.
echo.
echo.
echo                                     %COL%[90m[ B for back ]         %COL%[31m[ X to close ]         %COL%[36m[ N page one ]
echo.
set /p choice="%DEL%                                        %COL%[37mSelect a corresponding number to the options above > "
if /i "%choice%"=="1" goto TcpIp
if /i "%choice%"=="2" goto NIC
if /i "%choice%"=="3" goto NetshOptions
if /i "%choice%"=="4" goto AllGPU
if /i "%choice%"=="5" goto Intel
if /i "%choice%"=="6" goto AMD
if /i "%choice%"=="7" goto:AudioOptions
if /i "%choice%"=="8" goto:Debloat
if /i "%choice%"=="9" goto:BluetoothFix
if /i "%choice%"=="10" goto:BCDTweaks
if /i "%choice%"=="11" goto:SystemToolsEnabler
if /i "%choice%"=="12" call:SoftRestart
if /i "%choice%"=="X" exit /b
if /i "%choice%"=="B" goto TitleEnglish
if /i "%choice%"=="N" (set "PG=TweaksPG1") & goto TweaksPG1


Title Applying Tweaks
setlocal EnableDelayedExpansion
mkdir %SYSTEMDRIVE%\Gaming_Pack\Resources\
cls
:BCDTweaks
echo Applying BCD Tweaks For Lower Input Delay
echo.
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
bcdedit /set tscsyncpolicy enhanced
echo.
goto TweaksPG2
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
echo Fixing Bluetooth
  
:BluetoothFix 
echo Fix Bluetooth By scar#1000
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d "3" /f
goto TweaksPG2

echo Tweaking Your Gpu\Tweakowanie Twojej Karty Graficznej

:GPU
cls
cls
echo What Brand is Your GPU?(If You Don't Have one Just type 2 or 3)\Jakiej Marki Jest Twoja Karta Graficzna (Jesli Nie Masz To Wybierz 2 lub 3)
echo 1. Nvidia
echo 2. AMD
echo 3. Intel
choice /C:123 /N /M "> Enter Your Choice on the Keyboard [1,2,3..] : "	
if errorlevel  3 goto:AllGPU
if errorlevel  2 goto:AMD
if errorlevel  1 goto:Nvidia

:Nvidia
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TurboQueue" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableVIASBA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableIrongateSBA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableAGPSBA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableAGPFW" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "FastVram" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "ShadowFB" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TexturePrecache" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableFastCopyPixels" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TCCSupported" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\NVIDIA Corporation\Global\NVTweak\Devices\509901423-0\Color" /v "NvCplUseColorCorrection" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableTiledDisplay" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID73779" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID73780" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID74361" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v OptInOrOutPreference /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\Startup\SendTelemetryData" /v "0" /t REG_DWORD /d "0" /f
cls
goto NV

:NV
Reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak\Devices\509901423-0\Color" /v "NvCplUseColorCorrection" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f
cls
Echo Choosing Type Of Nvidia Profile\Wybieranie Typu Profilu Nvidia
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
goto :AllGPU

:NV2
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757456349122600/Quality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Quality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%/Gaming_Pack/Resources/NvidiaProfileInspector.exe" "%SYSTEMDRIVE%/Gaming_Pack/Resources/Quality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPU

:NV3
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138759533838225498/Latency_And_MaxPerformance_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_And_MaxPerformance_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_and_MaxPerformance_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPU

:AllGPU
Echo Applying SystemProfile (GPU and Network) Tweaks.\Stosowanie Profilu Systemu (Karty Graficznej I Internetu.)
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "ffffffff" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "16" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "16" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ParamReg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "30" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "0200" /t Reg_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\0" /v "1700" /t Reg_BINARY /d "0000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000ff000000000000000000000000000000000000000000ff000000000000000000000000000000" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "scheduling Category" /t REG_SZ /d "High" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "00002710" /f
Reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "1024" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_sclkDeepSleepDisable" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f
cls
goto TweaksPG1

:AMD

:DisablePreemption
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f
goto TweaksPG1

:InternetTweaks
ipconfig /flushdns
ipconfig /release
ipconfig /renew
ipconfig /renew6
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNsclient" /v "EnableMulticast" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNsclient" /v "DisableSmartNameResolution" /t REG_DWORD /d "1" /f
goto EthernetOptions

:PromptForTcpIp
SET /P TcpIp=Do You Want To Change TcpIp Settings\Czy Chcesz Zmienic Ustawienia TcpIp?(Y/N)
IF /I "%TCPIP%" NEQ "Y" goto PromptForNetshOptions
IF /I "%TCPIP%" NEQ "N" goto TcpIp

:TcpIp
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxConnectRetransmissions" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckFrequency" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckTicks" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "CongestionAlgorithm" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MultihopSets" /t REG_DWORD /d "15" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "50" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d "17424" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "DisableParallelAandAAAA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
Reg add "HKLM\SYSTEM\CurrDisableNagleentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpInitialRTT" /d "300" /t REG_DWORD /f
goto TweaksPG2

:NetshOptions
netsh int ip reset
netsh int tcp reset
netsh winsock reset
netsh winsock reset proxy
netsh winsock reset catalog
netsh advfirewall reset
netsh interface ipv4 reset
netsh interface ipv6 reset
netsh interface ip delete arpcache
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global ecn=enabled
netsh int tcp set global initialRto=2000
netsh interface tcp set global MaxSynRetransmissions=2
netsh int tcp set supplemental template=custom icw=10
netsh int tcp set global autotuninglevel=disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int ipv6 set state disabled
netsh int isatap set state disabled
netsh int tcp set supplemental Internet CongestionProvider=Ctcp
netsh int tcp set supplemental Custom CongestionProvider=Ctcp
netsh int tcp set supplemental InternetCustom CongestionProvider=Ctcp
netsh int tcp set supplemental Datacenter CongestionProvider=Ctcp
netsh int tcp set supplemental Compat CongestionProvider=Ctcp
netsh int tcp set supplemental Template=Internet CongestionProvider=Ctcp
netsh int tcp set supplemental Template=Datacenter CongestionProvider=Ctcp
netsh int tcp set supplemental Template=Compat CongestionProvider=Ctcp
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=Ctcp
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=Ctcp
netsh interface isatap set state disabled
netsh interface ip set interface ethernet currenthoplimit=64
netsh int tcp set security profiles=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int ip set global icmpredirects=disabled
netsh int teredo set state disabled
netsh int tcp set global maxsynretransmissions=2
netsh winsock set autotuning onv
Reg add "HKCU\Software\Gaming" /v "NetshOptimize" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
goto TweaksPG2

:Nic
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "MIMOPowerSaveMode" /t REG_SZ /d "3" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "PowerSavingMode" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*EEE" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableConnectedPowerGating" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableDynamicPowerGating" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "PnPCapabilities" /t REG_SZ /d "24" /f
REM more powersaving options
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "*NicAutoPowerSaver" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "ULPMode" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "EnablePME" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "AlternateSemaphoreDelay" /t REG_SZ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "PerfLevelSrc" /t REG_DWORD /d "8738" /f
cls
goto TweaksPG2

:ChangeDNS
netsh interface ipv4 add dnsservers "Ethernet" address=1.1.1.1 index=1
netsh interface ipv4 add dnsservers "Ethernet" address=8.8.8.8 index=2

netsh interface ipv4 add dnsservers "Wi-Fi" address=1.1.1.1 index=1
netsh interface ipv4 add dnsservers "Wi-Fi" address=8.8.8.8 index=2
goto TweaksPG2

:DeliveryOptions
cls
Echo Optimizing Delivery Options
@REM Disable Delivery Optimization P2P Update downlods outside of local network
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
goto TweaksPG2

:DistributeTimers
cls
Echo Distributing Timers
echo Disable DistributeTimers
Reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "DistributeTimers" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /f
goto TweaksPG2

:MouseOptimize
Reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
Reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
Reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorSensitivity" /t REG_DWORD /d "10000" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "IRRemoteNavigationDelta" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t REG_DWORD /d "5" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t REG_DWORD /d "40" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t REG_DWORD /d "50" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t REG_DWORD /d "16" /f
Reg add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t REG_DWORD /d "360" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
Reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
control.exe desk.cpl,Settings,@Settings
:ChooseScale
echo What is your current display scaling percentage? 100, 125, 150, 175, 200, 225, 250, 300, 350 (Don't put a %% symbol)
set /p choice=" scale > "
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
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d "4" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t REG_DWORD /d "3" /f
goto TweaksPG1

Echo Disabling System Auto-Loggers

:SystemAuto-Loggers
echo Disable System Auto-Loggers 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsclient" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f 
Reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\NtfsLog" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\FaceUnlock" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\FaceRecoTel" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Audio" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsconsumerFeatures" /t REG_DWORD /d "1" /f
cls
goto PowerSaving

:PromptForUSBPowerSaving
SET /P Usb=Do You Want To Disable USB Power Saving Settings\Czy Chcesz Wylaczyc Ustawienia Oszczedzania Energii USB?(Y/N)
IF /I "%USB%" NEQ "Y" goto PowerThrottling
IF /I "%USB%" NEQ "N" goto USBPowerSaving

:PowerSaving
Echo Disabling System energy-saving techniques.
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
goto PromptForUSBPowerSaving

:USBPowerSaving
for /f "tokens=*" %%i in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "StorPort" ^| findstr "StorPort"') do Reg add "%%i" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f
for /f "tokens=*" %%i in ('wmic PATH Win32_PnPEntity GET DeviceID ^| findstr "USB\VID_"') do (
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnableSelectiveSuspend" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters" /v "D3ColdSupported" /t REG_DWORD /d "0" /f
)
goto PowerThrottling

:PowerThrottling
Echo Disabling PowerThrottling 
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
goto Services

:Services
cls
Echo Disabling Unnecessary System Services For Less System Usage\Wylaczanie Niepotrzebnych Serwisow Dla Mniejszego Uzycia Systemu
echo.
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TapiSrv" /v "Start" /t REG_DWORD /d "4" /f 
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpcMonSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LanmanWorkstation\Parameters" /v "DisableBandwidthThrottling" /t REG_DWORD /d "1" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WEPHOSTSVC" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2psvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PhoneSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RmSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorDataService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensrSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\perceptionsimulation" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\StiSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\autotimesvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationBrokerSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdatem" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MicrosoftEdgeElevationService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ALG" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\IpxlatCfgSvc" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DusmSvc" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdate" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorService" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\shpamsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\svsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MSiscSI" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Netlogon" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CscService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ssh-agent" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\AppReadiness" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tzautoupdate" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Nfsclnt" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wisvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\defragsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedRealitySvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lltdsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TrkWks" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CryptSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationscripting" /t REG_DWORD /d "1" /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d 4 /f 
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f 
Reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\diagsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TroubleshootingSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DsSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "0.0.0.0" /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoActiveHelp" /t REG_DWORD /d 1 /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\FileHistory" /v "Disabled" /t REG_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f 
Reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d 0 /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d "1" /f
Reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f 
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FrameServer" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\OSRSS" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sedsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /
set toDisable=DiagTrack diagnosticshub.standardcollector.service dmwappushservice RemoteRegistry RemoteAccess scardSvr scPolicySvc fax WerSvc NvTelemetryContainer gadjservice AdobeARMservice PSI_SVC_2 lfsvc WalletService RetailDemo SEMgrSvc diagsvc AJRouter amdfendr amdfendrmgr
(for %%a in (%toDisable%) do ( 
   sc stop %%a
   sc config %%a start= disabled 
))
cls
goto

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
fsutil behavior set disable8dot3 1
cls
goto 

:AudioOptions
cd "%SYSTEMDRIVE%\Gaming\Resources\"
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\nssm.exe" ( goto Real ) else ( goto Downloadnssm )
:Downloadnssm
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\nssm.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/nssm.exe"
goto Real
:Real
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\REAL.exe" ( goto ContinueAudioOptions ) else ( goto DownloadREAL )
:DownloadREAL
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/REAL.exe"
goto ContinueAudioOptions
:ContinueAudioOptions
nssm install GamingAudio "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe"
nssm set GamingAudio DisplayName Gaming Audio Latency Reducer Service
nssm set GamingAudio Description Reduces Audio Latency
nssm set GamingAudio Start SERVICE_AUTO_START
nssm set GamingAudio AppAffinity 1
nssm set GamingAudio start SERVICE_AUTO_START
nssm start GamingAudio
goto TweaksPG2

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
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /Disable
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics"
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable
schtasks /end /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks"
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
schtasks /end /tn "\Microsoft\Windows\AppID\SmartscreenSpecific"
schtasks /change /tn "\Microsoft\Windows\AppID\SmartscreenSpecific" /disable
schtasks /end /tn "\Microsoft\Windows\HelloFace\FODCleanupTask"
schtasks /change /tn "\Microsoft\Windows\HelloFace\FODCleanupTask" /disable
schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClient"
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /disable
schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnscenarioDownload"
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnscenarioDownload" /disable
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
schtasks /Change /TN "Microsoft\Windows\AppID\SmartscreenSpecific" /Disable
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
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\EpicOnlineServices" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GoogleChromeElevationService" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdate" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Origin Client Service" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Origin Web Helper Service" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdatem" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Steam Client Service" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\17.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\17.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnabled" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnabled" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Office\17.0\Common" /v "QMEnabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\Vscommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\Vscommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\Vscommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Wow6432Node\Microsoft\Vscommon\17.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\Vscommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\Vscommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\Vscommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\Vscommon\17.0\SQM" /v "OptIn" /t REG_DWORD /d 0 /f
Reg add "HKLM\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d 1 /f
Reg add "HKLM\Software\Policies\Microsoft\VisualStudio\Feedback" /v "DisablescreenshotCapture" /t REG_DWORD /d 1 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_SZ /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupEnabled" /t REG_SZ /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /t REG_SZ /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_SZ /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "TraceLevelThreshold" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "EnableTracing" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "EnableTracing" /t REG_DWORD /d "0" /f
Reg add "HKCEnableRID44231EU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\Tracing\WPPMedia" /f
Reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\WPPMedia" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "2" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo" /v "Value" /t REG_DWORD /d "0" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v /t REG_SZ /d "Deny" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v /t REG_SZ /d "Deny" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "POWERSHELL_TELEMETRY_OPTOUT" /t REG_SZ /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\AppV\CEIP" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance" /v "DisableDiagnosticTracing" /t REG_DWORD /d "1" /f
Reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f 
Reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f 
Reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "DoSvc" /t REG_DWORD /d 3 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f
Reg add "HKCU\SOFTWARE\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
Reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t "REG_DWORD" /d "0" /f
Reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /f
Reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\SQMClient\IE" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\SQMClient\IE" /v "SqmLoggerRunning" /t REG_DWORD /d "0" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags" /v "UpgradeEligible" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\TelemetryController" /f
setx DOTNET_CLI_TELEMETRY_OPTOUT 1
setx POWERSHELL_TELEMETRY_OPTOUT 1
Echo Disabling Data Collection Bloatwares\Wylaczanie Gromadzenie Danych Dla Oprogramowan Typu BloatWare

@rem *** Disable Data Collection bloatwares ***
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f

Echo Disabling Settings App Unnecessary And Telemetry Options\Wylaczanie Niepotrzebnych Ustawien Aplikacji I Opcje Telemetrii

@REM - Smartscreen Filter for Store Apps: Disable
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d "0" /f
REM - Let websites provide locally...
Reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d "1" /f
goto TweaksPG1

:PowerCfg
PowerCfg -duplicatescheme 44444444-4444-4444-4444-444444444451 77777777-7777-7777-7777-777777777799
PowerCfg -changename 77777777-7777-7777-7777-777777777799 "ExtremeSpeed By Hajkusi"
PowerCfg -setactive 77777777-7777-7777-7777-777777777799
PowerCfg -setacvalueindex 77777777-7777-7777-7777-777777777799 238c9fa8-0aad-41ed-83f4-97be242c8f20 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
PowerCfg -setdcvalueindex 77777777-7777-7777-7777-777777777799 238c9fa8-0aad-41ed-83f4-97be242c8f20 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
PowerCfg -setacvalueindex scHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
PowerCfg -setACvalueindex scheme_current SUB_PROCESSOR SYscOOLPOL 1
PowerCfg -setDCvalueindex scheme_current SUB_PROCESSOR SYscOOLPOL 1
PowerCfg -x -hibernate-timeout-ac 0
PowerCfg -x -hibernate-timeout-dc 0
PowerCfg -change -monitor-timeout-ac 5
PowerCfg -change -monitor-timeout-dc 3
PowerCfg -change -disk-timeout-ac 0
PowerCfg -change -disk-timeout-dc 0
PowerCfg -change -standby-timeout-ac 0
PowerCfg -change -standby-timeout-dc 0
PowerCfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
PowerCfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
cls
goto TweaksPG1

:sc
Sc config dmwappushservice start= disabled
Sc config diagnosticshub.standardcollector.service start= disabled
Sc config DcpSvc start=disabled
Sc config DiagTrack start=disabled
Sc config SysMain start= disabled
Sc config WMPNetworkSvc start=disabled
Sc config WerSvc start= disabled
Sc config XblAuthManager start= disabled
Sc config XblGameSave start= disabled
Sc config XboxGipSvc start= disabled
Sc config XboxNetApiSvc start= disabled
Sc config diagnosticshub.standardcollector.service start=disabled
Sc config dmwappushservice start=disabled
Sc config xbgm start= disabled
Sc config WpcMonSvc start= disabled
Sc config DoSvc start=disabled
Sc stop DcpSvc
Sc stop DiagTrack
Sc stop WMPNetworkSvc
Sc stop WerSvc
Sc stop diagnosticshub.standardcollector.service
Sc stop mwappushservice
Sc stop DoSvc
Sc stop dmwappushservice
goto FSE

:FSE
Echo Enabling Full-screen Exclusive\Wlaczanie Trybu Ekskluzywny Pelny Ekran
Reg delete "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /f
Reg delete "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowscompatible" /t REG_DWORD /d "1" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v /t REG_DWORD /d "0" /f
Reg add "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /t Reg_BINARY /d "020001000000c4200000000000000000000000000000000000000000000000000000000000000000" /f
Reg add "HKCU\System\GameConfigStore" /v "Win32_GameModeRelatedProcesses" /t Reg_BINARY /d "010001000100670061006d006500700061006e0065006c002e006500780065000000ee001e8af974e0553503201136031e000000e05535031e0000000f000000a0e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f
goto DisableDiagnostics

:DisableDiagnostics
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_dWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "DiagnosticErrorText" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticErrorText" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticLinkText" /t REG_SZ /d "" /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsconsumerFeatures" /t REG_DWORD /d "1" /f
goto SMB1

:SMB1
Powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol' -NoRestart"
Powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SmbDirect' -NoRestart"
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mrxsmb10" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d "0" /f
goto GpuTweaks

:GpuTweaks
echo Enabling Hardware Accelerated GPU scheduling\Wlaczanie Przyspieszonego Sprzetowo Planowania Karty Graficznej
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /f /v "HwschMode" /t REG_DWORD /d "2"
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
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "%HardwareDataQueueSize%" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "%HardwareDataQueueSize%" /f
goto MemoryTweaks

:MemoryTweaks
echo.
Echo adding more ram for applications in system memory caching to improve microstuttering\Dodanie wiekszej ilosci pamieci RAM dla aplikacji w buforowaniu pamieci systemowej w celu poprawy mikrozacinania
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

Echo Paging Executive Is Used To Load System Files Such As Kernel And Hardware Drivers To The Page File When Needed. Disable Will Force Run Into Not Virtual Memory\Paging Executive Sluzy Do ladowania Plikow Systemowych, Takich Jak Sterowniki Kernel I Sprzetu, Do Pliku Stronicowania W Razie Potrzeby. Wylaczenie Spowoduje Wymuszenie Uruchomienia Pamieci Nie Wirtualnej
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f

Echo Disabling Windows Attempt To Save As Much RAM As Possible, Such As Sharing Pages For Images, Copy-On-Write For Data Pages, And Compression\Wylaczanie Systemu Windows Proba Zaoszczedza Jak Najwiekszej Ilosci Pamieci RAM, Na Przyklad Udostepnianie Stron Obrazow, Kopiowanie Przy Zapisie Stron Danych I Kompresji
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f

Reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f
goto 

:Win32Priority
Echo Applying Optimal Win32Priority For Balanced FPS And Latency\Zastosowywanie Optymalnych Ustawien Dla Win32Priority Dla Zbalansowanych Fps i Mniejszego Opoznienia Systemu
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ13Priority" /t REG_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ0Priority" /t REG_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967286Priority" /t REG_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967287Priority" /t REG_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "ConvertibleSlateMode" /t REG_DWORD /d "00000000" /f
goto TweaksPG1

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

:Debloat
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
set listofbloatware=Automate Appconnector Microsoft3DViewer MicrosoftPowerBIForWindows MicrosoftPowerBIForWindows Print3D GetHelp BingFoodAndDrink BingHealthAndFitness BingTravel WindowsReadingList MixedReality.Portal screenSketch YourPhone PicsArt-PhotoStudio EclipseManager PolarrPhotoEditorAcademicEdition Wunderlist LinkedInforWindows AutodeskSketchBook Twitter DisneyMagicKingdoms MarchofEmpires ActiproSoftwareLLC Plex iHeartRadio FarmVille2CountryEscape Duolingo CyberLinkMediaSuiteEssentials DolbyAccess DrawboardPDF FitbitCoach Flipboard Asphalt8Airborne Keeper BingNews COOKINGFEVER PandoraMediaInc CaesarsSlotsFreeCasino PhototasticCollage TuneInRadio WinZipUniversal XING MicrosoftOfficeHub ConnectivityStore Hotspot Sketchable Clipchamp ToDo Family NewVoiceNote SamsungNotes SamsungFlux StudioPlus SamsungWelcome SamsungQuickSearch SamsungPCCleaner SamsungCloudBluetoothSync PCGallery OnlineSupportSService HPJumpStarts HPPCHardwareDiagnosticsWindows HPPowerManager HPPrivacySettings HPSupportAssistant HPSureShieldAI HPSystemInformation HPQuickDrop HPWorkWell myHP HPDesktopSupportUtilities HPQuickTouch HPEasyClean HPSystemInformation MicrosoftTeams ACGMediaPlayer AdobePhotoshopExpress HiddenCity Hulu Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe MicrosoftSolitaireCollection MicrosoftStickyNotes Microsoft.people Microsoft.Wallet MinecraftUWP Todos Viber bingsports
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
goto PromptRam
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

:PromptRam
cls
SET /P RAM=Size Of Ram Which Was Chosen Is %Choice% Continue?, Or Change?\Wielkosc Ramu, Ktora Zostala Wybrana To %Choice% Kontynuuj, Lub Zmienic?(Y/N)
IF /I "%RAM%" NEQ "Y" goto SvcHost
IF /I "%RAM%" NEQ "N" goto Y

:4GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "68764420" /f
bcdedit /set increaseuserva 2000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1
:6GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "103355478" /f
bcdedit /set increaseuserva 3000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1
:8GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "137922056" /f
bcdedit /set increaseuserva 4000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1
:16GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "376926742" /f
bcdedit /set increaseuserva 8000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1
:32GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "861226034" /f
bcdedit /set increaseuserva 16000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1
:64GB
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "1729136740" /f
bcdedit /set increaseuserva 32000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1

:PromptForAddTakeOwnerShipInContextMenu
ET /P TakeOwnerShipInContext=Do You Want To add Take OwnerShip In Context Menu\Czy Chcesz Dodac Take OwnerShip do Menu Kontekstowego?(Y/N)
IF /I "%TAKEOWNERSHIPINCONTEXTMENU%" NEQ "Y" goto PromptForOptionalTweaks
IF /I "%TAKEOWNERSHIPINCONTEXTMENU%" NEQ "N" goto AddTakeOwnerShipInContextMenu

:AddTakeOwnerShipInContextMenu
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" ( goto RegImportContext ) else ( goto Show-Take-Ownership-Context-Menu.Reg )
:DownloadShow-Take-Ownership-Context-Menu.Reg
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/Show-Take-Ownership-Context-Menu.Reg"
goto 

:MsiMode
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0x00000001" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
goto TweaksPG1

:Affinity
if !NumberOfCores! gtr 4 (
	for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
		reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "3" /f
		reg delete "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "AssignmentSetOverride" /f
	)
	for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
		reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "5" /f
		reg delete "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "AssignmentSetOverride" /f
	)
)
goto TweaksPG1

:DisableWriteCombining
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /t Reg_DWORD /d "1" /f
goto TweaksPG1

:DisableHDCP
reg add "HKCU\Software\Gaming" /v "HDCPTweaks" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
goto TweaksPG1

:RegImportContext
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
Reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f
@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
Reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f

@REM Optional Tweaks"
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v WebWidgetAllowed /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\scheduledDiagnostics" /v "EnableExecution" /t REG_DWORD /d "0" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\scheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
Reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1000" /f
Reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "5000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsolutePointerAsAbsolute" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsoluteAsRelative" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" /v "DisableMFUTracking" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\75b0ae3f-bce0-45a7-8c89-c9611c25e100" /v "Attributes" /t REG_DWORD /d "2" /f
Reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCR\*" /v "DefaultDropEffect" /t REG_DWORD /d "1" /f
Reg add "HKCR\AllFilesystemObjects" /v "DefaultDropEffect" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "DefaultPnPCapabilities" /t REG_DWORD /d "24" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v /t "REG_DWORD" /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d "0" /t REG_DWORD /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_DWORD /d "58" /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314559Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "scoobeSystemSettingEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsconsumerFeatures" /t REG_DWORD /d 1 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RemediationRequired" /t REG_DWORD /d "0" /f
Reg add "HKLM\Software\Policies\Microsoft\PushToInstall" /v "DisablePushToInstall" /t REG_DWORD /d "1" /f
Reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions" /f
Reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /f
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockscreenEnabled" /t REG_DWORD /d 0 /f
Reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockscreenOverlayEnabled" /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WindowsInkWorkspace\AllowSuggestedAppsInWindowsInkWorkspace" /v /t REG_DWORD /d 0 /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesconsent" /t REG_DWORD /d "2" /f
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "TuningTweak" /t
Reg add "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E968-E325-11CE-BFC1-08002BE10318}\0000" /v "AllowDeepCStates" /t REG_DWORD /d "0" /f
for /f %%i in ('Reg query "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /t REG_SZ /s /e /f "NVIDIA" ^| findstr "HKEY"') do (
Reg add "%%i" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Perflib" /v "DisablePerformanceCounters" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
)
Reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "0" /f
Reg add "HKCU\AppEvents\schemes" /f reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "4096" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__COMPAT_LAYER" REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "scenarioExecutionEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "Value" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockSreenCamera" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "VDMDisallowed" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableWizard" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "SbEnable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\DeviceHealthAttestationService" /v "DisableSendGenericDriverNotFoundToWER" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "RSoPLogging" /t REG_DWORD /d "0" /f
Reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /t REG_DWORD /d "1"
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t Reg_ /d "0" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f
Reg add "HKLM\System\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoreParkingDisabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FeatureTestControl" /t REG_DWORD /d "0x0000ffff" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /t REG_DWORD /d "0" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f
Reg add "HKLM\SOFTWARE\Microsoft\.NetFramework\v4.0.30319" /v "schUseStrongCrypto" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\.NETFramework\v4.0.30319" /v "schUseStrongCrypto" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_dWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\HelpSvc" /v "Headlines" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoSecondLevelCollection" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoFileCollection" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoExternalURL" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Policies\Microsoft\DeviceHealthAttestationService" /v "EnableDeviceHealthAttestationService" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power\" /v "HyperBootEnabled" /t REG_DWORD /d "1" /f
schtasks /Change /TN "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender scheduled scan" /RL LIMITED
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
SET DEVMGR_SHOW_NONPRESENT_DEVICES=1
Powershell -NoProfile -Command "Disable-MMAgent -PagingCombining -mc"
Defrag.exe
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
Reg add "HKCR\DesktopBackground\Shell\SystemTools" /v "MUIVerb" /t REG_SZ /d "System Tools" /f
Reg add "HKCR\DesktopBackground\Shell\SystemTools" /v "SubCommands" /t REG_SZ /d "control;cleanmgr;devmgr;event;Regedit;secctr;msconfig;taskmgr;taskschd;wu" /f
Reg add "HKCR\DesktopBackground\Shell\SystemTools" /v "icon" /t REG_SZ /d "imageres.dll,104" /f
Reg delete "HKCR\DesktopBackground\Shell\SystemTools" /v "Position" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /ve /t REG_SZ /d "Control Panel" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /v "icon" /t REG_SZ /d "control.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control\command" /ve /t REG_SZ /d "control.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /ve /t REG_SZ /d "Disk Cleanup" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /v "icon" /t REG_SZ /d "cleanmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr\command" /ve /t REG_SZ /d "cleanmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /ve /t REG_SZ /d "Device Manager" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /v "Icon" /t Reg_EXPAND_SZ /d "devmgr.dll" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr\command" /ve /t Reg_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe /s %%SystemRoot%%\system32\devmgmt.msc" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /ve /t REG_SZ /d "Event Viewer" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /v "icon" /t REG_SZ /d "eventvwr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event\command" /ve /t Reg_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe /s %%SystemRoot%%\system32\eventvwr.msc" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Regedit" /ve /t REG_SZ /d "Registry Editor" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Regedit" /v "icon" /t REG_SZ /d "Regedit.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Regedit\command" /ve /t REG_SZ /d "Regedit.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /ve /t REG_SZ /d "Security Center" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /v "icon" /t REG_SZ /d "wscui.cpl" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr\command" /ve /t REG_SZ /d "control wscui.cpl" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /ve /t REG_SZ /d "System Configuration" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /v "icon" /t REG_SZ /d "msconfig.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig\command" /ve /t REG_SZ /d "msconfig.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /ve /t REG_SZ /d "Task Manager" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /v "icon" /t REG_SZ /d "taskmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr\command" /ve /t REG_SZ /d "taskmgr.exe" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /ve /t REG_SZ /d "Task scheduler" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /v "icon" /t REG_SZ /d "miguiresource.dll,1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd\command" /ve /t REG_SZ /d "Control schedtasks" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wu" /ve /t REG_SZ /d "Windows Update" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wu" /v "icon" /t REG_SZ /d "wucltux.dll" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wu\command" /ve /t REG_SZ /d "wuapp.exe" /f
goto TweaksPG2

:SoftRestart
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\NSudo.exe" ( goto NSudo ) else ( goto DownloadNSudo )
:DownloadNSudo
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\NSudo.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/NSudo.exe"
cd "%SYSTEMDRIVE%\Gaming_Pack\Resources\"
:Nsudo
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "Reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f" >nul 2>&1
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "sc start "TrustedInstaller"" >nul 2>&1
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\Restart" ( goto EmptyStandbyList ) else ( goto DownloadRestart64 )
:DownloadRestart64
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\Restart64.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/restart64.exe"
goto EmptyStandbyList
:EmptyStandbyList
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\EmptyStandbyList.exe" ( goto ContinueSoftRestart ) else ( goto DownloadEmptyStandbyList )
:DownloadEmptyStandbyList
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\EmptyStandbyList.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/EmptyStandbyList.exe"
goto ContinueSoftRestart
:ContinueSoftRestart
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
goto TweaksPG2