CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off
mode con cols=118 lines=33
title  Microsoft Activation Scripts

::===========================================================================


:main
cls
set winos=
for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName 2^>nul') do if not errorlevel 1 set "winos=%%b"
if not defined winos for /f "tokens=2* delims== " %%a in ('"wmic os get caption /value" 2^>nul') do if not errorlevel 1 set "winos=%%b"
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Version /format:LIST"')do (set Version=%%a) >nul 2>&1
@echo.
echo.                                     [33m%winos% (%Version%)[m
echo.
echo        ____________________[95mWINDOWS[m_________________________________________________[95mOFFICE[m_____________________
echo       ^|                                                   ^|                                                   ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[1] Kích hoạt kỹ thuật số Windows 10 (HWID)[m   ^|     [92m[A] Activate Office Bang Key Online[m           ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[2] Kích hoạt KMS38 Windows 10/Server[m         ^|     [92m[B] Kích hoạt Windows bằng điện thoại[m         ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[3] Kích hoạt KMS trực tuyến[m                  ^|     [92m[C] Xuất Step2 Installation ID[m                ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[4] Kích hoạt Windows bằng điện thoại[m         ^|     [92m[D] Nhập Step3 Confirmation ID[m                ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[5] Xuất Step2 Installation ID[m                ^|     [92m[D] Convert Office[m                            ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[6] Nhập Step3 Confirmation ID[m                ^|     [92m[D] Xóa Key Office[m                            ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|     [32m[7] Xem Version Windows[m                       ^|     [92m[D] Kiểm Tra Trạng Thái Office[m                ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|                                                   ^|                                                   ^|
echo       ^|___________________________________________________^|___________________________________________________^|
echo       ^|                                                                                                       ^|
echo       ^|                                                                                                       ^|
cscript //nologo %windir%\system32\slmgr.vbs /ato >nul
cscript //nologo %windir%\system32\slmgr.vbs /xpr |findstr "permanently" >nul
if %errorlevel%==0  (
@echo       ^|                            [94m=== WINDOWS Đã KÍCH HOẠT BẢN QUYỀN VĨNH VIỄN ===[m                           ^|
) else (
@echo       ^|                         [31m=== WINDOWS CHƯA ĐƯỢC KÍCH HOẠT BẢN QUYỀN VĨNH VIỄN ===[m                       ^|
)
echo       ^|                                                                                                       ^|
echo       ^|_______________________________________________________________________________________________________^|
echo:[36m
choice /C:123456789 /N /M ".                                      Nhập lựa chọn của bạn: "
if errorlevel 9 goto:Exit
if errorlevel 8 goto:CheckForUpdates
if errorlevel 7 goto:Extract
if errorlevel 6 goto:EditionChange
if errorlevel 5 goto:InsertProductKey
if errorlevel 4 goto:ReadMe
if errorlevel 3 goto:Check
if errorlevel 2 goto:temp2 2
if errorlevel 1 goto:temp 1

::===========================================================================

