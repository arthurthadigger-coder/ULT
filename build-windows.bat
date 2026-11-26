@echo off
setlocal EnableExtensions
for %%I in ("%~dp0.") do set "PROJECT_DIR=%%~fI"
set "BUILD_DIR=%PROJECT_DIR%\build"
set "GENERATOR=Visual Studio 18 2026"

rem The user is on comp2, which has only drive C:. JUCE_PATH may be supplied
rem as an environment variable; otherwise search common default locations.
set "JUCE_DIR=%JUCE_PATH%"
if not defined JUCE_DIR if exist "%PROJECT_DIR%\..\JUCE\CMakeLists.txt" set "JUCE_DIR=%PROJECT_DIR%\..\JUCE"
if not defined JUCE_DIR if exist "D:\JUCE\CMakeLists.txt" set "JUCE_DIR=D:\JUCE"
if not defined JUCE_DIR if exist "C:\JUCE\CMakeLists.txt" set "JUCE_DIR=C:\JUCE"
if not defined JUCE_DIR if exist "%USERPROFILE%\JUCE\CMakeLists.txt" set "JUCE_DIR=%USERPROFILE%\JUCE"
if not defined JUCE_DIR if exist "%USERPROFILE%\Documents\JUCE\CMakeLists.txt" set "JUCE_DIR=%USERPROFILE%\Documents\JUCE"
if not defined JUCE_DIR if exist "C:\Program Files\JUCE\CMakeLists.txt" set "JUCE_DIR=C:\Program Files\JUCE"

echo ==================================================
echo  ULT v1.1.0 source - software renderer
echo  Project: %PROJECT_DIR%
echo  Build:   %BUILD_DIR%
echo  JUCE:    %JUCE_DIR%
echo ==================================================

if not defined JUCE_DIR (
  echo ERROR: JUCE folder not found. Set JUCE_PATH to your JUCE folder.
  pause
  exit /b 1
)
if not exist "%JUCE_DIR%\CMakeLists.txt" (
  echo ERROR: JUCE was not found at "%JUCE_DIR%".
  pause
  exit /b 1
)
where cmake >nul 2>nul
if errorlevel 1 (
  echo ERROR: CMake was not found in PATH.
  pause
  exit /b 1
)

cmake -S "%PROJECT_DIR%" -B "%BUILD_DIR%" -G "%GENERATOR%" -A x64 "-DJUCE_PATH=%JUCE_DIR%"
if errorlevel 1 (
  echo.
  echo CMake configuration failed.
  pause
  exit /b 1
)
cmake --build "%BUILD_DIR%" --config Release --target ult_VST3 --parallel
if errorlevel 1 (
  echo.
  echo Compilation failed.
  pause
  exit /b 1
)
echo.
echo Build completed successfully.
echo Expected VST3:
echo %BUILD_DIR%\ult_artefacts\Release\VST3\ult.vst3
pause
endlocal
