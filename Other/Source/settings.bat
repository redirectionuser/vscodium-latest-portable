if not exist "%~dp0..\..\Data\VSCodium\User" (
  mkdir "%~dp0..\..\Data\VSCodium\User"
  copy "%~dp0settings.json" "%~dp0..\..\Data\VSCodium\User"
)

:: Resources
::   https://stackoverflow.com/questions/53369371/what-is-the-location-of-the-default-settings-file-of-vscode