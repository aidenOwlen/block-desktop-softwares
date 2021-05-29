;★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  Fiverr-HarshKohli  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
;*************************************************************************** [DISABLER] ************************************************************************************************
;MAIN FILE !

;[PART 1]Begin****
;You don't have to understand this part, these are some packages we need to include.
;~~~~~~~~~~~~~~~~INCLUDES~~~~~~~~~~~~~~~~~~~~~
#include<WindowsConstants.au3> ;~~~~~~~~~~~~~~ For some windows constants
#include<GuiConstantsEx.au3>   ;~~~~~~~~~~~~~~ For some gui constants ( to have a beautiful interface )
#include<StaticConstants.au3>  ;~~~~~~~~~~~~~~ Not important
#include<MsgBoxConstants.au3>  ;~~~~~~~~~~~~~~ For some msgs styles
#include<EditConstants.au3>    ;~~~~~~~~~~~~~~ For Edit texts
#include<FileConstants.au3>    ;~~~~~~~~~~~~~~ To manipulate files
#include<File.au3>             ;~~~~~~~~~~~~~~ To manipulate files
#include<StringConstants.au3>  ;~~~~~~~~~~~~~~ To add informations to database (EOF)
#include<ColorConstants.au3>   ;~~~~~~~~~~~~~~ For Color constants
#include<FontConstants.au3>    ;~~~~~~~~~~~~~~ For Writing styles
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;[PART 1]End****

Opt("GuiOnEventMode", 1)

;[PART 2]Begin****
;We are creating the interface here, with its buttons and stuff
$Gui = GuiCreate("                                                                                DISABLER CREATOR", 700, 500)
GuiSetOnEvent($GUI_EVENT_CLOSE, "fermer")
$Combo = GuiCtrlCreateCombo("TeamViewer", 260, 100, 180, 200)
$ButtonAdd = GuiCtrlCreateButton("Add a program", 290, 430, 150, 60)
GuiCtrlSetFont(-1, 10, $FW_EXTRABOLD)
GuiCtrlSetColor(-1, $COLOR_RED)
GuiCtrlCreatePic(@DESKTOPDIR & "\piccc.jpg", 0, 0, 700, 500)
GuiCtrlCreateCombo("TeamViewer", 260, 100, 180, 200)
GuiCtrlSetData($Combo, "Skype|BitTorrent|uTorrent|Ccleaner|Idm|Acrobat Reader|Itunes|VLC")
GuiCtrlCreateLabel("Disabled programs by default", 242, 70, 210)
GuiCtrlSetBkColor(-1, $COLOR_BLACK)
GuiCtrlSetColor(-1, $COLOR_WHITE)
GuiCtrlSetFont(-1, 10, $FW_EXTRABOLD)
GuiCtrlCreateButton("Add a program", 290, 430, 150, 60)
GuiCtrlSetFont(-1, 10, $FW_EXTRABOLD)
GuiCtrlSetColor(-1, $COLOR_RED)
$progress = GuiCtrlCreateProgress(0, 390, 700, 30)
;[PART 2]End****




;[PART 4]Begin***
;We show/hide buttons and gui
GuiSetState(@SW_SHOW, $Gui)
GuiCtrlSetState($progress, $GUI_HIDE)
;[PART 4]End***

;[PART 5]Begin****
;We set functions.
GuiCtrlSetOnEvent($ButtonAdd, "boutonadd")
;[PART 5]End****


;Part[6]
While 1
   Sleep(200)
Wend

;[PART7]
;Functions
Func boutonadd()
   Global $dilimiter = "*"
   $input1 = inputbox("Write process here", "Write the process of the program you want to add here" & @CRLF & "For example : Teamviewer.exe" & @CRLF & "Please be sure to write it correctly")
   If @ERROR then
	  _Ex()
   Else
   $open = FileOpenDialog("Please ping me to your disabler", @DESKTOPDIR, "(*.exe)")
   If @ERROR then
	  _Ex()
   Else
   GuiCtrlSetState($progress, $GUI_SHOW)
   sleep(1000)
	  For $i = 0 to 100
		 sleep(40)
	  GuiCtrlSetData($progress, $i)
	  If $i = 100 then msgbox($MB_OK, "Success", "Program added in : " & $open)
	  Next
	  FileWrite($open, _DO($input1 & $dilimiter))
   EndIf
   EndIF
EndFunc



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func _Ex()                              ;
   sleep(200)                           ;
EndFunc                                 ;
                                        ;
;---------------------------------------;
                                        ;
Func _DO($EOF)                          ;
   $reverse = stringReverse($EOF)       ;
   Return $reverse                      ;                                 FUNCTIONS
EndFunc                                 ;
                                        ;
;---------------------------------------;
                                        ;
Func fermer()                           ;
   Exit                                 ;
EndFunc                                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;










