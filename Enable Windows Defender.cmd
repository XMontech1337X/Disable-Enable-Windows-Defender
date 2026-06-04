@echo off

echo.
echo [KENSHTWEAKS] MADE BY @KENSHIRO EXLORD FOR ATLASFORK!
echo [KENSHTWEAKS] SUPPORT: https://t.me/K999E999
timeout /t 3 >nul
echo.

:: Disable Services\Drivers Windows Defender
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d "0" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "0" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MDCoreSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "3" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WebThreatDefSvc" /v "Start" /t REG_DWORD /d "3" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WebThreatDefUserSvc" /v "Start" /t REG_DWORD /d "2" /f >nul
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "WebThreatDefUserSvc_*"') do (
    reg.exe add "%%a" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
)
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "2" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecFlt" /v "Start" /t REG_DWORD /d "3" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecWfp" /v "Start" /t REG_DWORD /d "3" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecCore" /v "Start" /t REG_DWORD /d "0" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "3" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "3" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\KslD" /v "Start" /t REG_DWORD /d "3" /f >nul

:: Enable Windows Defender Policy
reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /f >nul

echo.
if not defined HYPEOS_STEP_RESULT set "HYPEOS_STEP_RESULT=SUCCESS"
echo [KENSHTWEAKS] CHANGE: WINDOWS DEFENDER ENABLED
echo [KENSHTWEAKS] STEP RESULT: %HYPEOS_STEP_RESULT%
set /p reboot=[KENSHTWEAKS] Would you like to reboot now to apply changes? (Y/N): 
if /i "%reboot%"=="Y" (
    shutdown /r /t 0
)
exit /b
