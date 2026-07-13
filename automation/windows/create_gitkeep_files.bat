@echo off
setlocal EnableDelayedExpansion

title Harmony AI - GitKeep Generator
color 0B

echo.
echo ==========================================================
echo          Harmony AI - GitKeep File Generator
echo ==========================================================
echo.

REM Change to repository root
cd /d "%~dp0\..\.."

echo Repository:
echo %CD%
echo.

set COUNT=0

echo Scanning directories...
echo.

for /d /r %%D in (*) do (

    if not exist "%%D\.gitkeep" (

        type nul > "%%D\.gitkeep"

        echo [CREATED] %%D\.gitkeep

        set /a COUNT+=1

    ) else (

        echo [EXISTS ] %%D\.gitkeep

    )

)

echo.
echo ==========================================================
echo Completed Successfully
echo.
echo GitKeep files created: %COUNT%
echo ==========================================================
echo.

pause