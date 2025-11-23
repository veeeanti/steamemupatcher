@echo off
setlocal 

:: List everything
set "emudll32=%~dp0\steam_api.dll"
set "targetdll32=%~dp1\steam_api.dll"
set "ogtarget32=%~dp1\steam_api_o.dll"
set "emudll64=%~dp0\steam_api64.dll"
set "targetdll64=%~dp1\steam_api64.dll"
set "ogtarget64=%~dp1\steam_api64_o.dll"
set "blankshortcutmakerbat=%~dp0\Template Make Desktop Shortcut Bat.bat"
set "genints32=%~dp0\generate_interfaces_x32.exe"
set "genints64=%~dp0\generate_interfaces_x64.exe"

:: Check if either one exists so it knows where to start, sometimes there's both dlls 
if exist "%targetdll32%" goto:32
if exist "%targetdll64%" goto:64
echo "Error: no steam dlls of either kind found! If this is a mistake, contact vee.anti on discord or open an issue on the GitHub repo for this!"
endlocal
pause
exit

:: 32-bit stuff
:32
ren "%targetdll32%" "steam_api_o.dll"
copy /Y "%emudll32%" "%targetdll32%"
"%genints32%" "%~dp1\steam_api_o.dll"
del "%~dp1\steam_api_o.dll"
if exist "%targetdll64%" goto:64
goto:extrastuff

:: 64-bit stuff
:64
ren "%targetdll64%" "steam_api64_o.dll"
copy /Y "%emudll64%" "%targetdll64%"
"%genints64%" "%~dp1\steam_api64_o.dll"
del "%~dp1\steam_api64_o.dll"
goto:extrastuff

:: Lame excuse for a proper end signal for the batch script
:extrastuff
copy /Y "%blankshortcutmakerbat%" "%~dp1\create_shortcut_on_desktop.bat"
endlocal
exit
