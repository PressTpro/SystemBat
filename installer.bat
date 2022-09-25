@echo off
cls
color 1f
title SystemBat Installer
echo This Application Installs SystemBat in your system
set /p where-toinstall="Where you want to install SystemBat?"
echo SystemBat will be installed in %where-toinstall%
pause
echo Downloading SystemBat from GitHub
powershell Invoke-WebRequest https://github.com/PressTpro/SystemBat/releases/download/v0.1-alpha/systembat.bat -OutFile %where-toinstall%\systembat.bat
echo Creating Save Data...
echo ;; SystemBat Settings >>%where-toinstall%\systembat.ini
echo ;; Here Are Stored all the SystemBat Settings used in the System such as Username and Password >>%where-toinstall%\systembat.ini
set /p sysbatusr="What will your username be? "
set /p sysbatpass="What will your Password be? "
echo systembat-username=%sysbatusr% >>%where-toinstall%\systembat.ini
echo systembat-password=%sysbatpass% >>%where-toinstall%\systembat.ini
pause
cls
echo All Done
pause
start %where-toinstall%\systembat.bat