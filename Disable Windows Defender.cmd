@echo off

echo.
echo [KENSHTWEAKS] MADE BY @KENSHIRO EXLORD FOR ATLASFORK!
echo [KENSHTWEAKS] SUPPORT: https://t.me/K999E999
timeout /t 3 >nul
echo.

:: Disable Services\Drivers Windows Defender
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdBoot" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MDCoreSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WebThreatDefSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WebThreatDefUserSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "WebThreatDefUserSvc_*"') do (
    reg.exe add "%%a" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
)
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecFlt" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecWfp" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MsSecCore" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f >nul
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\KslD" /v "Start" /t REG_DWORD /d "4" /f >nul

:: Disable Windows Defender Policy
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >nul

:: Disable Windows Defender Tasks
schtasks.exe /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable >nul
schtasks.exe /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable >nul
schtasks.exe /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable >nul
schtasks.exe /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable >nul

echo.
if not defined HYPEOS_STEP_RESULT set "HYPEOS_STEP_RESULT=SUCCESS"
echo [KENSHTWEAKS] CHANGE: WINDOWS DEFENDER DISABLED
echo [KENSHTWEAKS] STEP RESULT: %HYPEOS_STEP_RESULT%
set /p reboot=[KENSHTWEAKS] Would you like to reboot now to apply changes? (Y/N): 
if /i "%reboot%"=="Y" (
    shutdown /r /t 0
)
exit /b
