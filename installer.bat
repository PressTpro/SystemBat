@echo off
cls
color 1f
title SystemBat Installer
echo This Application Installs SystemBat in your system
set /p where-toinstall="Where you want to install SystemBat?"
echo SystemBat will be installed in %where-toinstall%
pause
echo Downloading SystemBat from GitHub
powershell Invoke-WebRequest https://github.com/PressTpro/SystemBat/raw/main/systembat.bat -OutFile %where-toinstall%\systembat.bat
echo Downloading Manual from GitHub
powershell Invoke-WebRequest https://github.com/PressTpro/SystemBat/raw/main/systembatmanual.txt -OutFile %where-toinstall%\systembatmanual.txt
echo Creating Save Data...
echo ;; SystemBat Settings >>%where-toinstall%\systembat.ini
echo ;; Here Are Stored all the SystemBat Settings used in the System such as Username and Password >>%where-toinstall%\systembat.ini
set /p sysbatusr="What will your username be? "
set /p sysbatpass="What will your Password be? "
echo systembat-username=%sysbatusr% >>%where-toinstall%\systembat.ini
echo systembat-password=%sysbatpass% >>%where-toinstall%\systembat.ini
pause
cls
echo What Color you want for SystemBat?
echo 1) Blue (Background) - White (Text) (Default)
echo 2) Black (Background) - Green (Text)
echo 3) Black (Background) - White (Text)
echo C) Custom Color
set /p systembat-color="Color:"
if %systembat-color% == 1 goto default-color
if %systembat-color% == 2 goto black-green
if %systembat-color% == 3 goto black-white
if %systembat-color% == C goto custom-color
:default-color
echo systembat-color=1f >>%where-toinstall%\systembat.ini
goto finish
:black-green
echo systembat-color=0a >>%where-toinstall%\systembat.ini
goto finish
:black-white
echo systembat-color=0f >>%where-toinstall%\systembat.ini
goto finish
:custom-color
echo Type the Color (Example: 1f for Blue-White)
set /p ccolor=""
echo systembat-color=%ccolor% >>%where-toinstall%\systembat.ini
goto finish
:finish
echo All Done
pause
start %where-toinstall%\systembat.bat
