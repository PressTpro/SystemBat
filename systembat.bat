
 
:: Has been a While Since the Last BatSys Update
:: This update is a Extended Version of BatSys
:: Boot Stage
:: The Boot Stage Loads the System and Crashes when a Error Happens
:boot
@echo off
cls
title Starting Up...
:: Load Errors
if ERRORLEVEL == 1 goto crash
:: Load System color

:: Applications
set downloader=Downloader
set notepad=Notepad
set renamer=Renamer
set deleter=Deleter
set command-line=Command
set ssh-line=SSH
set bash-line=Bash
:: Load Savedata
for /f "tokens=1,2 delims==" %%a in (systembat.ini) do (
if %%a==systembat-username set systembat-username=%%b
if %%a==systembat-password set systembat-password=%%b
if %%a==systembat-color set systembat-color=%%b
)
:: Load Color
color %systembat-color%
:: Once Done Loading, It haves to Enter to the Login Page
:: It Verifies you're using a correct Username And Password, if true, it allows you to continue, else it will crash and exit
:login
cls
title SystemBat Login
echo Welcome to SystemBat, Please Login with your SystemBat Account
set /p login-inp-usr="Username: "
if %login-inp-usr% == %systembat-username% goto login-password
goto crash
:login-password
set /p login-inp-pass="Password: "
if %login-inp-pass% == %systembat-password% goto login-success
goto crash
:login-success
echo You're Now Logged In, %systembat-username% now what you want to do?
echo 1) Go to the System Menu
echo 2) News and Updates
set /p success-action="Action: "
if %success-action% == 1 goto system-menu
if %success-action% == 2 goto news-updates
goto crash
:system-menu
cls
title SystemBat
echo %TIME%  Hello %systembat-username%
echo Select a Category
echo 1) File Management Tools
echo 2) Command Line Tools
echo 3) Internet Tools
echo 4) System Management
echo 5) Read the System Manual
set /p system-action="What do you want to do Today?"
if %system-action% == 1 goto file-management
if %system-action% == 2 goto command-line-tools
if %system-action% == 3 goto internet-tools
if %system-action% == 4 start notepad systembat.ini
if %system-action% == 5 goto manual
goto crash
:crash
cls
title SystemBat Crash
echo The System Crashed and Cannot Continue, We're Sorry!
pause
exit
:news-updates
cls
title SystemBat News And Updates
echo News and Updates are not Done
pause
goto login
:: Categories
:internet-tools
cls
title System Bat Browser
echo Site to go
set site="Site: "
echo Incognito? (Y/N)
set /p incognito=""
if %incognito% == Y start msedge %site% -inprivate
if %incognito% == N start msedge %site%
goto system-menu
:file-management
cls
title SystemBat File Management Tools
echo What would you like to do?
echo 1) RENAME a File using RENAMER
echo 2) DELETE a File using Delete
echo 3) DOWNLOAD a File from the Web using Downloader
echo 4) Return to System Menu
set /p file-management-option="Option:"
if %file-management-option% == 1 goto renamer
if %file-management-option% == 2 goto deleter
if %file-management-option% == 3 goto dwnldr
if %file-management-option% == 4 goto system-menu
goto crash
:command-line-tools
cls
title SystemBat Command Line Tools
echo What you wanna do?
echo 1) %command-line%
echo 2) %bash-line%
echo 3) %ssh-line%
echo 4) Return to System Menu
set /p cmd-tools-option="Option: "
if %cmd-tools-option% == 1 goto command-line
if %cmd-tools-option% == 2 goto bash-client
if %cmd-tools-option% == 3 goto ssh-client
if %cmd-tools-option% == 4 goto system-menu
goto crash
:: Applications
:renamer
title %renamer% Lite
set /p fileto-rename="File to Rename: "
set /p fileto-newname="New name for %fileto-rename%: "
RENAME %fileto-rename% %fileto-newname%
echo Renamed
pause
goto file-management
:deleter
title %deleter% Lite
set /p fileto-delete="File to Delete"
pause
del %fileto-delete%
echo Done
pause
goto file-management
:command-line
cls
title %command-line%
echo SystemBat Command Line v1
echo Type systembat-exit to leave the command line

:cmd-loop
set /p  commandline-command=">"
%commandline-command%
if %commandline-command%==systembat-exit goto system-menu 
goto cmd-loop
:ssh-client
cls
title %ssh-line%
set /p server="SSH Server: "
set /p ssh-usr="SSH Username: "
ssh %ssh-usr%@%server%
goto system-menu 
:bash-loader
cls
title %bash-line%
echo Make sure you got a Linux Distribution such as Debian or Ubuntu from Microsoft Store
echo Also make sure you got Windows Subsystem for Linux, Else this will not work
echo Type systembat-leave to Return to Command Line Tools Category
:bash-loop
set /p bash-command="$"
bash %bash-command%
if %bash-command%==systembat-leave goto command-line-tools
goto bash-loop
:dwnldr
cls
title SystemBat Downloader
set /p wtd="File to Download: "
set /p wtd-lct="File Location: "
set /p wtd-nme="What will be the Name of the File you want to Download once its in your PC? "
powershell Invoke-WebRequest %wtd% -OutFile %wtd-lct%\%wtd-nme%
pause
goto file-management



:manual
:: This Checks if Manual is Installed in SystemBat
if not exist systembatmanual.txt == true powershell Invoke-WebRequest https://github.com/PressTpro/SystemBat/raw/main/systembatmanual.txt -OutFile systembatmanual.txt
start systembatmanual.txt
goto system-menu
