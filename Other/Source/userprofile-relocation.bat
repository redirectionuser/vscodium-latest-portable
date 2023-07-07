if not exist "%~dp0..\..\..\CommonFiles\UserProfile" (
  exit /b 0
)

if not exist "%~dp0..\..\..\CommonFiles\UserProfile\AppData\Roaming\Microsoft\Windows" (
  exit /b 0
)

if exist "%~dp0..\..\..\CommonFiles\UserProfile\AppData\Roaming\Microsoft\Windows\Recent" (
  rmdir /q "%~dp0..\..\..\CommonFiles\UserProfile\AppData\Roaming\Microsoft\Windows\Recent"
  mklink /J "%~dp0..\..\..\CommonFiles\UserProfile\AppData\Roaming\Microsoft\Windows\Recent" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent" 1>NUL 2>&1
)

cd /d "%~dp0..\..\..\CommonFiles\UserProfile"
for /f "tokens=2 delims=\" %%i in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" ^| findstr "REG_EXPAND_SZ" ^| findstr /V "AppData"') ^
do (
  rmdir /q "%%~i"
  mklink /J "%%~i" "%USERPROFILE%\%%~i" 1>NUL 2>&1
)

:: Resources
::   https://superuser.com/questions/1132288/windows-command-prompt-get-relocated-users-documents-folder