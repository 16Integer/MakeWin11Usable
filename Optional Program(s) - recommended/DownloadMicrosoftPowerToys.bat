@echo off

REM Get the current directory of the batch file
set "current_dir=%~dp0"

REM Get the parent folder path
for %%I in ("%current_dir%\..") do set "parent_folder=%%~fI"

REM Set the destination path to the "Programs" folder
set "destination=%parent_folder%\Programs"

REM Create the "Programs" directory if it doesn't exist
mkdir "%destination%" 2>nul

REM Download the file using curl
curl -L -o "%destination%\PowerToysUserSetup-0.70.1-x64.exe" "https://github.com/microsoft/PowerToys/releases/download/v0.70.1/PowerToysUserSetup-0.70.1-x64.exe"

REM Check if the download was successful
if %errorlevel% equ 0 (
    echo File downloaded successfully.
) else (
    echo Failed to download the file.
)

REM Pause the batch file to keep the command window open
pause
