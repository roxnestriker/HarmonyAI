@echo off
setlocal EnableDelayedExpansion
title Harmony AI - Repository Initializer
color 0A

echo.
echo ==========================================================
echo             Harmony AI Repository Initializer
echo                     Version 1.0
echo ==========================================================
echo.

REM ============================================================
REM Verify repository root
REM ============================================================

cd /d "%~dp0\..\.."

echo Repository Root:
echo %CD%
echo.

REM ============================================================
REM Create Directories
REM ============================================================

echo Creating directories...
echo.

for %%D in (

apps
apps\desktop
apps\android
apps\api

packages
packages\harmony_core
packages\harmony_library
packages\harmony_metadata
packages\harmony_database
packages\harmony_ai
packages\harmony_cloud
packages\harmony_sync
packages\harmony_plugins
packages\harmony_common

docs
docs\architecture
docs\adr
docs\api
docs\database
docs\development
docs\release
docs\research
docs\user

project

project\AI_MEMORY

prompts
prompts\onboarding
prompts\coding
prompts\review
prompts\testing
prompts\documentation
prompts\debugging
prompts\research
prompts\templates

automation
automation\windows
automation\python
automation\powershell

assets
assets\icons
assets\logos
assets\mockups
assets\screenshots

tests
examples
scripts
tools

) do (

    if not exist "%%D" (
        mkdir "%%D"
        echo [CREATED] %%D
    ) else (
        echo [EXISTS ] %%D
    )

)

echo.
echo ============================================================
echo Creating Markdown Files...
echo ============================================================
echo.

call :CreateFile README.md
call :CreateFile LICENSE

call :CreateFile project\PROJECT.md
call :CreateFile project\ROADMAP.md
call :CreateFile project\SPRINT.md
call :CreateFile project\TASKS.md
call :CreateFile project\FEATURES.md
call :CreateFile project\BUGS.md
call :CreateFile project\TECH_DEBT.md
call :CreateFile project\CHANGELOG.md
call :CreateFile project\THREAD_GUIDE.md
call :CreateFile project\DECISIONS.md
call :CreateFile project\ENGINEERING_LOG.md

call :CreateFile project\DOC-001_OPERATING_MANUAL.md
call :CreateFile project\DOC-002_AI_TEAM_HANDBOOK.md
call :CreateFile project\DOC-003_DEVELOPMENT_STANDARDS.md
call :CreateFile project\DOC-004_PROJECT_BOOTSTRAP.md

call :CreateFile project\AI_MEMORY\architecture_history.md
call :CreateFile project\AI_MEMORY\completed_features.md
call :CreateFile project\AI_MEMORY\decisions.md
call :CreateFile project\AI_MEMORY\lessons_learned.md
call :CreateFile project\AI_MEMORY\prompt_improvements.md
call :CreateFile project\AI_MEMORY\recurring_mistakes.md
call :CreateFile project\AI_MEMORY\terminology.md

call :CreateFile docs\ARCHITECTURE.md
call :CreateFile docs\DATABASE.md
call :CreateFile docs\API.md
call :CreateFile docs\SECURITY.md
call :CreateFile docs\CONTRIBUTING.md
call :CreateFile docs\CODE_STYLE.md

echo.
echo ============================================================
echo Repository initialized successfully.
echo ============================================================
echo.
pause
exit /b

:CreateFile

if not exist "%~1" (
    type nul > "%~1"
    echo [CREATED] %~1
) else (
    echo [EXISTS ] %~1
)

exit /b