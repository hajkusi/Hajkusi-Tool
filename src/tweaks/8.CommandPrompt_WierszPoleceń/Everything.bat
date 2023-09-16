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
cls
goto LanguageChooser

:LanguageChooser
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Polski                                                                              %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m English
echo.
%SYSTEMROOT%\System32\choice.exe /c:12 /n /m "%DEL%                             Select a corresponding number to the options above > "
set choice=%errorlevel%
If "%choice%"=="1" goto AlertPolish
If "%choice%"=="2" goto AlertEnglish

:AlertEnglish
cls
echo %COL%[91m  WARNING:
echo %COL%[37m  Please Note That I Cannot Guarantee An FPS Boost From Applying Optimizations, Results Are On Discord.
echo.
echo     %COL%[33m1.%COL%[37m Everything Is "Use At Your Own Risk", I Am %COL%[91mNOT LIABLE%COL%[37m If You Damage Your System In Any Way
echo        (ex. Not Following The Disclaimers Carefully).
echo.
echo     %COL%[33m2.%COL%[37m If You Don't Know What A Tweak Is,Do Not Use It!.
echo.
echo     %COL%[33m3.%COL%[37m We Highly Recommend Making A Manual Restore Point Before Running.
echo.
echo   For Any Questions And/Or Concerns, Please Join My Discord: https://discord.gg/YQT6PsjZeQ
echo.
echo   Please Enter "I_Agree" Without Quotes To Continue:
echo.
echo.
echo.
If %Input% EQU I_Agree ( goto DisclaimerEnglish ) else ( goto AlertEnglish )
:DisclaimerEnglish
reg add "HKCU\Software\Gaming" /v "Disclaimer" /f >nul 2>&1
goto TitleEnglish

:TitleEnglish
Mode 130,45
cls
echo.
echo                                        %COL%[90m Gaming-Pack Is A Free And Open-Source Desktop And Laptop Utility.
echo                                        %COL%[90m Gaming-Pack Was Made To Improve Your Fps.
pause
goto TweaksPG1English

:AlertPolish
cls
echo %COL%[91m  OSTRZEZENIE:
echo %COL%[37m  Prosze Zapamietaj Ze Nie Zagwarantuje Ci FPS Boosta Z Zastosowywania Optymalizacji, Rezultaty Sa Na Discordzie.
echo.
echo     %COL%[33m1.%COL%[37m Wszystko Jest "Uzywaj Na Wlasne Ryzyko", Jestem %COL%[91mNie Odpowiedzialny%COL%[37m Jesli Zniszcze Twoj System!.
echo        (np. Niestosowanie Sie Dokladnie Do Zastrzezen).
echo.
echo     %COL%[33m2.%COL%[37m Jesli Nie Wiesz Do Czego Sluzy Tweak,To Go Nie Uzywaj!.
echo.
echo     %COL%[33m3.%COL%[37m Bardzo Polecam Manualnie Zrobic Punkt Przywracania Systemu!.
echo.
echo   Dla Pytan Wejdz Na Discord: https://discord.gg/YQT6PsjZeQ
echo.
echo   Prosze Wpisz "Zgadzam_Sie" Bez Nawiasow Zeby Kontynuowac:
echo.
echo.
echo.
Set /p "Input=%DEL%                                                            >: %COL%[92m"
If %Input% EQU Zgadzam_Sie ( goto DisclaimerPolish ) else ( goto AlertPolish )
:DisclaimerPolish
reg add "HKCU\Software\Gaming" /v "Disclaimer" /f >nul 2>&1
goto TitlePolish

:TitlePolish
Mode 130,45
cls
echo.
echo                                        %COL%[90m Gaming-Pack To Bezplatne Narzedzie Typu Open-Source Do Komputerow I Laptopow.
echo                                        %COL%[90m Gaming-Pack Zostal Stworzony by Zwiekszyc Twoje Fps'y.
pause
goto TweaksPG1Polish

:TweaksPG1English
cls
echo.
echo                                                                                                     %COL%[36mPage 1/2
echo                                                               %COL%[1;4;34mTweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Power Plan                  %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m OptimizeMemory              %COL%[33m[%COL%[37m 3 %COL%[33m]%COL%[37m MSI Mode
echo              %COL%[90mDesktop Power Plan, Good          %COL%[90mOptimize Ram,SvcHost, And More    %COL%[90mEnable MSI Mode For Gpu And
echo              %COL%[90mTo Use With A Laptop Battery.     %COL%[90mService Host To Your RAM          %COL%[90mNetwork Adapters
echo.
echo              %COL%[33m[%COL%[37m 4 %COL%[33m]%COL%[37m Affinity                    %COL%[33m[%COL%[37m 5 %COL%[33m]%COL%[37m W32 Priority Seperation     %COL%[33m[%COL%[37m 6 %COL%[33m]%COL%[37m Mouse Fix
echo              %COL%[90mThis Tweak Will Spread Devices    %COL%[90mOptimize The Usage Priority       %COL%[90mOptimize The Usage Of
echo              %COL%[90mOn Multiple Cpu Cores             %COL%[90mOf Your Running Services          %COL%[90mYour Mouse
echo.
echo              %COL%[33m[%COL%[37m 7 %COL%[33m]%COL%[37m Telemetry                   %COL%[33m[%COL%[37m 8 %COL%[33m]%COL%[37m Sc                          %COL%[33m[%COL%[37m 9 %COL%[33m]%COL%[37m Fse
echo              %COL%[90mDisable And Delete Telemetry      %COL%[90mConfigure Sc                      %COL%[90mEnable FullScreen
echo              %COL%[90mServices                          %COL%[90mCommand                           %COL%[90mOptimalizations
echo.             
echo              %COL%[33m[%COL%[37m 10 %COL%[33m]%COL%[37m Diagnostics                %COL%[33m[%COL%[37m 11 %COL%[33m]%COL%[37m SMB1                       %COL%[33m[%COL%[37m 12 %COL%[33m]%COL%[37m HardWareDataQueueSize
echo              %COL%[90mDisable Diagnostics               %COL%[90mDisable And Remove                %COL%[90mThis Will Increase\Decre
echo              %COL%[90mServices For Better Perf          %COL%[90mOld SMB1 Protocol                 %COL%[90mase HardWareDataQueueSize
echo.
echo                                                            %COL%[1;4;34mNvidia Tweaks%COL%[0m"
echo.
echo              %COL%[33m[%COL%[37m 13 %COL%[33m]%COL%[37m Disable HDCP               %COL%[33m[%COL%[37m 14 %COL%[33m]%COL%[37m Disable Preemption         %COL%[33m[%COL%[37m 15 %COL%[33m]%COL%[37m ProfileInspector
echo              %COL%[90mDisable Protection Technology Of  %COL%[90mDisable Preemption Requests       %COL%[90mWill Edit Your Nvidia Control Panel
echo              %COL%[90mIllegal High Definition Content   %COL%[90mFrom The GPU Scheduler            %COL%[90mAnd Add Various Tweaks
echo.
echo              %COL%[33m[%COL%[37m 16 %COL%[33m]%COL%[37m Disable Write Combining    %COL%[33m[%COL%[37m 17 %COL%[33m]%COL%[37m System Auto-Loggers
echo              %COL%[90mStop Data From Being Combined     %COL%[90mDisable System Auto-
echo              %COL%[90mAnd Temporarily Stored            %COL%[90mLoggers
echo.
echo.
echo.
echo                                     %COL%[90m[ B For Back ]         %COL%[31m[ X To Close ]         %COL%[36m[ N Page Two ]
echo.
set /p choice="%DEL%                                        %COL%[37mSelect a corresponding number to the options above > "
if /i "%choice%"=="1" goto:PowerCfgEnglish
if /i "%choice%"=="2" goto:SvcHostEnglish
if /i "%choice%"=="3" goto:MsiModeEnglish
if /i "%choice%"=="4" goto:AffinityEnglish
if /i "%choice%"=="5" goto:Win32PriorityEnglish
if /i "%choice%"=="6" goto:MouseOptimizeEnglish
if /i "%choice%"=="7" goto:TelemetryEnglish
if /i "%choice%"=="8" goto:ScEnglish
if /i "%choice%"=="9" goto:FseEnglish
if /i "%choice%"=="10" goto:DisableDiagnosticsEnglish
if /i "%choice%"=="11" goto:SMB1English
if /i "%choice%"=="12" goto:GetInputEnglish
if /i "%choice%"=="13" goto:DisableHDCPEnglish
if /i "%choice%"=="14" goto:DisablePreemptionEnglish
if /i "%choice%"=="15" goto:NvidiaEnglish
if /i "%choice%"=="16" goto:DisableWriteCombiningEnglish
if /i "%choice%"=="17" goto:SystemAuto-LoggersEnglish
if /i "%choice%"=="X" exit /b
if /i "%choice%"=="B" goto TitleEnglish
if /i "%choice%"=="N" (set "PG=TweaksPG2English") & goto TweaksPG2English

:TweaksPG2English
cls
echo.
echo                                                                                                              %COL%[36mPage 2/2
echo                                                           %COL%[1;4;34mNetwork Tweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Optimize TCP/IP             %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m Optimize NIC               %COL%[33m[%COL%[37m 3 %COL%[33m]%COL%[37m Optimize Netsh
echo              %COL%[90mTweak your Internet Protocol      %COL%[90mOptimize Your Network Card       %COL%[90mThis Tweak Will Optimize Your
echo              %COL%[91mDon't Use If You Are Using Wi-Fi  %COL%[91mDon't Use If You Are Using Wi-Fi %COL%[90mComputer Network Configuration
echo.
echo                                                             %COL%[1;4;34mGPU ^& CPU%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 4 %COL%[33m]%COL%[37m All GPU Tweaks              %COL%[33m[%COL%[37m 5 %COL%[33m]%COL%[37m Optimize Intel iGPU        %COL%[33m[%COL%[37m 6 %COL%[33m]%COL%[37m AMD GPU Tweaks
echo              %COL%[90mVarious Essential Tweaks For All  %COL%[90mIncrease Dedicated Video Vram On %COL%[90mConfigure AMD Graphics Card
echo              %COL%[90mGPU Brands And Manufacturers      %COL%[90mA Intel iGPU                     %COL%[90mTo Optimized Settings
echo.
echo                                                        %COL%[1;4;34mMiscellaneous Tweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 7 %COL%[33m]%COL%[37m Reduce Audio Latency        %COL%[33m[%COL%[37m 8 %COL%[33m]%COL%[37m Debloat                    %COL%[33m[%COL%[37m 9 %COL%[33m]%COL%[37m Bluetooth Fix
echo              %COL%[90mReduce Audio Latency  	       %COL%[90mDelete Preinstalled	        %COL%[90mFixes Bluetooth If It
echo              %COL%[91mDon't Use On Slow Or Old CPU's    %COL%[90mPrograms                         %COL%[90mDoesn't Connect To Device
echo.
echo              %COL%[33m[%COL%[37m 10 %COL%[33m]%COL%[37m BCD Tweaks                 %COL%[33m[%COL%[37m 11 %COL%[33m]%COL%[37m System Tools Enabler      %COL%[33m[%COL%[37m 12 %COL%[33m]%COL%[37m AddTakeOwnerShip
echo              %COL%[90mApply BCD Tweaks For              %COL%[90mAdd System Tools To              %COL%[90mAdd TakeOwnerShip In
echo              %COL%[90mLess Boot Time                    %COL%[90mRight Click Context Menu         %COL%[90mThe Context Menu
echo.
echo              %COL%[33m[%COL%[37m 13 %COL%[33m]%COL%[37m GPEditEnabler              %COL%[33m[%COL%[37m 14 %COL%[33m]%COL%[37m Soft Restart              %COL%[33m[%COL%[37m 15 %COL%[33m]%COL%[37m Optional Tweaks
echo              %COL%[90mEnable Gpedit For                 %COL%[90mIf Your PC Has Been Running A    %COL%[90mApply Optional Tweaks
echo              %COL%[90mWindows Home Version              %COL%[90mA Use This For A Quick Boost     %COL%[90mA Lot Of Tweaks
echo.
echo                                                        %COL%[1;4;34mPower Saving And Services%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 16 %COL%[33m]%COL%[37m Usb Power Saving           %COL%[33m[%COL%[37m 17 %COL%[33m]%COL%[37m Power Throttling          %COL%[33m[%COL%[37m 18 %COL%[33m]%COL%[37m Services  
echo              %COL%[90mDisable Power Saving For          %COL%[90mDisable Power Throttling For     %COL%[90mDisable: Services,Windows
echo              %COL%[90mEverything                        %COL%[90mAll Applications                 %COL%[90mServices And More
echo.
echo.
echo.
echo                                     %COL%[90m[ B For Back ]         %COL%[31m[ X To Close ]         %COL%[36m[ N page one ]
echo.
set /p choice="%DEL%                                        %COL%[37mSelect a corresponding number to the options above > "
if /i "%choice%"=="1" goto:TcpIpEnglish
if /i "%choice%"=="2" goto:NICEnglish
if /i "%choice%"=="3" goto:NetshOptionsEnglish
if /i "%choice%"=="4" goto:AllGPUEnglish
if /i "%choice%"=="5" goto:IntelEnglish
if /i "%choice%"=="6" goto:AMDEnglish
if /i "%choice%"=="7" goto:AudioOptionsEnglish
if /i "%choice%"=="8" goto:DebloatEnglish
if /i "%choice%"=="9" goto:BluetoothFixEnglish
if /i "%choice%"=="10" goto:BCDTweaksEnglish
if /i "%choice%"=="11" goto:SystemToolsEnablerEnglish
if /i "%choice%"=="12" goto:AddTakeOwnerShipEnglish
if /i "%choice%"=="13" goto:GPeditEnablerInHomeEnglish
if /i "%choice%"=="14" call:SoftRestartEnglish
if /i "%choice%"=="15" goto:OptionalTweaksEnglish
if /i "%choice%"=="16" goto:USBPowerSavingEnglish
if /i "%choice%"=="17" goto:PowerThrottlingEnglish
if /i "%choice%"=="18" goto:ServicesEnglish
if /i "%choice%"=="X" exit /b
if /i "%choice%"=="B" goto TitleEnglish
if /i "%choice%"=="N" (set "PG=TweaksPG1") & goto TweaksPG1English

:BCDTweaksEnglish
Title Applying Tweaks
setlocal EnableDelayedExpansion
mkdir %SYSTEMDRIVE%\Gaming_Pack\Resources\
cls
echo Applying BCD Tweaks For Lower Input Delay
echo.
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
bcdedit /set tscsyncpolicy enhanced
echo.
Reg add "HKCU\Software\Gaming" /v "BCDEditOptimized" REG_DWORD "1" /f
cls
goto TweaksPG2English
  
:BluetoothFixEnglish 
echo Fix Bluetooth By scar#1000
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d "3" /f
Reg add "HKCU\Software\Gaming" /v "BluetoothFixes" REG_DWORD /d "1" /f
goto TweaksPG2English

echo Tweaking Your Gpu\Tweakowanie Twojej Karty Graficznej

:NvidiaEnglish
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
Reg add "HKCU\Software\Gaming" /v "NvidiaGPUOptimized" REG_DWORD "1" /f
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\NVIDIA GPU Tweaks.reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/NVIDIA GPU Tweaks.reg"
cls
goto NVEnglish

:NVEnglish
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
if errorlevel  3 goto NV3English
if errorlevel  2 goto NV2English
if errorlevel  1 goto NV1English

:NV1English
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757435759276125/UltraQuality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\UltraQuality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\UltraQuality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPUEnglish

:NV2English
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757456349122600/Quality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Quality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%/Gaming_Pack/Resources/NvidiaProfileInspector.exe" "%SYSTEMDRIVE%/Gaming_Pack/Resources/Quality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPUEnglish

:NV3English
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138759533838225498/Latency_And_MaxPerformance_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_And_MaxPerformance_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_and_MaxPerformance_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPUEnglish

:AllGPUEnglish
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
Reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows Media Foundation" /f
Reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SpecificGPUOptionApplicable" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Avalon.Graphics" /v "DisableHWAcceleration" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Avalon.Graphics" /v "MaxMultisampleSize" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Avalon.Graphics" /v "UseReferenceRasterizer" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Avalon.Graphics" /v "DisableHWAcceleration" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Avalon.Graphics" /v "MaxMultisampleSize" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Avalon.Graphics" /v "UseReferenceRasterizer" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Avalon.Graphics" /v "DisableHWAcceleration" /t REG_DWORD /d "0" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Avalon.Graphics" /v "MaxMultisampleSize" /t REG_DWORD /d "0" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Avalon.Graphics" /v "UseReferenceRasterizer" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\SubSystems" /v "Optional" /t REG_SZ /d "" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseGpuTimer" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlTransitionLatency" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "D3PCLatency" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /t REG_SZ /d "AutoHDREnable=0;GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rundll32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bdeunlock.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bdechangepin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ClipDLS.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ScriptRunner.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApplySettingsTemplateCatalog.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Microsoft.Uev.CscUnpinTool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UevAppMonitor.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Microsoft.Uev.SyncController.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chgport.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chgusr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\query.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\logoff.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\qappsrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\qprocess.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\reset.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rwinsta.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tscon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tsdiscon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tskill.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\quser.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\qwinsta.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\baaupdate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\logagent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mfpmp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PackageInspector.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\manage-bde.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PresentationSettings.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AgentService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\repair-bde.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ClipRenew.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\gpscript.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CustomShellHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AssignedAccessGuard.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mavinject.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BitLockerDeviceEncryption.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpshell.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AppVClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BdeHdCfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CameraSettingsUIHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RemoteAppLifetimeManager.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpsign.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fveprompt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iotstartup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fvenotify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WPDShextAutoplay.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BdeUISrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbengine.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bootim.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WinBioDataModelOOBE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PresentationHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rstrui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\srdelayed.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SrTasks.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SpaceAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\provlaunch.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EduPrintProv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UNP\UNPUXHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UNP\UNPUXLauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UNP\UpdateNotificationMgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Spectrum.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SIHClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\xwizard.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\takeown.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\vssadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\where.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cacls.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\eventcreate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fsavailux.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ftp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\grpconv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\runas.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\systeminfo.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\taskkill.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tasklist.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\timeout.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\waitfor.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\whoami.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mstsc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TSTheme.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wkspbroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TSWbPrxy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RdpSa.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RdpSaProxy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RdpSaUacHelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sessionmsg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TieringEngineService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpclip.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpinput.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TapiUnattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dialer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tcmsetup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MultiDigiMon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tabcal.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\FsIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dvdplay.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\calc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\charmap.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\credwiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\certreq.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\certutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\klist.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ksetup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\nltest.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\regini.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\regsvr32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setspn.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\regedt32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ResetEngine.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SysResetErr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\systemreset.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemResetPlatform\SystemResetPlatform.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\migwiz\mighost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pwlauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fodhelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Fondue.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\OptionalFeatures.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CheckNetIsolation.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msiexec.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mblctr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msconfig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mmc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsActionDialog.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cliconfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\odbcad32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\odbcconf.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iscsicpl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iscsicli.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\IESettingSync.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ie4uinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ie4ushowIE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\F12\IEChooser.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ieUnatt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iexpress.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wextract.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mshta.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wiaacmgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wiawow64.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bridgeunattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\eventvwr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\gpresult.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\gpupdate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\esentutl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\eudcedit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wecutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\easinvoker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EhStorAuthn.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DpiScaling.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Dxpserver.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceProperties.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DisplaySwitch.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemSettingsRemoveDevice.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SyncHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DevicePairingWizard.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ComputerDefaults.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DataExchangeHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CompMgmtLauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\convert.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\find.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ktmutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\label.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\openfiles.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\replace.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Robocopy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\stordiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\choice.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\clip.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\doskey.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\forfiles.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\print.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\subst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cttune.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cttunesvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\help.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msdtc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CastSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UserDataSource.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\curl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tar.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\spaceman.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\spaceutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EDPCleanup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MDMAppInstaller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ARP.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\finger.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\HOSTNAME.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MRINFO.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NETSTAT.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ROUTE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sort.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TCPSVCS.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\xcopy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\auditpol.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mountvol.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\net.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\net1.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netsh.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PATHPING.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PING.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Reg" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setx.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TRACERT.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\attrib.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ClipUp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\diskusage.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\findstr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\icacls.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ipconfig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CIDiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\comp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fsutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\recover.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sdclt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PerceptionSimulation\PerceptionSimulationService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tcblaunch.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\securekernel.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SgrmBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SgrmLpac.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\upnpcont.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BioIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NgcIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dusmtask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WinBioPlugIns\FaceFodUninstaller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\oobeldr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\windeploy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\audit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\AuditShD.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MBR2GPT.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\Setup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\poqexec.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PkgMgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Dism\DismHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmdkey.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dpapimig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LsaIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cscript.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RmClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SecEdit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wscript.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\icsunattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NetHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmmon32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmstp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmdl32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rasautou.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rasdial.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rasphone.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ntprint.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\printui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceEject.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\powercfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sigverif.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\drvinst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\hdwwiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pnputil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wowreg32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\InfDefault-" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ndadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\newdev.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\driverquery.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PnPUnattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\FirstLogonAnim.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\msoobe.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\UserOOBEBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netbtugc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netiougc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\nbtstat.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NetCfgNotifyObjectHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\djoin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\getmac.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\shrpubw.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesAdvanced.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesComputerName.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesDataExecutionPrevention.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesHardware.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesPerformance.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesProtection.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesRemote.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winver.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sxstrace.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Sysprep\sysprep.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WSCollect.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WSReset.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\changepk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LicensingUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\phoneactivate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UpgradeResultsUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\GenValObj.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\slui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SppExtComObj.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sppsvc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Speech\SpeechUX\SpeechUXWiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\snmptrap.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\immersivetpmvscmgrsvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rmttpmvscmgrsvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tpmvscmgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tpmvscmgrsvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\OpenWith.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ThumbnailExtractionHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\verclsid.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WallpaperHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\prevhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rundll32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mcbuilder.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MSchedExe.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WUDFCompanionHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WUDFHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AxInstUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\consent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LanguageComponentsInstallerComHandler.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LockAppHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\la57setup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lpk-" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lpksetup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lpremove.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DsmUserTask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netcfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\runonce.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\secinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\colorcpl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dccw.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Dism.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\proquota.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UserAccountControlSettings.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\shutdown.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\efsui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cipher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\edpnotify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MicrosoftEdgeCP.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rekeywiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dnscacheugc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\nslookup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lodctr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\unlodctr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ddodiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\omadmclient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\omadmprc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DmOmaCpMo.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\coredpussvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceEnroller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dmcertinst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dmcfghost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CredentialUIBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SensorDataService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SecurityHealthHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\prproc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SecurityHealthService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Windows.Media.BackgroundPlayback.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sfc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wusa.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\wbemtest.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\scrcons.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApplyTrustOffline.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CustomInstallExec.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\deploymentcsphelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\expand.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ReAgentc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RelPost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MuiUnattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dxdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fontdrvhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winlogon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ucsvc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fltMC.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lsass.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ntoskrnl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\services.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\smss.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\csrss.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Boot\winload.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AggregatorHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dtdump.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\runexehelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdrleakdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wpr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pacjsworker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\userinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wininit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceCensus.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dllhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\conhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\extrac32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\makecab.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\svchost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\compact.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dwm.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dcomcnfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Locator.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Com\MigRegDB.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RpcPing.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mtstocom.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Com\comrepl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dllhst3g.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setupcl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setupugc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wimserv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chkdsk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chkntfs.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wsqmcons.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\autochk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\browser_broker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\browserexport.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Boot\winresume.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winresume.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winload.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bthudtask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fsquirt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bitsadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\refsutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\appidcertstorecheck.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\appidpolicyconverter.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SndVol.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sdbinst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pcalua.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LaunchTM.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pcaui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Taskmgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Utilman.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EaseOfAccessDialog.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Narrator.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\osk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sethc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AtBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Magnify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EoAExperiences.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CloudExperienceHostBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApplicationFrameHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ShellAppRuntime.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\desktopimgdownldr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemSettingsAdminFlows.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\VSSVC.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\convertvhd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wuauclt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MusNotifyIcon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsUpdateElevatedInstaller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MusNotification.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MusNotificationUx.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MoNotificationUx.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UsoClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Speech_OneCore\common\SpeechModelDownload.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Speech_OneCore\common\SpeechRuntime.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceCredentialDeployment.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LegacyNetUXHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wevtutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dasHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DiskSnapshot.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\verifier.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Register-CimProvider.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WinMgmt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WmiPrvSE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winrs.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winrshost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WMIC.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WSManHTTPConfig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wsmprovhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LogonUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mpnotify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wlrmdr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\diskpart.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\diskraid.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\vds.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\vdsldr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fixmapi.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Netplwiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PasswordOnWakeSettingFlyout.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UserAccountBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LaunchWinApp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\verifiergui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tzsync.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wksprt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\InputSwitchToastHandler.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UIMgrBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ctfmon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\taskhostw.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\at.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\schtasks.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\alg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PackagedCWALauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mmgaserver.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AuthHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\backgroundTaskHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\VaultCmd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\licensingdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CertEnrollCtrl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RuntimeBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BackgroundTransferHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ByteCodeGenerator.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WWAHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WaaSMedicAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\upfc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wuapihost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ttdinject.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tttracer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sihost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pospaymentsworker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RemotePosWorker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LicenseManagerShellext.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ISM.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SearchFilterHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SearchIndexer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SearchProtocolHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\directxdatabaseupdater.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dispdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Windows.WARP.JITService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dxgiadaptercache.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MicrosoftEdgeSH.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TokenBrokerCookies.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AppHostRegistrationVerifier.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dstokenclean.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WinRTNetMUAHostServer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PickerHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemUWPLauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DataStoreCacheDumpTool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CredentialEnrollmentManager.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wlanext.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LockScreenContentServer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SlideToShutDown.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\systray.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RunLegacyCPLElevated.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\control.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fontview.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wifitask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tzutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\w32tm.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dmclient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dsregcmd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UtcDecoderHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TpmTool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\HealthAttestationClientAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TpmInit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CloudNotifications.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemSettingsBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\mofcomp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\unsecapp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WMIADAP.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WmiApSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate_isv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate_ssp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate_ssp_isv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\printfilterpipelinesvc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\provtool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PrintIsolationHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\spoolsv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PinEnrollmentBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WpcTok.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WpcMon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApproveChildRequest.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ofdeploy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DmNotificationBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MDMAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MicrosoftEdgeBCHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Eap3Host.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bcdboot.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bcdedit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bootsect.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\audiodg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SpatialAudioLicenseSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CompPkgSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\agentactivationruntimestarter.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\IcsEntitlementHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\XblGameSaveTask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\notepad.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TsWpfWrp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\explorer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Gaming" /v "GPUOptimized" REG_DWORD "1" /f
cls
goto TweaksPG2English

:AMDEnglish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\NVIDIA GPU Tweaks.reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/AMD GPU Tweaks.reg"
cd %SYSTEMDRIVE%\Gaming\Resources\
Reg Import NVIDIA GPU Tweaks.reg
Reg add "HKCU\Software\Gaming" /v "GPUOptimized" REG_DWORD "1" /f
goto TweaksPG2English

:DisablePreemptionEnglish
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "PreemptionDisabled" REG_DWORD "1" /f
goto TweaksPG1English

:TcpIpEnglish
ipconfig /flushdns
ipconfig /release
ipconfig /renew
ipconfig /renew6
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNsclient" /v "EnableMulticast" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNsclient" /v "DisableSmartNameResolution" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "EnableIdnMapping" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "RegistrationEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "PreferLocalOverLowerBindingDNS" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "DisableSmartProtocolReordering" /t REG_DWORD /d "1" /f
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
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheEntryTtlLimit" /t REG_DWORD /d "fa00" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxNegativeCacheTtl" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableBucketSize" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableSize" /t REG_DWORD /d "180" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxSOACacheEntryTtlLimit" /t REG_DWORD /d "12d" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheTtl" /t REG_DWORD /d "3840" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrDisableNagleentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxActiveTransmitFileCount" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastCopyTransmit" /t REG_DWORD /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastTransmit" /t REG_DWORD /d "8000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNICBuffers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "TransmitWorker" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "8192" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "8192" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableAddressSharing" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "LargeBufferSize" /t REG_DWORD /d "10000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IRPStackSize" /t REG_DWORD /d "14" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableDirectAcceptEx" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableChainedReceive" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "EnableDynamicBacklog" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MinimumDynamicBacklog" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaximumDynamicBacklog" /t REG_DWORD /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicBacklogGrowthDelta" /t REG_DWORD /d "10" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "BufferMultiplier" /t REG_DWORD /d "400" /f
Reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpInitialRTT" /d "300" /t REG_DWORD /f
Reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "Experimental" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Application DSCP Marking Request" /t REG_SZ /d "Allowed" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "TcpAutotuningLevel" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "TcpHybridAck" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "TcpIpOptimized" REG_DWORD "1" /f
goto TweaksPG2English

:NetshOptionsEnglish
netsh int ip reset
netsh int tcp reset
netsh winsock reset
netsh winsock reset proxy
netsh winsock reset catalog
netsh advfirewall reset
netsh advfirewall set allprofiles state off
netsh advfirewall firewall delete rule all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
netsh advfirewall set allprofiles state on
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
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "NetshOptimized" /t REG_DWORD "1" /f
goto TweaksPG2English

:NicEnglish
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
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "00003322" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PowermizerLevel" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PowermizerLevelAC" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BITS" /v "EnablePeercaching" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BITS" /v "DisablePeerCachingClient" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BITS" /v "DisablePeerCachingServer" /t REG_DWORD /d "1" /f
set INTERFACE=Ethernet
set DNS1=8.8.8.8
set DNS2=8.8.4.4
set INTERFACE=Wi-Fi
set DNS1=8.8.8.8
set DNS2=8.8.4.4
Reg add "HKCU\Software\Gaming" /v "NicOptimized" /t REG_DWORD "1" /f
cls
goto TweaksPG2English

:MouseOptimizeEnglish
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
:ChooseScaleEnglish
echo What is your current display scaling percentage? 100, 125, 150, 175, 200, 225, 250, 300, 350 (Don't put a %% symbol)
set /p choice=" scale > "
if /i "%choice%"=="100" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="125" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000000000100000000000000020000000000000003000000000000000400000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="150" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000303313000000000060662600000000009099390000000000C0CC4C0000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="175" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000006066160000000000C0CC2C000000000020334300000000008099590000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="200" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "000000000000000090991900000000002033330000000000B0CC4C00000000004066660000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="225" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC1C0000000000809939000000000040665600000000000033730000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="250" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000000000200000000000000040000000000000006000000000000000800000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="300" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000006066260000000000C0CC4C000000000020337300000000008099990000000000" /f >nul 2>&1 & goto ContinueEnglish
if /i "%choice%"=="350" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC2C0000000000809959000000000040668600000000000033B30000000000" /f >nul 2>&1 & goto ContinueEnglish
goto ChooseScaleEnglish

:ContinueEnglish
Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t Reg_BINARY /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d "4" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t REG_DWORD /d "3" /f
Reg add "HKCU\Software\Gaming" /v "MouseOptimized" REG_DWORD "1" /f
goto TweaksPG1English

:SystemAuto-LoggersEnglish
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
Reg add "HKCU\Software\Gaming" /v "SystemAuto-LoggersOptimized" REG_DWORD "1" /f
cls
goto TweaksPG1English

:PowerSavingEnglish
Echo Disabling System energy-saving techniques.
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "USBPowerSavingDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG2English

:USBPowerSavingEnglish
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

Reg add "HKCU\Software\Gaming" /v "USBPowerSavingDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG2English

:PowerThrottlingEnglish
Echo Disabling PowerThrottling 
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "PowerThrottlingDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG2English

:ServicesEnglish
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
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\pla" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /f
Reg delete "HKLM\SOFTWARE\AMDLOG" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\luafv" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PktMon" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\diagnostics" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\wercplsupport" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\GraphicsPerfSvcGroup" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SystemUsageReportSvc_QUEENCREEK" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\gencounter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\FileInfo" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Filetrace" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\diagsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\TroubleshootingSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\NDKPerf" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\NDKPing" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\storqosflt" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\NdisCap" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\wercplsupport" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\InventorySvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ss_conn_service" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ss_conn_service2" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MozillaMaintenance" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\COMSysApp" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SENS" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EventSystem" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "rdxgroup" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "GraphicsPerfSvcGroup" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "autoTimeSvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "NetworkServiceAndNoImpersonation" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSSystemAnalysis" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSSystemDiagnosis" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSLinkNear" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSLinkRemote" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSwitch" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AsusAppService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSoftwareManager" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSwitch" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PNRPAutoReg" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\p2psvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\p2pimsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PNRPsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PNRPAutoReg" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PeerDistSvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "LocalServicePeerNet" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "P9RdrService" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "PeerDist" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "WerSvcGroup" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WpcMonSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Services\GoogleChromeBetaElevationService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Services\GoogleChromeElevationService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DusmSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\TermService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\RpcLocator" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WinRM" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\KtmRm" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\smphost" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\BDESVC" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AxInstSV" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AJRouter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Beep" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\CldFlt" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\dam" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\hvcrash" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\RetailDemo" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\CaptureService" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\BcastDVRUserService" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\InvSvcGroup" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\defragsvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "defragsvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "InvSvcGroup" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "BcastDVRUserService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ALG" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SmsRouter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\QWAVE" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\svsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MSiSCSI" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\QWAVEdrv" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WwanSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\LMS" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bttflt" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MsKeyboardFilter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\wcncsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\fhsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WPDBusEnum" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SEMgrSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PhoneSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SessionEnv" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLWriter" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLTELEMETRY$SQLEXPRESS" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLTELEMETRY" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLBrowser" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLAgent$SQLEXPRESS" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLSERVERAGENT" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\MSSQL$SQLEXPRESS" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\MySQL80" /v "Start" /t REG_DWORD /d "3" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v4.0.30319_64" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v4.0.30319_32" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_64" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_32" /f
Reg add "HKCU\Software\Gaming" /v "ServicesOptimized" /t REG_DWORD /d "1" /f
cls
goto TweaksPG2English

:AudioOptionsEnglish
cd "%SYSTEMDRIVE%\Gaming\Resources\"
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\nssm.exe" ( goto RealEnglish ) else ( goto DownloadnssmEnglish )
:DownloadnssmEnglish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\nssm.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/nssm.exe"
goto RealEnglish
:RealEnglish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\REAL.exe" ( goto ContinueAudioOptionsEnglish ) else ( goto DownloadREALEnglish )
:DownloadREALEnglish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/REAL.exe"
goto ContinueAudioOptions
:ContinueAudioOptionsEnglish
nssm install GamingAudio "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe"
nssm set GamingAudio DisplayName Gaming Audio Latency Reducer Service
nssm set GamingAudio Description Reduces Audio Latency
nssm set GamingAudio Start SERVICE_AUTO_START
nssm set GamingAudio AppAffinity 1
nssm set GamingAudio start SERVICE_AUTO_START
nssm start GamingAudio
Reg add "HKCU\Software\Gaming" /v "AudioOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG2English

:TelemetryEnglish
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
Reg add "HKCU\Software\Gaming" /v "TelemetryOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:PowerCfgEnglish
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
Reg add "HKCU\Software\Gaming" /v "PowerCfgOptimized" /t REG_DWORD /d "1" /f
cls
goto TweaksPG1English

:ScEnglish
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
Reg add "HKCU\Software\Gaming" /v "ScOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:FSEEnglish
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
Reg add "HKCU\Software\Gaming" /v "FSEEnabled" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:DisableDiagnosticsEnglish
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_dWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "DiagnosticErrorText" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticErrorText" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticLinkText" /t REG_SZ /d "" /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsconsumerFeatures" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "DiagnosticsDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:SMB1English
Powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol' -NoRestart"
Powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SmbDirect' -NoRestart"
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mrxsmb10" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "SMB1ProtocolDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:GetInputEnglish
cls
Set "HardwareDataQueueSize="
Rem Request input from the user. 
Set /P "HardwareDataQueueSize=Please enter the size that you want of your HardwareDataQueueSize: "
cls
Rem If input is not a Number ask again
Rem Valid number detected so continuing
Echo Your size of HardwareDataQueueSize is %HardwareDataQueueSize%
Pause
Rem Make the HardwareDataQueueSize the current choosed number
goto PromptForHardWareEnglish

:PromptForHardWareEnglish
cls
SET /P AREYOUSURE=Size of a HardwareDataQueueSize You Choosed Is %HardwareDataQueueSize% Continue?, Or Change Number\Rozmiar Wybranej Kolejki Sprzetu Komputerowego to %HardwareDataQueueSize % Kontynuuj? Czy Zmien Numer(Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" goto GetInputEnglish
IF /I "%AREYOUSURE%" NEQ "N" goto HardwareDataQueueSizeEnglish

:HardwareDataQueueSizeEnglish
Echo Setting HardwareDataQueueSize\Ustawianie Rozmiaru Sprzetowej Kolejki Komputerowej
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "%HardwareDataQueueSize%" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "%HardwareDataQueueSize%" /f
Reg add "HKCU\Software\Gaming" /v "HardWareQueueSizeOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:Win32PriorityEnglish
Echo Applying Optimal Win32Priority For Balanced FPS And Latency\Zastosowywanie Optymalnych Ustawien Dla Win32Priority Dla Zbalansowanych Fps i Mniejszego Opoznienia Systemu
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ13Priority" /t REG_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ0Priority" /t REG_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967286Priority" /t REG_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967287Priority" /t REG_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "ConvertibleSlateMode" /t REG_DWORD /d "00000000" /f
Reg add "HKCU\Software\Gaming" /v "Win32Optimized" /t REG_DWORD /d "1" /f
goto TweaksPG1English

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

:DebloatEnglish
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
Reg add "HKCU\Software\Gaming" /v "Debloated" /t REG_DWORD /d "1" /f
goto TweaksPG2English

:SvcHostEnglish
Echo.
Echo adding more ram for applications in system memory caching to improve microstuttering\Dodanie wiekszej ilosci pamieci RAM dla aplikacji w buforowaniu pamieci systemowej w celu poprawy mikrozacinania
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

Echo Paging Executive Is Used To Load System Files Such As Kernel And Hardware Drivers To The Page File When Needed. Disable Will Force Run Into Not Virtual Memory\Paging Executive Sluzy Do ladowania Plikow Systemowych, Takich Jak Sterowniki Kernel I Sprzetu, Do Pliku Stronicowania W Razie Potrzeby. Wylaczenie Spowoduje Wymuszenie Uruchomienia Pamieci Nie Wirtualnej
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f

Echo Disabling Windows Attempt To Save As Much RAM As Possible, Such As Sharing Pages For Images, Copy-On-Write For Data Pages, And Compression\Wylaczanie Systemu Windows Proba Zaoszczedza Jak Najwiekszej Ilosci Pamieci RAM, Na Przyklad Udostepnianie Stron Obrazow, Kopiowanie Przy Zapisie Stron Danych I Kompresji
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f

Reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f
Reg add "HKCU\Software\Gaming" /v "RamOptimized" /t REG_DWORD /d "1" /f
cls
:N
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
goto SvcHostEnglish

:PromptRam
cls
SET /P RAM=Size Of Ram Which Was Chosen Is %Choice% Continue?, Or Change?\Wielkosc Ramu, Ktora Zostala Wybrana To %Choice% Kontynuuj, Lub Zmienic?(Y/N)
IF /I "%RAM%" NEQ "Y" goto N
IF /I "%RAM%" NEQ "N" goto Y

:4GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "68764420" /f
bcdedit /set increaseuserva 2000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1English
:6GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "103355478" /f
bcdedit /set increaseuserva 3000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1English
:8GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "137922056" /f
bcdedit /set increaseuserva 4000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1English
:16GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "376926742" /f
bcdedit /set increaseuserva 8000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1English
:32GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "861226034" /f
bcdedit /set increaseuserva 16000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1English
:64GB
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "1729136740" /f
bcdedit /set increaseuserva 32000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1English

:AddTakeOwnerShipEnglish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" ( goto RegImportContextEnglish ) else ( goto DownloadShow-Take-Ownership-Context-Menu.RegEnglish )
:DownloadShow-Take-Ownership-Context-Menu.RegEnglish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/Show-Take-Ownership-Context-Menu.Reg"
goto RegImportContextEnglish

:MsiModeEnglish
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0x00000001" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "MsiModeEnabled" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:AffinityEnglish
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
goto TweaksPG1English

:DisableWriteCombiningEnglish
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "WriteCombiningOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:DisableHDCPEnglish
Reg add "HKCU\Software\Gaming" /v "HDCPOptimized" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:RegImportContextEnglish
cd %SYSTEMDRIVE%\Gaming_Pack\Resources\
Reg import Show-Take-Ownership-Context-Menu.Reg
Reg add "HKCU\Software\Gaming" /v "TakeOwnerShipAdded" /t REG_DWORD /d "1" /f
cls
goto TweaksPG2English

:OptionalTweaksEnglish
cls
@REM Disabling Wifi Sense hotspot sharing
Reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f
@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
Reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f
@REM Optional Tweaks"
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d "0" /f
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
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "64" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "64" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "64" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "64" /f
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
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "DistributeTimers" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /f
Reg add "HKCU\Software\Gaming" /v "DistributedTimers" /t REG_DWORD "1" /f
Fsutil behavior set memoryusage 2
Fsutil behavior set mftzone 2
Fsutil behavior set disablelastaccess 1
Fsutil behavior set encryptpagingfile 0
Fsutil behavior set disablecompression 1
Fsutil behavior set disabledeletenotify 0
Fsutil 8dot3name set 1
Fsutil resource setavailable C:\
Fsutil resource setlog shrink 10 C:\
Fsutil behavior set disable8dot3 1
Reg add "HKCU\Software\Gaming" /v "FsutilOptimized" /t REG_DWORD "1" /f
schtasks /Change /TN "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender scheduled scan" /RL LIMITED
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
Reg add "HKCU\Software\Gaming" /v "NvTmRepDisabled" /t REG_DWORD "1" /f
SET DEVMGR_SHOW_NONPRESENT_DEVICES=1
Powershell -NoProfile -Command "Disable-MMAgent -PagingCombining -mc"
Defrag.exe
cls
goto TweaksPG2English

:GPeditEnablerInHomeEnglish 
pushd "%~dp0" 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del /s /q List.txt
Reg add "HKCU\Software\Gaming" /v "GPeditEnabled" /t REG_DWORD "1" /f
cls
goto PromptforIEUnintaller

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
goto 

:SystemToolsEnablerEnglish
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
goto TweaksPG2English

:SoftRestartEnglish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\NSudo.exe" ( goto NSudoEnglish ) else ( goto DownloadNSudoEnglish )
:DownloadNSudoEnglish
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\NSudo.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/NSudo.exe"
cd "%SYSTEMDRIVE%\Gaming_Pack\Resources\"
:NsudoEnglish
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "Reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f" >nul 2>&1
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "sc start "TrustedInstaller"" >nul 2>&1
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\Restart" ( goto EmptyStandbyListEnglish ) else ( goto DownloadRestart64English )
:DownloadRestart64English
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\Restart64.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/restart64.exe"
goto EmptyStandbyList
:EmptyStandbyListEnglish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\EmptyStandbyList.exe" ( goto ContinueSoftRestartEnglish ) else ( goto DownloadEmptyStandbyListEnglish )
:DownloadEmptyStandbyListEnglish
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\EmptyStandbyList.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/EmptyStandbyList.exe"
goto ContinueSoftRestart
:ContinueSoftRestartEnglish
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
goto TweaksPG2English

:TweaksPG1Polish
cls
echo.
echo                                                                                                   %COL%[36mStrona 1/2
echo                                                               %COL%[1;4;34mTweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Power Plan                  %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m Optymalizuj Pamiec          %COL%[33m[%COL%[37m 3 %COL%[33m]%COL%[37m Tryb MSI
echo              %COL%[90mPlan Zasilania,Dobry              %COL%[90mOptymalizuje Ram,SvcHost, I Wie   %COL%[90mWlacza Tryb Msi Dla Karty
echo              %COL%[90mDo Uzycia Z Bateria.              %COL%[90mcej Service Host To Your RAM      %COL%[90mGraficznej I Kart Sieciowych
echo.
echo              %COL%[33m[%COL%[37m 4 %COL%[33m]%COL%[37m Affinity                    %COL%[33m[%COL%[37m 5 %COL%[33m]%COL%[37m W32 Priority Separation     %COL%[33m[%COL%[37m 6 %COL%[33m]%COL%[37m Mouse Fix
echo              %COL%[90mThis Tweak Will Spread Devices    %COL%[90mOptymalizuje Priorytet Uzy        %COL%[90mOptymalizuje Ustawienia
echo              %COL%[90mOn Multiple Cpu Cores             %COL%[90mcia Uruchomionych Usług          %COL%[90mTwojej Myszki
echo.
echo              %COL%[33m[%COL%[37m 7 %COL%[33m]%COL%[37m Telemetria                  %COL%[33m[%COL%[37m 8 %COL%[33m]%COL%[37m Sc                          %COL%[33m[%COL%[37m 9 %COL%[33m]%COL%[37m Fse
echo              %COL%[90mWylacz\Usun Servisy               %COL%[90mKonfiguruje Ustawienia            %COL%[90mWlacz Optymalizacje
echo              %COL%[90mTelemtrii                         %COL%[90mKomendy Sc                        %COL%[90mPelnoekranowe
echo.             
echo              %COL%[33m[%COL%[37m 10 %COL%[33m]%COL%[37m Diagnostyka                %COL%[33m[%COL%[37m 11 %COL%[33m]%COL%[37m Protokol SMB1              %COL%[33m[%COL%[37m 12 %COL%[33m]%COL%[37m HardWareDataQueueSize
echo              %COL%[90mWylacz Uslugi Diagnostyczne       %COL%[90mWylacz I Usun                     %COL%[90mTo Zwiekszy\Zmniejszy
echo              %COL%[90mDla Lepszej Wydajnosci            %COL%[90mStary Protokol SMB1               %COL%[90Wielkosc HardWareDataQueueSize
echo.
echo                                                            %COL%[1;4;34mNvidia Tweaks%COL%[0m"
echo.
echo              %COL%[33m[%COL%[37m 13 %COL%[33m]%COL%[37m Wylacz HDCP                %COL%[33m[%COL%[37m 14 %COL%[33m]%COL%[37m Wylacz Preemption          %COL%[33m[%COL%[37m 15 %COL%[33m]%COL%[37m ProfileInspector
echo              %COL%[90mWylacz Kopiowanie Technologii     %COL%[90mWylacz Preemption Requests        %COL%[90mEdytuj Ustawienia Panelu Nvidia
echo              %COL%[90mOchrony Nielegalnych Tresci       %COL%[90mZ Harmonogramu GPU                %COL%[90mI Dodaj Rozne Dodatki
echo.
echo              %COL%[33m[%COL%[37m 16 %COL%[33m]%COL%[37m Wylacz Laczenie Zapisu     %COL%[33m[%COL%[37m 17 %COL%[33m]%COL%[37m System Auto-Loggers
echo              %COL%[90mZatrzymuje Laczenie Danych        %COL%[90mWylacz Automatyczne
echo              %COL%[90mI Tymczasowo Przechowywane        %COL%[90mRejestratory Systemowe
echo.
echo.
echo.
echo                                     %COL%[90m[ B Do Tylu ]         %COL%[31m[ X Zeby Zamknac ]         %COL%[36m[ N Strona Numer Dwa ]
echo.
set /p choice="%DEL%                                        %COL%[37mWybierz Odpowiednia Liczbe Lub Litere Do Powyzszych Opcji > "
if /i "%choice%"=="1" goto:PowerCfgPolish
if /i "%choice%"=="2" goto:SvcHostPolish
if /i "%choice%"=="3" goto:MsiModePolish
if /i "%choice%"=="4" goto:AffinityPolish
if /i "%choice%"=="5" goto:Win32PriorityPolish
if /i "%choice%"=="6" goto:MouseOptimizePolish
if /i "%choice%"=="7" goto:TelemetryPolish
if /i "%choice%"=="8" goto:ScPolish
if /i "%choice%"=="9" goto:FsePolish
if /i "%choice%"=="10" goto:DisableDiagnosticsPolish
if /i "%choice%"=="11" goto:SMB1Polish
if /i "%choice%"=="12" goto:GetInputPolish
if /i "%choice%"=="13" goto:DisableHDCPPolish
if /i "%choice%"=="14" goto:DisablePreemptionPolish
if /i "%choice%"=="15" goto:NvidiaPolish
if /i "%choice%"=="16" goto:DisableWriteCombiningPolish
if /i "%choice%"=="17" goto:SystemAuto-LoggersPolish
if /i "%choice%"=="X" exit /b
if /i "%choice%"=="B" goto TitlePolish
if /i "%choice%"=="N" (set "PG=TweaksPG2Polish") & goto TweaksPG2Polish

:TweaksPG2Polish
cls
echo.
echo                                                                                                            %COL%[36mStrona 2/2
echo                                                           %COL%[1;4;34mNetwork Tweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 1 %COL%[33m]%COL%[37m Optymalizuj TCP/IP          %COL%[33m[%COL%[37m 2 %COL%[33m]%COL%[37m Optymalizuj NIC            %COL%[33m[%COL%[37m 3 %COL%[33m]%COL%[37m Optymalizuj Netsh
echo              %COL%[90mZmienia Protokol Internetowy      %COL%[90mZoptymalizuj Karte Sieciowa      %COL%[90mTen Tweak Zoptymalizuje
echo              %COL%[91mNie Uzywaj Jesli Uzywasz Wifi     %COL%[91mNie Uzywaj Jesli Uzywasz Wifi    %COL%[90mKonfiguracje Sieci Komputerowej
echo.
echo                                                             %COL%[1;4;34mGPU ^& CPU%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 4 %COL%[33m]%COL%[37m All GPU Tweaks              %COL%[33m[%COL%[37m 5 %COL%[33m]%COL%[37m Optimize Intel iGPU        %COL%[33m[%COL%[37m 6 %COL%[33m]%COL%[37m AMD GPU Tweaks
echo              %COL%[90mRozne Niezbedne Poprawki Dla      %COL%[90mZwieksz Dedykowana Ilosc         %COL%[90mSkonfiguruj Ustawienia Karty
echo              %COL%[90mRoznych Mark I Producentow GPU    %COL%[90mPamieci Vram Dla Intel GPU       %COL%[90mGraficznej Do Zoptymalizowanych
echo.
echo                                                        %COL%[1;4;34mMiscellaneous Tweaks%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 7 %COL%[33m]%COL%[37m Reduce Audio Latency        %COL%[33m[%COL%[37m 8 %COL%[33m]%COL%[37m Debloat                    %COL%[33m[%COL%[37m 9 %COL%[33m]%COL%[37m Bluetooth Fix
echo              %COL%[90mZmniejsz Opoznienie Dzwieku Nie   %COL%[90mUsun Preinstalowane	        %COL%[90mNaprawia Bluetooth Jesli Nie Chce
echo              %COL%[91mUzywaj Na Wolnych Lub Starych CPU %COL%[90mProgramy                         %COL%[90mPolaczyc Sie Z Urzadzeniem
echo.
echo              %COL%[33m[%COL%[37m 10 %COL%[33m]%COL%[37m BCD Tweaks                 %COL%[33m[%COL%[37m 11 %COL%[33m]%COL%[37m Wlacznik System Tools     %COL%[33m[%COL%[37m 12 %COL%[33m]%COL%[37m Dodaj TakeOwnerShip
echo              %COL%[90mZastosuj Tweaki BCD Dla           %COL%[90mDodaj Narzedzia Systemowe        %COL%[90mDodaj TakeOwnerShip Do MenuKontekstowego
echo              %COL%[90mKrotszego Czasu Uruchamiania      %COL%[90mDo Prawego Klikniecia Menu       %COL%[90mPo Kliknieciu Prawego Przycisku Myszy
echo.
echo              %COL%[33m[%COL%[37m 13 %COL%[33m]%COL%[37m GPEditEnabler              %COL%[33m[%COL%[37m 14 %COL%[33m]%COL%[37m Lagodny Restart           %COL%[33m[%COL%[37m 15 %COL%[33m]%COL%[37m Tweaki Opcjonalne
echo              %COL%[90mWlacz GPedit Dla                  %COL%[90mJesli Twoj PC Byl Wlaczony Przez %COL%[90mZastosuj Opcjonalne Tweaki
echo              %COL%[90mWersji Home Windowsa              %COL%[90mChwile Uzyj Tego Po Szybki Boost %COL%[90mOgromna Ilosc Tweakow
echo.
echo                                                        %COL%[1;4;34mPower Saving And Services%COL%[0m
echo.
echo              %COL%[33m[%COL%[37m 16 %COL%[33m]%COL%[37m Oszczedzanie Energi        %COL%[33m[%COL%[37m 17 %COL%[33m]%COL%[37m Power Throttling          %COL%[33m[%COL%[37m 18 %COL%[33m]%COL%[37m Serwisy  
echo              %COL%[90mWylacz Oszczedzanie Energi        %COL%[90mWylacz Ograniczenie Zasilania    %COL%[90mWylacz:Niepotrzebne Serwisy Windows
echo              %COL%[90mWszystkiego                       %COL%[90mDla Wszystkich Applikacji        %COL%[90mI Inne
echo.
echo.
echo.
echo                                     %COL%[90m[ B for back ]         %COL%[31m[ X to close ]         %COL%[36m[ N page one ]
echo.
set /p choice="%DEL%                                        %COL%[37mSelect a corresponding number to the options above > "
if /i "%choice%"=="1" goto:TcpIpPolish
if /i "%choice%"=="2" goto:NICPolish
if /i "%choice%"=="3" goto:NetshOptionsPolish
if /i "%choice%"=="4" goto:AllGPUPolish
if /i "%choice%"=="5" goto:IntelPolish
if /i "%choice%"=="6" goto:AMDPolish
if /i "%choice%"=="7" goto:AudioOptionsPolish
if /i "%choice%"=="8" goto:DebloatPolish
if /i "%choice%"=="9" goto:BluetoothFixPolish
if /i "%choice%"=="10" goto:BCDTweaksPolish
if /i "%choice%"=="11" goto:SystemToolsEnablerPolish
if /i "%choice%"=="12" goto:AddTakeOwnerShipPolish
if /i "%choice%"=="13" goto:GPeditEnablerInHomePolish
if /i "%choice%"=="14" call:SoftRestartPolish
if /i "%choice%"=="15" goto:OptionalTweaksPolish
if /i "%choice%"=="16" goto:USBPowerSavingPolish
if /i "%choice%"=="17" goto:PowerThrottlingPolish
if /i "%choice%"=="18" goto:ServicesPolish
if /i "%choice%"=="X" exit /b
if /i "%choice%"=="B" goto TitlePolish
if /i "%choice%"=="N" (set "PG=TweaksPG1Polish") & goto TweaksPG1Polish

:BCDTweaksPolish
echo Applying BCD Tweaks For Lower Input Delay
echo.
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
bcdedit /set tscsyncpolicy enhanced
echo.
Reg add "HKCU\Software\Gaming" /v "BCDEditOptimized" REG_DWORD "1" /f
cls
goto TweaksPG2Polish
  
:BluetoothFixPolish 
echo Fix Bluetooth By scar#1000
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d "3" /f
Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d "3" /f
Reg add "HKCU\Software\Gaming" /v "BluetoothFixes" REG_DWORD "1" /f
goto TweaksPG2Polish

:NvidiaPolish
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
Reg add "HKCU\Software\Gaming" /v "NvidiaGPUOptimized" REG_DWORD "1" /f
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\NVIDIA GPU Tweaks.reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/NVIDIA GPU Tweaks.reg"
cls
goto NVEnglish

:NVEnglish
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
if errorlevel  3 goto NV3English
if errorlevel  2 goto NV2English
if errorlevel  1 goto NV1English

:NV1English
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757435759276125/UltraQuality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\UltraQuality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\UltraQuality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPUPolish

:NV2English
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138757456349122600/Quality_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Quality_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%/Gaming_Pack/Resources/NvidiaProfileInspector.exe" "%SYSTEMDRIVE%/Gaming_Pack/Resources/Quality_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPUPolish

:NV3English
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1137695847094698054/NvidiaProfileInspector.exe' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe
powershell -c Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/1137464343257153627/1138759533838225498/Latency_And_MaxPerformance_By_Hajkusi.nip' -OutFile %SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_And_MaxPerformance_By_Hajkusi.nip
start "" /wait "%SYSTEMDRIVE%\Gaming_Pack\Resources\NvidiaProfileInspector.exe" "%SYSTEMDRIVE%\Gaming_Pack\Resources\Latency_and_MaxPerformance_By_Hajkusi.nip\"
timeout 2 >nul
goto :AllGPUPolish

:AllGPUPolish
Echo Applying SystemProfile (GPU and Network) Tweaks.\Stosowanie Profilu Systemu (Karty Graficznej I Internetu.)
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "ffffffff" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d "16" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d "16" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ParamReg" add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
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
Reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows Media Foundation" /f
Reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\GraphicsSettings" /v "SpecificGPUOptionApplicable" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Avalon.Graphics" /v "DisableHWAcceleration" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Avalon.Graphics" /v "MaxMultisampleSize" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Avalon.Graphics" /v "UseReferenceRasterizer" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Avalon.Graphics" /v "DisableHWAcceleration" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Avalon.Graphics" /v "MaxMultisampleSize" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Avalon.Graphics" /v "UseReferenceRasterizer" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Avalon.Graphics" /v "DisableHWAcceleration" /t REG_DWORD /d "0" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Avalon.Graphics" /v "MaxMultisampleSize" /t REG_DWORD /d "0" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Avalon.Graphics" /v "UseReferenceRasterizer" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\SubSystems" /v "Optional" /t REG_SZ /d "" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "UseGpuTimer" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PowerSavingTweaks" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableRuntimePowerManagement" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PrimaryPushBufferSize" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "FlTransitionLatency" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "D3PCLatency" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDeepLlEntryLatencyUsec" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "LOWLATENCY" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "PlatformSupportMiracast" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /t REG_SZ /d "AutoHDREnable=0;GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rundll32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bdeunlock.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bdechangepin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ClipDLS.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ScriptRunner.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApplySettingsTemplateCatalog.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Microsoft.Uev.CscUnpinTool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UevAppMonitor.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Microsoft.Uev.SyncController.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chgport.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chgusr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\query.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\logoff.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\qappsrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\qprocess.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\reset.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rwinsta.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tscon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tsdiscon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tskill.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\quser.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\qwinsta.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\baaupdate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\logagent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mfpmp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PackageInspector.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\manage-bde.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PresentationSettings.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AgentService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\repair-bde.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ClipRenew.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\gpscript.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CustomShellHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AssignedAccessGuard.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mavinject.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BitLockerDeviceEncryption.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpshell.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AppVClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BdeHdCfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CameraSettingsUIHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RemoteAppLifetimeManager.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpsign.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fveprompt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iotstartup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fvenotify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WPDShextAutoplay.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BdeUISrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbengine.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bootim.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WinBioDataModelOOBE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PresentationHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rstrui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\srdelayed.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SrTasks.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SpaceAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\provlaunch.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EduPrintProv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UNP\UNPUXHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UNP\UNPUXLauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UNP\UpdateNotificationMgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Spectrum.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SIHClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\xwizard.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\takeown.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\vssadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\where.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cacls.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\eventcreate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fsavailux.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ftp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\grpconv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\runas.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\systeminfo.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\taskkill.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tasklist.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\timeout.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\waitfor.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\whoami.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mstsc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TSTheme.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wkspbroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TSWbPrxy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RdpSa.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RdpSaProxy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RdpSaUacHelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sessionmsg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TieringEngineService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpclip.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdpinput.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TapiUnattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dialer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tcmsetup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MultiDigiMon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tabcal.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\FsIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dvdplay.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\calc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\charmap.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\credwiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\certreq.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\certutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\klist.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ksetup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\nltest.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\regini.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\regsvr32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setspn.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\regedt32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ResetEngine.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SysResetErr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\systemreset.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemResetPlatform\SystemResetPlatform.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\migwiz\mighost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pwlauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fodhelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Fondue.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\OptionalFeatures.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CheckNetIsolation.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msiexec.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mblctr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msconfig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mmc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsActionDialog.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cliconfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\odbcad32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\odbcconf.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iscsicpl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iscsicli.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\IESettingSync.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ie4uinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ie4ushowIE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\F12\IEChooser.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ieUnatt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\iexpress.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wextract.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mshta.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wiaacmgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wiawow64.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bridgeunattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\eventvwr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\gpresult.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\gpupdate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\esentutl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\eudcedit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wecutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\easinvoker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EhStorAuthn.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DpiScaling.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Dxpserver.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceProperties.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DisplaySwitch.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemSettingsRemoveDevice.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SyncHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DevicePairingWizard.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ComputerDefaults.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DataExchangeHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CompMgmtLauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\convert.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\find.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ktmutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\label.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\openfiles.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\replace.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Robocopy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\stordiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\choice.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\clip.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\doskey.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\forfiles.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\print.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\subst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cttune.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cttunesvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\help.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\msdtc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CastSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UserDataSource.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\curl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tar.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\spaceman.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\spaceutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EDPCleanup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MDMAppInstaller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ARP.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\finger.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\HOSTNAME.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MRINFO.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NETSTAT.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ROUTE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sort.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TCPSVCS.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\xcopy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\auditpol.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mountvol.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\net.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\net1.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netsh.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PATHPING.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PING.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Reg" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setx.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TRACERT.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\attrib.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ClipUp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\diskusage.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\findstr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\icacls.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ipconfig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CIDiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\comp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fsutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\recover.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sdclt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PerceptionSimulation\PerceptionSimulationService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tcblaunch.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\securekernel.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SgrmBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SgrmLpac.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\upnpcont.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BioIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NgcIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dusmtask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WinBioPlugIns\FaceFodUninstaller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\oobeldr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\windeploy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\audit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\AuditShD.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MBR2GPT.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\Setup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\poqexec.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PkgMgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Dism\DismHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmdkey.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dpapimig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LsaIso.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cscript.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RmClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SecEdit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wscript.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\icsunattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NetHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmmon32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmstp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmdl32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rasautou.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rasdial.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rasphone.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ntprint.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\printui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceEject.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\powercfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sigverif.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\drvinst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\hdwwiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pnputil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wowreg32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\InfDefault-" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ndadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\newdev.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\driverquery.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PnPUnattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\FirstLogonAnim.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\msoobe.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\oobe\UserOOBEBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netbtugc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netiougc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\nbtstat.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\NetCfgNotifyObjectHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\djoin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\getmac.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\shrpubw.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesAdvanced.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesComputerName.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesDataExecutionPrevention.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesHardware.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesPerformance.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesProtection.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemPropertiesRemote.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winver.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sxstrace.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Sysprep\sysprep.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WSCollect.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WSReset.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\changepk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LicensingUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\phoneactivate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UpgradeResultsUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\GenValObj.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\slui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SppExtComObj.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sppsvc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Speech\SpeechUX\SpeechUXWiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\snmptrap.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\immersivetpmvscmgrsvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rmttpmvscmgrsvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tpmvscmgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tpmvscmgrsvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\OpenWith.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ThumbnailExtractionHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\verclsid.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WallpaperHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\prevhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rundll32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mcbuilder.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MSchedExe.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WUDFCompanionHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WUDFHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AxInstUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\consent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LanguageComponentsInstallerComHandler.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LockAppHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\la57setup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lpk-" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lpksetup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lpremove.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DsmUserTask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\netcfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\runonce.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\secinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\colorcpl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dccw.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Dism.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\proquota.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UserAccountControlSettings.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\shutdown.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\efsui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cipher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\edpnotify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MicrosoftEdgeCP.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rekeywiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dnscacheugc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\nslookup.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lodctr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\unlodctr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ddodiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\omadmclient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\omadmprc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DmOmaCpMo.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\coredpussvr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceEnroller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dmcertinst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dmcfghost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CredentialUIBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SensorDataService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SecurityHealthHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\prproc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SecurityHealthService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Windows.Media.BackgroundPlayback.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sfc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wusa.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\wbemtest.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\scrcons.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApplyTrustOffline.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CustomInstallExec.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\deploymentcsphelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\expand.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ReAgentc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RelPost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MuiUnattend.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dxdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fontdrvhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winlogon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ucsvc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fltMC.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\lsass.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ntoskrnl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\services.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\smss.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\csrss.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Boot\winload.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AggregatorHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dtdump.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\runexehelper.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\rdrleakdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wpr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pacjsworker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\userinit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wininit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceCensus.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dllhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\conhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\extrac32.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\makecab.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\svchost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\compact.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dwm.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dcomcnfg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Locator.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Com\MigRegDB.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RpcPing.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mtstocom.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Com\comrepl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dllhst3g.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setupcl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\setupugc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wimserv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chkdsk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\chkntfs.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wsqmcons.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\autochk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\browser_broker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\browserexport.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Boot\winresume.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winresume.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winload.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bthudtask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fsquirt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bitsadmin.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\refsutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\appidcertstorecheck.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\appidpolicyconverter.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SndVol.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sdbinst.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pcalua.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LaunchTM.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pcaui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Taskmgr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Utilman.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EaseOfAccessDialog.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Narrator.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\osk.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sethc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AtBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Magnify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\EoAExperiences.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CloudExperienceHostBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApplicationFrameHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ShellAppRuntime.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\desktopimgdownldr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemSettingsAdminFlows.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\VSSVC.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\convertvhd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wuauclt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MusNotifyIcon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WindowsUpdateElevatedInstaller.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MusNotification.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MusNotificationUx.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MoNotificationUx.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UsoClient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Speech_OneCore\common\SpeechModelDownload.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Speech_OneCore\common\SpeechRuntime.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DeviceCredentialDeployment.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LegacyNetUXHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wevtutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dasHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DiskSnapshot.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\verifier.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Register-CimProvider.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WinMgmt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WmiPrvSE.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winrs.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\winrshost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WMIC.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WSManHTTPConfig.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wsmprovhost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LogonUI.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mpnotify.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wlrmdr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\diskpart.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\diskraid.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\vds.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\vdsldr.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fixmapi.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Netplwiz.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PasswordOnWakeSettingFlyout.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UserAccountBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LaunchWinApp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\verifiergui.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tzsync.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wksprt.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\InputSwitchToastHandler.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UIMgrBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ctfmon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\taskhostw.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\at.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\schtasks.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\alg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\cmd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PackagedCWALauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\mmgaserver.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AuthHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\backgroundTaskHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\VaultCmd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\licensingdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CertEnrollCtrl.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RuntimeBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\BackgroundTransferHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ByteCodeGenerator.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WWAHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WaaSMedicAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\upfc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wuapihost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ttdinject.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tttracer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\sihost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\pospaymentsworker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RemotePosWorker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LicenseManagerShellext.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ISM.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SearchFilterHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SearchIndexer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SearchProtocolHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\directxdatabaseupdater.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dispdiag.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Windows.WARP.JITService.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dxgiadaptercache.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MicrosoftEdgeSH.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TokenBrokerCookies.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\AppHostRegistrationVerifier.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dstokenclean.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WinRTNetMUAHostServer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PickerHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemUWPLauncher.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DataStoreCacheDumpTool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CredentialEnrollmentManager.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wlanext.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\LockScreenContentServer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SlideToShutDown.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\systray.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RunLegacyCPLElevated.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\control.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\fontview.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wifitask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\tzutil.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\w32tm.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dmclient.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\dsregcmd.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\UtcDecoderHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TpmTool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\HealthAttestationClientAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TpmInit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CloudNotifications.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SystemSettingsBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\mofcomp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\unsecapp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WMIADAP.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\wbem\WmiApSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate_isv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate_ssp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\RMActivate_ssp_isv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\printfilterpipelinesvc.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\provtool.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PrintIsolationHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\spoolsv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\PinEnrollmentBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WpcTok.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\WpcMon.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ApproveChildRequest.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\ofdeploy.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\DmNotificationBroker.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MDMAgent.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\MicrosoftEdgeBCHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\Eap3Host.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bcdboot.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bcdedit.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\bootsect.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\audiodg.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\SpatialAudioLicenseSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\CompPkgSrv.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\agentactivationruntimestarter.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\IcsEntitlementHost.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\XblGameSaveTask.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\notepad.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\System32\TsWpfWrp.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "C:\Windows\explorer.exe" /t REG_SZ /d "GpuPreference=1;" /f
Reg add "HKCU\Software\Gaming" /v "GPUOptimized" REG_DWORD "1" /f
cls
goto TweaksPG2Polish

:AMDPolish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\NVIDIA GPU Tweaks.reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/AMD GPU Tweaks.reg"
cd %SYSTEMDRIVE%\Gaming\Resources\
Reg Import NVIDIA GPU Tweaks.reg
Reg add "HKCU\Software\Gaming" /v "GPUOptimized" REG_DWORD "1" /f
goto TweaksPG2Polish

:DisablePreemptionPolish
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "PreemptionDisabled" REG_DWORD "1" /f
cls
goto TweaksPG1Polish

:TcpIpPolish
ipconfig /flushdns
ipconfig /release
ipconfig /renew
ipconfig /renew6
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNsclient" /v "EnableMulticast" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNsclient" /v "DisableSmartNameResolution" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "EnableIdnMapping" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "RegistrationEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "PreferLocalOverLowerBindingDNS" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "DisableSmartProtocolReordering" /t REG_DWORD /d "1" /f
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
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheEntryTtlLimit" /t REG_DWORD /d "fa00" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxNegativeCacheTtl" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableBucketSize" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "CacheHashTableSize" /t REG_DWORD /d "180" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxSOACacheEntryTtlLimit" /t REG_DWORD /d "12d" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxCacheTtl" /t REG_DWORD /d "3840" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrDisableNagleentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxActiveTransmitFileCount" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastCopyTransmit" /t REG_DWORD /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaxFastTransmit" /t REG_DWORD /d "8000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "PriorityBoost" /t REG_DWORD /d "4" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DoNotHoldNICBuffers" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "TransmitWorker" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "8192" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "8192" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableAddressSharing" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "LargeBufferSize" /t REG_DWORD /d "10000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IRPStackSize" /t REG_DWORD /d "14" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableDirectAcceptEx" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableChainedReceive" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "EnableDynamicBacklog" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MinimumDynamicBacklog" /t REG_DWORD /d "20" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "MaximumDynamicBacklog" /t REG_DWORD /d "1000" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicBacklogGrowthDelta" /t REG_DWORD /d "10" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "BufferMultiplier" /t REG_DWORD /d "400" /f
Reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpInitialRTT" /d "300" /t REG_DWORD /f
Reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "TcpAutotuning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "Experimental" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Application DSCP Marking Request" /t REG_SZ /d "Allowed" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "TcpAutotuningLevel" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters" /v "TcpHybridAck" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableConnectionRateLimiting" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "TcpIpOptimized" REG_DWORD "1" /f
goto TweaksPG2Polish

:NetshOptionsPolish
netsh int ip reset
netsh int tcp reset
netsh winsock reset
netsh winsock reset proxy
netsh winsock reset catalog
netsh advfirewall reset
netsh advfirewall set allprofiles state off >nul 2>&1
netsh advfirewall firewall delete rule all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound >nul 2>&1
netsh advfirewall reset >nul 2>&1
netsh advfirewall set allprofiles state on >nul 2>&1
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
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "NetshOptimized" /t REG_DWORD "1" /f
goto TweaksPG2Polish

:NicPolish
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
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "00003322" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PowermizerLevel" /t REG_DWORD /d "1" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Video\{DEB039CC-B704-4F53-B43E-9DD4432FA2E9}\0000" /v "PowermizerLevelAC" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BITS" /v "EnablePeercaching" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BITS" /v "DisablePeerCachingClient" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BITS" /v "DisablePeerCachingServer" /t REG_DWORD /d "1" /f
set INTERFACE=Ethernet
set DNS1=8.8.8.8
set DNS2=8.8.4.4
set INTERFACE=Wi-Fi
set DNS1=8.8.8.8
set DNS2=8.8.4.4
Reg add "HKCU\Software\Gaming" /v "NicOptimized" /t REG_DWORD "1" /f
cls
goto TweaksPG2Polish

:MouseOptimizePolish
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
:ChooseScalePolish
echo What is your current display scaling percentage? 100, 125, 150, 175, 200, 225, 250, 300, 350 (Don't put a %% symbol)
set /p choice=" scale > "
if /i "%choice%"=="100" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC0C0000000000809919000000000040662600000000000033330000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="125" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000000000100000000000000020000000000000003000000000000000400000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="150" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000303313000000000060662600000000009099390000000000C0CC4C0000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="175" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000006066160000000000C0CC2C000000000020334300000000008099590000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="200" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "000000000000000090991900000000002033330000000000B0CC4C00000000004066660000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="225" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC1C0000000000809939000000000040665600000000000033730000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="250" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000000000200000000000000040000000000000006000000000000000800000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="300" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "00000000000000006066260000000000C0CC4C000000000020337300000000008099990000000000" /f >nul 2>&1 & goto ContinuePolish
if /i "%choice%"=="350" Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t Reg_BINARY /d "0000000000000000C0CC2C0000000000809959000000000040668600000000000033B30000000000" /f >nul 2>&1 & goto ContinuePolish
goto ChooseScalePolish

:ContinuePolish
Reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t Reg_BINARY /d "0000000000000000fd11010000000000002404000000000000fc12000000000000c0bb0100000000" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d "4" /f
Reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t REG_DWORD /d "3" /f
Reg add "HKCU\Software\Gaming" /v "MouseOptimized" REG_DWORD "1" /f
goto TweaksPG1Polish

Echo Disabling System Auto-Loggers

:SystemAuto-LoggersPolish
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
Reg add "HKCU\Software\Gaming" /v "SystemAuto-LoggersOptimized" REG_DWORD "1" /f
cls
goto TweaksPG1Polish

:PowerSavingPolish
Echo Disabling System energy-saving techniques.
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
cls
goto TweaksPG2Polish

:USBPowerSavingPolish
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
goto TweaksPG2Polish

:PowerThrottlingPolish
Echo Disabling PowerThrottling 
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "PowerThrottlingDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG2Polish

:ServicesPolish
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
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\pla" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /f
Reg delete "HKLM\SOFTWARE\AMDLOG" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\luafv" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PktMon" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\diagnostics" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\wercplsupport" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\GraphicsPerfSvcGroup" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SystemUsageReportSvc_QUEENCREEK" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\gencounter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\FileInfo" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Filetrace" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\diagsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\TroubleshootingSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\NDKPerf" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\NDKPing" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\storqosflt" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\NdisCap" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\wercplsupport" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\InventorySvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ss_conn_service" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ss_conn_service2" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MozillaMaintenance" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\COMSysApp" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SENS" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EventSystem" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "rdxgroup" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "GraphicsPerfSvcGroup" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "autoTimeSvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "NetworkServiceAndNoImpersonation" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSSystemAnalysis" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSSystemDiagnosis" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSLinkNear" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\ASUSLinkRemote" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSwitch" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AsusAppService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSoftwareManager" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ASUSSwitch" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PNRPAutoReg" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\p2psvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\p2pimsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PNRPsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PNRPAutoReg" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PeerDistSvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "LocalServicePeerNet" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "P9RdrService" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "PeerDist" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "WerSvcGroup" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WpcMonSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Services\GoogleChromeBetaElevationService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Services\GoogleChromeElevationService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\DusmSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\TermService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\RpcLocator" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WinRM" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\KtmRm" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\smphost" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\BDESVC" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AxInstSV" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\AJRouter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bam" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Beep" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\CldFlt" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\dam" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\hvcrash" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\RetailDemo" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\CaptureService" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\BcastDVRUserService" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost\InvSvcGroup" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\defragsvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "defragsvc" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "InvSvcGroup" /f
Reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v "BcastDVRUserService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ALG" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SmsRouter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\QWAVE" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\svsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MSiSCSI" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\QWAVEdrv" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WwanSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\LMS" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\bttflt" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MsKeyboardFilter" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\wcncsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\fhsvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\WPDBusEnum" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SEMgrSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\PhoneSvc" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SessionEnv" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLWriter" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLTELEMETRY$SQLEXPRESS" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLTELEMETRY" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLBrowser" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLAgent$SQLEXPRESS" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SQLSERVERAGENT" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\MSSQL$SQLEXPRESS" /v "Start" /t REG_DWORD /d "3" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\MySQL80" /v "Start" /t REG_DWORD /d "3" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v4.0.30319_64" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v4.0.30319_32" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_64" /f
Reg delete "HKLM\SYSTEM\CurrentControlSet\Services\clr_optimization_v2.0.50727_32" /f
Reg add "HKCU\Software\Gaming" /v "ServicesOptimized" /t REG_DWORD /d "1" /f
cls
goto TweaksPG2Polish

:AudioOptionsPolish
cd "%SYSTEMDRIVE%\Gaming\Resources\"
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\nssm.exe" ( goto RealPolish ) else ( goto DownloadnssmPolish )
:DownloadnssmPolish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\nssm.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/nssm.exe"
goto RealPolish
:RealPolish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\REAL.exe" ( goto ContinueAudioOptionsPolish ) else ( goto DownloadREALPolish )
:DownloadREALPolish
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/REAL.exe"
goto ContinueAudioOptionsPolish
:ContinueAudioOptionsPolish
nssm install GamingAudio "%SYSTEMDRIVE%\Gaming\Resources\REAL.exe"
nssm set GamingAudio DisplayName Gaming Audio Latency Reducer Service
nssm set GamingAudio Description Reduces Audio Latency
nssm set GamingAudio Start SERVICE_AUTO_START
nssm set GamingAudio AppAffinity 1
nssm set GamingAudio start SERVICE_AUTO_START
nssm start GamingAudio
Reg add "HKCU\Software\Gaming" /v "AudioOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG2Polish

:TelemetryPolish
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
Reg add "HKCU\Software\Gaming" /v "TelemetryOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:PowerCfgPolish
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
Reg add "HKCU\Software\Gaming" /v "PowerCfgOptimized" /t REG_DWORD /d "1" /f
cls
goto TweaksPG1Polish

:ScPolish
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
Reg add "HKCU\Software\Gaming" /v "ScOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:FSEPolish
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
Reg add "HKCU\Software\Gaming" /v "FSEEnabled" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:DisableDiagnosticsPolish
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_dWORD /d "4" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "DiagnosticErrorText" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticErrorText" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /v "DiagnosticLinkText" /t REG_SZ /d "" /f
Reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d "1" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsconsumerFeatures" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "DiagnosticsDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:SMB1Polish
Powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol' -NoRestart"
Powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SmbDirect' -NoRestart"
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mrxsmb10" /v "Start" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Gaming" /v "SMB1ProtocolDisabled" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:GetInputPolish
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
goto PromptForHardWarePolish

:PromptForHardWarePolish
cls
SET /P AREYOUSURE=Size of a HardwareDataQueueSize You Choosed Is %HardwareDataQueueSize% Continue?, Or Change Number\Rozmiar Wybranej Kolejki Sprzetu Komputerowego to %HardwareDataQueueSize % Kontynuuj? Czy Zmien Numer(Y/N)
IF /I "%AREYOUSURE%" NEQ "Y" goto GetInputPolish
IF /I "%AREYOUSURE%" NEQ "N" goto HardwareDataQueueSizePolish

:HardwareDataQueueSizePolish
Echo Setting HardwareDataQueueSize\Ustawianie Rozmiaru Sprzetowej Kolejki Komputerowej
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "%HardwareDataQueueSize%" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "%HardwareDataQueueSize%" /f
Reg add "HKCU\Software\Gaming" /v "HardWareQueueSizeOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish 

:Win32PriorityPolish
Echo Applying Optimal Win32Priority For Balanced FPS And Latency\Zastosowywanie Optymalnych Ustawien Dla Win32Priority Dla Zbalansowanych Fps i Mniejszego Opoznienia Systemu
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ13Priority" /t REG_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ0Priority" /t REG_DWORD /d "26" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967286Priority" /t REG_DWORD /d "00000002" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ4294967287Priority" /t REG_DWORD /d "00000003" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "ConvertibleSlateMode" /t REG_DWORD /d "00000000" /f
Reg add "HKCU\Software\Gaming" /v "Win32Optimized" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

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

:DebloatPolish
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
Reg add "HKCU\Software\Gaming" /v "Debloated" /t REG_DWORD /d "1" /f
goto TweaksPG2Polish

:SvcHostPolish
Echo.
Echo adding more ram for applications in system memory caching to improve microstuttering\Dodanie wiekszej ilosci pamieci RAM dla aplikacji w buforowaniu pamieci systemowej w celu poprawy mikrozacinania
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

Echo Paging Executive Is Used To Load System Files Such As Kernel And Hardware Drivers To The Page File When Needed. Disable Will Force Run Into Not Virtual Memory\Paging Executive Sluzy Do ladowania Plikow Systemowych, Takich Jak Sterowniki Kernel I Sprzetu, Do Pliku Stronicowania W Razie Potrzeby. Wylaczenie Spowoduje Wymuszenie Uruchomienia Pamieci Nie Wirtualnej
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f

Echo Disabling Windows Attempt To Save As Much RAM As Possible, Such As Sharing Pages For Images, Copy-On-Write For Data Pages, And Compression\Wylaczanie Systemu Windows Proba Zaoszczedza Jak Najwiekszej Ilosci Pamieci RAM, Na Przyklad Udostepnianie Stron Obrazow, Kopiowanie Przy Zapisie Stron Danych I Kompresji
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f

Reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /t REG_DWORD /d "262144" /f
Reg add "HKCU\Software\Gaming" /v "RamOptimized" /t REG_DWORD /d "1" /f
cls
:N
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
goto SvcHostPolish

:PromptRam
cls
SET /P RAM=Size Of Ram Which Was Chosen Is %Choice% Continue?, Or Change?\Wielkosc Ramu, Ktora Zostala Wybrana To %Choice% Kontynuuj, Lub Zmienic?(Y/N)
IF /I "%RAM%" NEQ "Y" goto N
IF /I "%RAM%" NEQ "N" goto Y

:4GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "68764420" /f
bcdedit /set increaseuserva 2000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1Polish
:6GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "103355478" /f
bcdedit /set increaseuserva 3000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1Polish
:8GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "137922056" /f
bcdedit /set increaseuserva 4000
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
goto TweaksPG1Polish
:16GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "376926742" /f
bcdedit /set increaseuserva 8000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1Polish
:32GBRam
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "861226034" /f
bcdedit /set increaseuserva 16000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1Polish
:64GB
Reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "1729136740" /f
bcdedit /set increaseuserva 32000
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete
goto TweaksPG1Polish

:AddTakeOwnerShipPolish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" ( goto RegImportContext ) else ( goto DownloadShow-Take-Ownership-Context-Menu.Reg )
:DownloadShow-Take-Ownership-Context-Menu.Reg
curl -g -L -# -o "%SYSTEMDRIVE%\Gaming_Pack\Resources\Show-Take-Ownership-Context-Menu.Reg" "https://github.com/hajkusi/Gaming-Pack/raw/main/Files/Show-Take-Ownership-Context-Menu.Reg"
goto RegImportContextPolish

:MsiModePolish
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0x00000001" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "MsiModeEnabled" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:AffinityPolish
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
goto TweaksPG1Polish

:DisableWriteCombiningPolish
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /t Reg_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "WriteCombiningOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1English

:DisableHDCPPolish
Reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f
Reg add "HKCU\Software\Gaming" /v "HDCPOptimized" /t REG_DWORD /d "1" /f
goto TweaksPG1Polish

:RegImportContextPolish
cd %SYSTEMDRIVE%\Gaming_Pack\Resources\
Reg import Show-Take-Ownership-Context-Menu.Reg
Reg add "HKCU\Software\Gaming" /v "TakeOwnerShipAdded" /t REG_DWORD /d "1" /f
cls
goto TweaksPG2Polish

:OptionalTweaksPolish
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
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "64" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "64" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "64" /f
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "64" /f
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
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /v "DistributeTimers" /f
Reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\kernel" /f
Reg add "HKCU\Software\Gaming" /v "DistributedTimers" /t REG_DWORD "1" /f
Fsutil behavior set memoryusage 2
Fsutil behavior set mftzone 2
Fsutil behavior set disablelastaccess 1
Fsutil behavior set encryptpagingfile 0
Fsutil behavior set disablecompression 1
Fsutil behavior set disabledeletenotify 0
Fsutil 8dot3name set 1
Fsutil resource setavailable C:\
Fsutil resource setlog shrink 10 C:\
Fsutil behavior set disable8dot3 1
Reg add "HKCU\Software\Gaming" /v "FsutilOptimized" /t REG_DWORD "1" /f
schtasks /Change /TN "Microsoft\Windows\ExploitGuard\ExploitGuard MDM policy Refresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender scheduled scan" /RL LIMITED
schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}"
Reg add "HKCU\Software\Gaming" /v "NvTmRepDisabled" /t REG_DWORD "1" /f
SET DEVMGR_SHOW_NONPRESENT_DEVICES=1
Powershell -NoProfile -Command "Disable-MMAgent -PagingCombining -mc"
Defrag.exe
cls
goto TweaksPG2Polish

:GPeditEnablerInHomePolish
pushd "%~dp0" 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del /s /q List.txt
Reg add "HKCU\Software\Gaming" /v "GPeditEnabled" /t REG_DWORD "1" /f
cls
goto TweaksPG2Polish

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
goto 

:SystemToolsEnablerPolish
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
goto TweaksPG2Polish

:SoftRestartPolish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\NSudo.exe" ( goto NSudoPolish ) else ( goto DownloadNSudoPolish )
:DownloadNSudoPolish
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\NSudo.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/NSudo.exe"
cd "%SYSTEMDRIVE%\Gaming_Pack\Resources\"
:NsudoPolish
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "Reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f" >nul 2>&1
NSudo.exe -U:S -ShowWindowMode:Hide cmd /c "sc start "TrustedInstaller"" >nul 2>&1
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\Restart" ( goto EmptyStandbyListPolish ) else ( goto DownloadRestart64Polish )
:DownloadRestart64Polish
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\Restart64.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/restart64.exe"
goto EmptyStandbyListPolish
:EmptyStandbyListPolish
if exist "%SYSTEMDRIVE%\Gaming_Pack\Resources\EmptyStandbyList.exe" ( goto ContinueSoftRestartPolish ) else ( goto DownloadEmptyStandbyListPolish )
:DownloadEmptyStandbyListPolish
curl -g -L -# -o "%SystemDrive%\Gaming_Pack\Resources\EmptyStandbyList.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/EmptyStandbyList.exe"
goto ContinueSoftRestartPolish
:ContinueSoftRestartPolish
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
goto TweaksPG2Polish