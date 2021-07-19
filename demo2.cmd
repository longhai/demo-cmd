CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off
mode con cols=90 lines=34
title  Microsoft Activation Scripts
::===========================================================================

setlocal enabledelayedexpansion
setlocal EnableExtensions
pushd "%~dp0"
color 03
cd /d "%~dp0"
if /i "%PROCESSOR_ARCHITECTURE%"=="x86" if not defined PROCESSOR_ARCHITEW6432 set xOS=x86
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Caption /format:LIST"')do (set NameOS=%%a) >nul 2>&1
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get CSDVersion /format:LIST"')do (set SP=%%a) >nul 2>&1
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Version /format:LIST"')do (set Version=%%a) >nul 2>&1
:MAINMENU
echo [37m==========================================================================================[1m
set yy=%date:~-4%
set mm=%date:~-7,2%
set dd=%date:~-10,2%
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)
echo                                                                     %dd%.%mm%.%yy% ^- %mytime%
                                                           
                                                       
echo   [33mHỖ TRỢ SẢN PHẨM MICROSOFT:[0m
echo   Windows 7 (VL) ^| ([94mPro, Enterprise, Thin PC[m)
echo   Windows 8 ^| 8.1 ^| ([94mAll[m)
echo   Windows 10 ^| ([94mAll[m)
echo   Windows Server ([94m2008 ^| 2012 ^| 2012 R2 ^| 2016 ^| 2019[m)
echo   Office ([94m2010 ^| 2013 ^| 2016 ^| 2019 (VL)[m)
echo.
echo          TÊN HĐH : %NameOS% %SP% %xOS%(%Version%)
reg.exe query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DigitalProductId >nul 2>&1

echo          KIẾN TRÚC :%PROCESSOR_ARCHITECTURE%
echo          TÊN MÁY TÍNH : %computername%
echo.
cscript //nologo %windir%\system32\slmgr.vbs /ato >nul
cscript //nologo %windir%\system32\slmgr.vbs /xpr |findstr "permanently" >nul
if %errorlevel%==0  (
@echo          [94mWINDOWS Đã KÍCH HOẠT BẢN QUYỀN VĨNH VIỄN[m
) else (
@echo          [31mWINDOWS CHƯA ĐƯỢC KÍCH HOẠT BẢN QUYỀN VĨNH VIỄN[m
)
echo [37m==========================================================================================[0m
echo.
echo.  [93m[1] Activation Windows 7 (Pro, Enterprise, Thin PC)[0m
echo.
Echo.  [94m[2] Activation Windows 8^|8.1 (All)[0m
echo.
Echo.  [97m[3] Activation Windows 10 (All)[0m
Echo.
Echo.  [95m[4] Activation Windows Server (2008 ^| 2012 ^| 2012 R2 ^| 2016 ^| 2019)[0m
echo.
Echo.  [33m[5] Activation Office (2010 ^| 2013 ^| 2016 ^| 2019 (VL))[0m
echo.
Echo.  [32m[6] KMS ^& DIGITAL ^& Truy cập website hoạt động trực tuyến (TNCTR)[0m
Echo.
Echo.  [96m[7] Exit[0m
Echo.
echo [37m==========================================================================================[1m
Echo.
choice /C:1234567 /N /M "Nhập lựa chọn của bạn:"
if errorlevel 7 goto :Exit
if errorlevel 6 goto :TNCTR
if errorlevel 5 goto :R2V
if errorlevel 4 goto :Check
if errorlevel 3 goto :Online
if errorlevel 2 goto :Digital
if errorlevel 1 goto :Inject

::===========================================================================

