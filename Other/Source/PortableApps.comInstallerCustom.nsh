
!macro CustomCodePostInstall
	nsExec::ExecToLog `"$INSTDIR\other\source\settings.bat"`
    nsExec::ExecToLog `"$INSTDIR\other\source\userprofile.bat"`
	nsExec::ExecToLog `"$INSTDIR\other\source\unpack.bat"`
	nsExec::ExecToLog `"$INSTDIR\other\source\product.bat"`
!macroend