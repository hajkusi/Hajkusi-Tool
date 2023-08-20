@echo off
del %appdata%\Hone\GPUCache\ /F /Q /S
del %appdata%\Hone\Cache\Cache_Data /F /Q /S
del %appdata%\Hone\DawnCache\ /F /Q /S
cd %appdata%\Hone\Code Cache\js\
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
cls