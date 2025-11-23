@echo off
set SCRIPT="%TEMP%\makeshortcut.vbs"
set "cd=%~dp0"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%

echo sLinkFile = "%USERPROFILE%\Desktop\[Game Name Here].lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%cd%\[Game Exe Name Here].exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%cd%" >> %SCRIPT%
:: Uncomment this next line if the game requires launch arguments.
:: echo oLink.Arguments = "" >> %SCRIPT%
:: Uncomment this next line if there's another icon you'd like to use for your shortcut.
:: o oLink.IconLocation =  "%cd%\icon.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript %SCRIPT%

del %SCRIPT%
