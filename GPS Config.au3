#NoTrayIcon
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=D:\Downloads\1332576732_android(1).ico
#AutoIt3Wrapper_Outfile=GPSConfig.exe
#AutoIt3Wrapper_Res_Description=©2012 broodplank.net
#AutoIt3Wrapper_Res_Fileversion=0.1.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Obfuscator=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <ComboConstants.au3>
#include <Process.au3>
#include <Misc.au3>

FileInstall("E:\gps\barh.jpg", @TempDir & "\barh.jpg")
FileInstall("E:\gps\barv.jpg", @TempDir & "\barv.jpg")

GUICreate("GPS Configuration - by broodplank", 400, 215)
GUISetFont(8, 8, 0, "Verdana")

GUICtrlCreatePic(@TempDir & "\barv.jpg", 96, 0, 1, 250)

GUICtrlCreateLabel("STEP 1", 12, 22, 80, 80)
GUICtrlSetFont(-1, 14, 800, "", "Verdana")
GUICtrlCreateLabel("Select Region:", 105, 5)
$region = GUICtrlCreateCombo("", 105, 20, 200, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData($region, "Africa|Asia|Europe|Oceania|North-America|South-America|World", "Europe")
$selectregion = GUICtrlCreateButton("Select", 310, 20, 70, 20)
GUICtrlCreateLabel("Selected NTP Server:", 105, 45, 160)
$regionlabel = GUICtrlCreateLabel("Select region", 225, 45, 200)
GUICtrlSetColor($regionlabel, 0xff0000)

GUICtrlCreatePic(@TempDir & "\barh.jpg", 0, 69, 400, 1)
GUICtrlCreateLabel("STEP 2", 12, 95, 80, 80)
GUICtrlSetFont(-1, 14, 800, "", "Verdana")
GUICtrlCreateLabel("Select Country Code:", 105, 80)
$country = GUICtrlCreateCombo("Select a region", 105, 95, 200, 20, $CBS_DROPDOWNLIST)
GUICtrlSetState($country, $GUI_DISABLE)
$selectcountry = GUICtrlCreateButton("Select", 310, 95, 70, 20)
GUICtrlSetState($selectcountry, $GUI_DISABLE)
GUICtrlCreateLabel("Selected NTP Server:", 105, 120, 150)
$countrylabel = GUICtrlCreateLabel("Select country", 225, 120, 120)
GUICtrlSetColor($countrylabel, 0xff0000)
;~ GUICtrlSetData($country, "")

GUICtrlCreatePic(@TempDir & "\barh.jpg", 0, 145, 400, 1)


GUICtrlCreateLabel("STEP 3", 12, 168, 80, 80)
GUICtrlSetFont(-1, 14, 800, "", "Verdana")

$buildgps = GUICtrlCreateButton("Build " & Chr(34) & "gps.conf" & Chr(34), 105, 155, 120, 25)
GUICtrlSetState($buildgps, $GUI_DISABLE)
$viewgps = GUICtrlCreateButton("View " & Chr(34) & "gps.conf" & Chr(34), 105, 185, 120, 25)
GUICtrlSetState($viewgps, $GUI_DISABLE)
$clipboard = GUICtrlCreateButton("Copy file to clipboard", 235, 155, 150, 25)
GUICtrlSetState($clipboard, $GUI_DISABLE)
$push = GUICtrlCreateButton("Push file to device", 235, 185, 150, 25)
GUICtrlSetState($push, $GUI_DISABLE)


GUISetState()

While 1
	$msg = GUIGetMsg()

	If $msg = $gui_event_close Then
		FileDelete(@TempDir & "\barh.jpg")
		FileDelete(@TempDir & "\barv.jpg")
		Exit
	EndIf

	If $msg = $selectregion Then

		If GUICtrlRead($selectregion) = "Reset" Then
			GUICtrlSetState($region, $GUI_ENABLE)
			GUICtrlSetData($selectregion, "Select")
			GUICtrlSetData($regionlabel, "Select a region")
			GUICtrlSetColor($regionlabel, 0xff0000)
			GUICtrlSetState($country, $GUI_DISABLE)
			GUICtrlSetState($selectcountry, $GUI_DISABLE)
			GUICtrlSetState($buildgps, $GUI_DISABLE)
			GUICtrlSetState($viewgps, $GUI_DISABLE)
			GUICtrlSetState($clipboard, $GUI_DISABLE)
			GUICtrlSetState($push, $GUI_DISABLE)
		Else
			GUICtrlSetState($region, $GUI_DISABLE)
			GUICtrlSetData($selectregion, "Reset")
			GUICtrlSetData($regionlabel, StringLower(GUICtrlRead($region)) & ".pool.ntp.org")
			GUICtrlSetColor($regionlabel, 0x008000)
			GUICtrlSetState($country, $GUI_ENABLE)
			GUICtrlSetState($selectcountry, $GUI_ENABLE)

			If GUICtrlRead($region) = "Africa" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "TZ|ZA|AO|MG|UG", "TZ")
			EndIf

			If GUICtrlRead($region) = "Asia" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "PH|MY|TR|SG|IN|HK|AE|JP|BD|IL|KR|TH|IR|TW|CN|ID|VN|PK|OM|UZ|LK|KG|KH|QA|SA|IQ|KZ", "PH")
			EndIf

			If GUICtrlRead($region) = "Europe" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "AT|CH|DE|DK|ES|FR|IT|LU|NL|NO|PL|SE|SI|UK|FI|OE|RU|BE|PT|GR|HU|BG|RO|CZ|YU|EE|BY|SK|UA|LT|MK|MD|LV|HR|RS|BA|AM", "AT")
			EndIf

			If GUICtrlRead($region) = "North-America" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "CA|US|MX|GT|PA|BS|CR|SV", "CA")
			EndIf

			If GUICtrlRead($region) = "Oceania" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "AU|NZ|NC", "AU")
			EndIf


			If GUICtrlRead($region) = "South-America" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "BR|CL|AR|VE", "BR")
			EndIf

			If GUICtrlRead($region) = "World" Then
				GUICtrlSetData($country, "", "")
				GUICtrlSetData($country, "No country specified", "No country specified")
				GUICtrlSetState($country, $GUI_DISABLE)
				GUICtrlSetState($selectcountry, $GUI_DISABLE)
				GUICtrlSetState($buildgps, $GUI_ENABLE)
			EndIf

		EndIf

	EndIf

	If $msg = $selectcountry Then



		If GUICtrlRead($selectcountry) = "Reset" Then
			GUICtrlSetState($country, $GUI_ENABLE)
			GUICtrlSetData($selectcountry, "Select")
			GUICtrlSetData($countrylabel, "Select a country")
			GUICtrlSetColor($countrylabel, 0xff0000)
			GUICtrlSetState($region, $GUI_DISABLE)
			GUICtrlSetState($selectregion, $GUI_ENABLE)
			GUICtrlSetState($buildgps, $GUI_DISABLE)
			GUICtrlSetState($viewgps, $GUI_DISABLE)
			GUICtrlSetState($clipboard, $GUI_DISABLE)
			GUICtrlSetState($push, $GUI_DISABLE)
		Else
			GUICtrlSetState($region, $GUI_DISABLE)
			GUICtrlSetState($selectregion, $GUI_DISABLE)
			GUICtrlSetData($selectcountry, "Reset")
			GUICtrlSetColor($countrylabel, 0x008000)
			GUICtrlSetData($countrylabel, StringLower(GUICtrlRead($country)) & ".pool.ntp.org")
			GUICtrlSetState($buildgps, $GUI_ENABLE)
		EndIf

	EndIf


	If $msg = $buildgps Then
		If FileExists(@ScriptDir & "\gps.conf") Then FileDelete(@ScriptDir & "\gps.conf")


		If GUICtrlRead($region) = "World" Then

			$write = FileWrite(@ScriptDir & "\gps.conf", "NTP_SERVER=0." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=1." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=2." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=3." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "XTRA_SERVER_1=http://xtra1.gpsonextra.net/xtra.bin" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "XTRA_SERVER_2=http://xtra2.gpsonextra.net/xtra.bin" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "XTRA_SERVER_3=http://xtra3.gpsonextra.net/xtra.bin" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_HOST=supl.google.com" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_PORT=7276" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_TLS_HOST=lbs.geo.t-mobile.com" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_TLS_CERT=/etc/SuplRootCert" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "INTERMEDIATE_POS=1" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "ACCURACY_THRES=2500" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "DEFAULT_AGPS_ENABLE=TRUE" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "DEFAULT_USER_PLANE=FALSE" & @LF)
		Else


			$write = FileWrite(@ScriptDir & "\gps.conf", "NTP_SERVER=0." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=1." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=2." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=3." & StringLower(GUICtrlRead($region)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=0." & StringLower(GUICtrlRead($country)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=1." & StringLower(GUICtrlRead($country)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=2." & StringLower(GUICtrlRead($country)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "NTP_SERVER=3." & StringLower(GUICtrlRead($country)) & ".pool.ntp.org" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "XTRA_SERVER_1=http://xtra1.gpsonextra.net/xtra.bin" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "XTRA_SERVER_2=http://xtra2.gpsonextra.net/xtra.bin" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "XTRA_SERVER_3=http://xtra3.gpsonextra.net/xtra.bin" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_HOST=supl.google.com" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_PORT=7276" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_TLS_HOST=lbs.geo.t-mobile.com" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "SUPL_TLS_CERT=/etc/SuplRootCert" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "INTERMEDIATE_POS=1" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "ACCURACY_THRES=2500" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "DEFAULT_AGPS_ENABLE=TRUE" & @LF)
			FileWriteLine(@ScriptDir & "\gps.conf", "DEFAULT_USER_PLANE=FALSE" & @LF)
		EndIf

		GUICtrlSetState($viewgps, $GUI_ENABLE)
		GUICtrlSetState($clipboard, $GUI_ENABLE)
		GUICtrlSetState($push, $GUI_ENABLE)
	EndIf

	If $msg = $viewgps Then
		_RunDos("start wordpad " & Chr(34) & @ScriptDir & "\gps.conf" & Chr(34))
	EndIf

	If $msg = $clipboard Then
		_ClipPutFile(@ScriptDir & "\gps.conf")
		MsgBox(0, "GPS Configuration", "gps.conf has been copied to the clipboard.")
	EndIf

	If $msg = $push Then
		If Not FileExists(@ScriptDir & "\gps.conf") Then
			MsgBox(16, "GPS Configurator", "ERROR: GPS.CONF NOT FOUND, CHECK DISK WRITING PERMISSIONS")
		Else
			If FileExists(@ScriptDir & "\tools\gps.conf") Then FileDelete(@ScriptDir & "\tools\gps.conf")
			FileCopy(@ScriptDir & "\gps.conf", @ScriptDir & "\tools\gps.conf")
			RunWait(@ScriptDir & "\tools\push.bat", "", @SW_SHOW)
		EndIf
	EndIf



WEnd
