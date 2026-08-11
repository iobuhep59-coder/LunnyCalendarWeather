@echo off
setlocal
set "VERSION=8.10.2"
set "DIST=%USERPROFILE%\.gradle\wrapper\dists\gradle-%VERSION%-bin"
set "GHOME=%DIST%\gradle-%VERSION%"
if not exist "%GHOME%\bin\gradle.bat" (
  if not exist "%DIST%" mkdir "%DIST%"
  if not exist "%DIST%\gradle-%VERSION%-bin.zip" powershell -NoProfile -Command "Invoke-WebRequest -UseBasicParsing 'https://services.gradle.org/distributions/gradle-%VERSION%-bin.zip' -OutFile '%DIST%\gradle-%VERSION%-bin.zip'"
  powershell -NoProfile -Command "Expand-Archive -Force '%DIST%\gradle-%VERSION%-bin.zip' '%DIST%\unpacked'"
  move "%DIST%\unpacked\gradle-%VERSION%" "%GHOME%" >nul
  rmdir /s /q "%DIST%\unpacked"
)
call "%GHOME%\bin\gradle.bat" -p "%~dp0" %*
