﻿SetTitleMatchMode 2
#SingleInstance	force; 동일 스크립트 실행시 어떻게 할지 물어봄
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t ; 마지막 부호
SetBatchLines -1

;menu,tray,Icon,icon\hot.ico,,1 
;everything 설치 확인
;menu,tray,Icon,hotkey.ico

GroupAdd Browser, ahk_class IEFrame
GroupAdd Browser, ahk_class Chrome_WidgetWin_1
GroupAdd Browser, ahk_class Chrome_WidgetWin_2
GroupAdd Browser, ahk_class MozillaWindowClass
GroupAdd Browser, ahk_class ApplicationFrameWindow

GroupAdd captha, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
GroupAdd captha, ahk_class Microsoft-Windows-Tablet-SnipperEditor
GroupAdd Mclose, ahk_class CabinetWClass
GroupAdd Mclose, ahk_class FM

;================================================================================================
; 오토핫키 제어
;================================================================================================
$#-:: Reload
$#=:: Edit
$#BS:: Edit

;================================================================================================
; 윈도우 단축키-
;================================================================================================
^!Numpad0:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
^#!Numpad0:: Shutdown, 1
; ^F1:: run, C:\nircmd.exe monitor off

$#Enter::#Tab
$#Rbutton::#Tab

$capslock:: Lbutton

$#F::
  try{
    run, C:\Program Files\Everything\Everything.exe
  }catch e{ 
    msgbox,,오류!!,"Everything" 미설치, 3
  }
return

; -----------------------------------------------------볼륨제어
$#F12::SoundSet, +1, , mute	; 볼륨 조절
$^!WheelUp::SoundSet +10	; 볼륨 조절
$^!WheelDown::SoundSet -10	; 볼륨 조절
; -----------------------------------------------------

+space::Send, {vk15sc138}	; 한영전환

+Backspace::Sendinput, +{home}{del}
$#WheelDown::#Tab
$#WheelUp::^!Tab

;계산기
$#numpad5:: run, calc.exe

;메모장
$#numpad2:: run, C:\Program Files (x86)\Notepad++\notepad++.exe


;탐색기
$#E:: Run, explorer.exe /n`,


; 스크릿샷키 맵핑 윈도우 잉크 화면스케치
$PrintScreen:: run, ms-penworkspace://Capture


;qBitTorrent
#q:: run, C:\Program Files (x86)\qBittorrent\qbittorrent.exe

~control Up::
	If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 200){
		InputBox, UserInput, Phone Number, Please enter a phone number.
		if ErrorLevel
			return
		else
			_cs_command(UserInput)
	}
return

;================================================================================================
; 윈도우 단축키끝
;================================================================================================

;===================================================
; 자동치환
;===================================================
;:*:@g::@gmail.com


;--------------------------------------------------------------------
;브라우저
;--------------------------------------------------------------------
#IfWinActive ahk_group Browser

~Shift Up::
if (A_PriorHotkey != "~Shift Up") || (A_TimeSincePriorHotkey > 200)
	return
else
	Send,^t
	
return


$F1::!Left
$F2::^+tab	;왼쪽탭으로 이동
$F3::^tab	;오른쪽탭으로 이동
$F4::^F4	;탭 닫기
$F12::^t

^left::^+tab	;왼쪽탭으로 이동
^right::^tab	;오른쪽탭으로 이동


$+WheelUp::send,{Home}
$+WheelDown::send,{End}





;Rbutton & wheelup::sendinput, ^{tab}
;Rbutton & wheeldown::sendinput, ^+{tab}



#IfWinActive
;--------------------------------------------------------------------
;브라우저 끝
;--------------------------------------------------------------------





;************************************************************************************ 
; 개인함수
;************************************************************************************ 

_cs_command( cmd ) {
	msgbox, %cmd%
}






