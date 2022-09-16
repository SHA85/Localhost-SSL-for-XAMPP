@echo off
set /p domain="Enter Domain: "
set OPENSSL_CONF=cert.conf

REM Read the "cert.conf" file and replace all {{DOMAIN}} placeholders by the entered domain.
REM Write the result into a new file called "cert_out.conf".
REM
REM @see https://stackoverflow.com/questions/5273937/how-to-replace-substrings-in-windows-batch-file#20227248

setlocal enabledelayedexpansion
set INTEXTFILE=cert.conf
set OUTTEXTFILE=cert_out.conf
set SEARCHTEXT={{DOMAIN}}
set REPLACETEXT=%domain%

if exist %OUTTEXTFILE% del /F %OUTTEXTFILE%
for /f "tokens=1,* delims=¶" %%A in ( '"findstr /n ^^ %INTEXTFILE%"') do (
   SET string=%%A
   for /f "delims=: tokens=1,*" %%a in ("!string!") do set "string=%%b"
   if  "!string!" == "" (
       echo.>>%OUTTEXTFILE%
   ) else (
      SET modified=!string:%SEARCHTEXT%=%REPLACETEXT%!
      echo !modified! >> %OUTTEXTFILE%
  )
)

REM Create the target directory.
if not exist .\%domain% mkdir .\%domain%

REM Create the certificate and key files.
..\bin\openssl req -config %OUTTEXTFILE% -new -sha256 -newkey rsa:2048 -nodes -keyout %domain%\server.key -x509 -days 3650 -out %domain%\server.crt

REM Delete the written file "cert.conf" as this file would only be used to create the certificate.
if exist %OUTTEXTFILE% del /F %OUTTEXTFILE%

echo.
echo -----
echo The certificate was provided.
echo.
pause