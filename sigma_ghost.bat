@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title SIGMA_GHOST v9.0 - Verified Toolkit

:: ===== ANSI COLOR CONFIG =====
set "CYAN=[96m"
set "GREEN=[92m"
set "RED=[91m"
set "YELLOW=[93m"
set "PURPLE=[95m"
set "BLUE=[94m"
set "RESET=[0m"

:: ===== VERIFIED SIGMA_GHOST BANNER =====
set "B1= ███████╗██╗ ██████╗ ███╗   ███╗ █████╗      ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗"
set "B2=██╔════╝██║██╔════╝ ████╗ ████║██╔══██╗    ██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝"
set "B3=███████╗██║██║  ███╗██╔████╔██║███████║    ██║  ███╗███████║██║   ██║███████╗   ██║   "
set "B4=╚════██║██║██║   ██║██║╚██╔╝██║██╔══██║    ██║   ██║██╔══██║██║   ██║╚════██║   ██║   "
set "B5=███████║██║╚██████╔╝██║ ╚═╝ ██║██║  ██║    ╚██████╔╝██║  ██║╚██████╔╝███████║   ██║   "
set "B6=╚══════╝╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   "

:: ===== SECURE CONFIGURATION =====
set "BTC=bc1ppzt0pn4plgtetlkar8p5j43udd2mh85cmtu9g23vxqfm6ayknpnsmgzcfr"
set "SOL=DRokH1Mhbzo4dGtA4wLUtjyVvNSyjVvCMikSbMRZr6k6"
set "TG_CHANNEL=https://t.me/Sigma_Cyber_Ghost"
set "SECURE_CHAT1=https://cryptpad.fr"
set "SECURE_CHAT2=https://session.org"
set "SECURE_CHAT3=https://privnote.com"

:: ===== MAIN INTERFACE =====
:menu
cls
echo %RED%╔══════════════════════════════════════════════════════════════════════════╗
echo ║%CYAN%                                                                              %RED%║
echo ║%CYAN% %B1% %RED%║
echo ║%CYAN% %B2% %RED%║
echo ║%CYAN% %B3% %RED%║
echo ║%CYAN% %B4% %RED%║
echo ║%CYAN% %B5% %RED%║
echo ║%CYAN% %B6% %RED%║
echo ║%CYAN%                                                                              %RED%║
echo ╠══════════════════════════════════════════════════════════════════════════╣
echo ║%GREEN% 1. System Matrix      2. Network Override      3. Crypto Vault        %RED%║
echo ║%GREEN% 4. Data Purger        5. Secure Comms          6. Cyber Tools         %RED%║
echo ║%GREEN% 7. Telegram           8. Ghost Protocol        9. Exit System         %RED%║
echo ╚══════════════════════════════════════════════════════════════════════════╝%RESET%
echo.
set /p choice="[root@sigma_ghost]# "

goto option_%choice%

:: ===== VERIFIED CORE MODULES =====

:option_1
call :check_admin
echo %YELLOW%[SYSTEM MATRIX SCAN]%RESET%
systeminfo | findstr /B /C:"Host Name" /C:"OS Name" /C:"OS Version"
wmic diskdrive get status,model
wmic memorychip get capacity
timeout 5
goto menu

:option_2
echo %YELLOW%[NETWORK OVERRIDE]%RESET%
echo 1. Show IP Address
echo 2. Show MAC Address
echo 3. Show WiFi Passwords
echo 4. Return to Main
set /p net="Select: "

if "!net!"=="1" (
    ipconfig | findstr IPv4
    timeout 3
)
if "!net!"=="2" (
    getmac /v
    timeout 3
)
if "!net!"=="3" (
    call :wifi_pass
)
goto menu

:option_3
echo %YELLOW%[CRYPTO VAULT ACCESS]%RESET%
echo %GREEN%BTC: %BTC%
echo SOL: %SOL%%RESET%
timeout 5
goto menu

:option_4
echo %RED%[DATA PURGER ACTIVATED]%RESET%
choice /c yn /m "Confirm Data Annihilation (y/n): "
if errorlevel 2 goto menu
echo %YELLOW%[+] Overwriting free space...%RESET%
cipher /w:%TEMP%
echo %YELLOW%[+] Deleting temporary files...%RESET%
del /q /f %TEMP%\*.*
echo %GREEN%[+] All digital traces eliminated%RESET%
timeout 2
goto menu

:option_5
echo %YELLOW%[SECURE COMMUNICATIONS]%RESET%
echo 1. CryptPad (Encrypted Docs)
echo 2. Session (Secure Messenger)
echo 3. PrivNote (Self-Destruct)
echo 4. Return to Main
set /p comm="Select: "

if "!comm!"=="1" (
    start "" "%SECURE_CHAT1%"
    echo %GREEN%[+] CryptPad launched in browser%RESET%
)
if "!comm!"=="2" (
    start "" "%SECURE_CHAT2%"
    echo %GREEN%[+] Session secure messenger initialized%RESET%
)
if "!comm!"=="3" (
    start "" "%SECURE_CHAT3%"
    echo %GREEN%[+] PrivNote with auto-destruct activated%RESET%
)
timeout 2
goto menu

:option_6
echo %YELLOW%[CYBER TOOLS MENU]%RESET%
echo 1. Port Scanner
echo 2. Service Manager
echo 3. Security Audit
echo 4. Return to Main
set /p cyber="Select: "

if "!cyber!"=="1" (
    echo %YELLOW%[PORT SCANNER]%RESET%
    set /p target="Enter IP/Hostname: "
    set /p port="Enter Port: "
    echo %GREEN%Scanning !target!:!port!...%RESET%
    powershell -Command "Test-NetConnection -ComputerName !target! -Port !port!"
    timeout 5
)
if "!cyber!"=="2" (
    echo %YELLOW%[SERVICE MANAGER]%RESET%
    echo 1. List Services
    echo 2. Stop Service
    set /p svc="Select: "
    if "!svc!"=="1" (
        sc query type= service state= all | findstr SERVICE_NAME
        timeout 5
    )
    if "!svc!"=="2" (
        set /p service="Enter Service Name: "
        sc stop "!service!"
        timeout 2
    )
)
if "!cyber!"=="3" (
    echo %YELLOW%[SECURITY AUDIT]%RESET%
    wmic qfe list brief /format:table
    echo %GREEN%[+] Showing installed security updates%RESET%
    timeout 5
)
goto menu

:option_7
start "" "%TG_CHANNEL%"
echo %GREEN%[+] Opening Secure Telegram Channel...%RESET%
timeout 2
goto menu

:option_8
call :check_admin
echo %RED%[GHOST PROTOCOL ENGAGED]%RESET%
echo %YELLOW%Available Network Interfaces:%RESET%
netsh interface show interface
set /p iface="Enter Interface Name: "
choice /c yn /m "Disable !iface!? (y/n): "
if errorlevel 2 goto menu
netsh interface set interface "!iface!" admin=disable
echo %GREEN%[+] Network interface !iface! disabled%RESET%
timeout 2
goto menu

:option_9
exit

:: ===== VERIFIED FUNCTIONS =====
:check_admin
NET FILE 1>NUL 2>NUL || (
    echo %RED%[SECURITY ALERT]%RESET%
    echo %YELLOW%Elevation required! Run as Administrator%RESET%
    timeout 3
    exit /b 1
)
exit /b

:wifi_pass
call :check_admin
echo %YELLOW%[WIFI ACCESS POINTS]%RESET%
netsh wlan show profiles
set /p ssid="Enter SSID: "
netsh wlan show profile name="!ssid!" key=clear
timeout 7
exit /b
