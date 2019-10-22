#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=C:\WINDOWS\System32\SHELL32.dll
#PRE_Compression=4
#PRE_UseX64=n
#PRE_Res_Comment=给你自动化的程序安装体验。
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_LegalCopyright=...
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****

FileInstall('AppName.ini', 'temp\AI_AppName.ini')           ; 释放配置文件到系统临时文件夹
$work_path = @ScriptDir            ; 工作目录

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <GuiStatusBar.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Opt('GUIOnEventMode', 1)

#Region ### START Koda GUI section ### Form=f:\my\office_table\program\autoit\autoinstaller\auto_installer.kxf
$Form1 = GUICreate("Auto Installer  by  ...", 501, 381, 386, 393)
GUISetBkColor(0xC8C8C8)
$Label1 = GUICtrlCreateLabel("工作目录", 16, 84, 52, 17)
$Input1 = GUICtrlCreateInput($work_path, 72, 82, 289, 21)
$Button_SetPath = GUICtrlCreateButton("...", 360, 81, 35, 23)
$Button_Find = GUICtrlCreateButton("查找", 405, 80, 75, 25)
$Pic1 = GUICtrlCreatePic("", 105, 10, 290, 60)
$ListBox1 = GUICtrlCreateList("", 20, 152, 209, 201)
$Button3 = GUICtrlCreateButton(">", 234, 191, 30, 25)
$Button4 = GUICtrlCreateButton(">>", 234, 224, 31, 25)
$Button5 = GUICtrlCreateButton("<", 234, 257, 31, 25)
$Button6 = GUICtrlCreateButton("<<", 233, 290, 32, 25)
$ListBox2 = GUICtrlCreateList("", 270, 152, 209, 201)
$Label2 = GUICtrlCreateLabel("已找到的文件", 86, 120, 76, 17)
$Label3 = GUICtrlCreateLabel("待安装的文件", 336, 120, 76, 17)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
Dim $StatusBar1_PartsWidth[3] = [66, 366, -1]
_GUICtrlStatusBar_SetParts($StatusBar1, $StatusBar1_PartsWidth)
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "消息日志:", 0)
_GUICtrlStatusBar_SetText($StatusBar1, "", 1)
_GUICtrlStatusBar_SetText($StatusBar1, @TAB & "0000-00-00  00:00:00", 2)
$Button_DoIt = GUICtrlCreateButton("Do It", 212, 120, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	_GUICtrlStatusBar_SetText($StatusBar1, @TAB & Date() & '  ' & Time(), 2)
	Sleep(1000)
WEnd

;~ While 1
;~ 	$doit = False
;~ 	$nMsg = GUIGetMsg()
;~ 	Switch $nMsg
;~ 		Case $GUI_EVENT_CLOSE
;~ 			Exit
;~ 		Case $Button_SetPath
;~ 			$work_path = FileSelectFolder('选择安装程序目录', '')
;~ 			If FileExists($work_path) Then
;~ 				GUICtrlSetData($Input1, $work_path)
;~ 				_GUICtrlStatusBar_SetText($StatusBar1, Time() & ':设置工作路径：' & $work_path, 1)
;~ 				FileChangeDir($work_path)
;~ 			Else
;~ 				MsgBox(64, '提示', '信息：无效的路径，请重新选择！')
;~ 			EndIf

;~ 	EndSwitch
;~ WEnd

Func Time()
	Local $time = @HOUR & ':' & @MIN & ':' & @SEC
	Return $time
EndFunc

Func Date()
	Local $date = @YEAR & '-' & @MON & '-' & @MDAY
	Return $date
EndFunc

;~ Func FindAllFile($FolderDir)
;~ 	Local $file = FileOpen('temp\log.temp', 10)
;~ 	If $file = -1 Then
;~ 		MsgBox(64, '错误', '缓存文件打开失败！')
;~ 		Exit
;~ 	EndIf
;~ 	Local $hSearch = FileFindFirstFile($FolderDir & '\*.*')
;~ 	; 检查搜索是否成功
;~ 	If $hSearch = -1 Then Return 0
;~ 	While 1
;~ 		Local $sFile = FileFindNextFile($hSearch)
;~ 		If @error Then ExitLoop
;~ 		
;~ 		If @extended Then 
;~ 			FindAllFile($FolderDir & "\" & $sFile)
;~ 			ContinueLoop
;~ 		EndIf
;~ 		FileWriteLine($file, Time() & ':找到文件:' & $FolderDir & "\" & $sFile)
;~ 	WEnd
;~ 	; 关闭句柄
;~ 	FileClose($hSearch)
;~ 	FileClose($file)
;~ EndFunc
