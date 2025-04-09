:: filepath: c:\Users\marti\BrowserQuest-lite\bin\build.bat
@echo off

:: Script to generate an optimized client build of BrowserQuest

set BUILDDIR=..\client-build
set PROJECTDIR=..\client\js
set CURDIR=%cd%

echo Deleting previous build directory
if exist %BUILDDIR% (
    rmdir /s /q %BUILDDIR%
)

echo Building client with RequireJS
cd %PROJECTDIR%
node ..\..\bin\r.js -o build.js
cd %CURDIR%

echo Removing unnecessary js files from the build directory
for %%f in (game.js home.js console.js require-jquery.js modernizr.js css3-mediaqueries.js mapworker.js detect.js underscore.min.js text.js) do (
    if exist %BUILDDIR%\js\%%f del /q %BUILDDIR%\js\%%f
)

echo Removing sprites directory
if exist %BUILDDIR%\sprites (
    rmdir /s /q %BUILDDIR%\sprites
)

echo Removing config directory
if exist %BUILDDIR%\config (
    rmdir /s /q %BUILDDIR%\config
)

echo Moving build.txt to current dir
if exist %BUILDDIR%\build.txt (
    move /y %BUILDDIR%\build.txt %CURDIR%
)

echo Build complete