SetTitleMatchMode 2
#SingleInstance	force; 동일 스크립트 실행시 어떻게 할지 물어봄
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t ; 마지막 부호
SetBatchLines -1

;menu,tray,Icon,icon\hot.ico,,1 
;everything 설치 확인
;menu,tray,Icon,hotkey.ico

GroupAdd Browser, ahk_exe iexplore.exe ; 익스플로러
GroupAdd Browser, ahk_exe firefox.exe ;파이어폭스
GroupAdd Browser, ahk_exe chrome.exe ;크롬
GroupAdd Browser, ahk_exe ApplicationFrameHost.exe ;엣지

;================================================================================================
; 오토핫키 제어
;================================================================================================
$#F12:: Reload
$#F11:: Edit

;================================================================================================
; 윈도우 단축키-
;================================================================================================

; Alt + F4 path
$!`::!F4

; 절전모드
^!Numpad0:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
; 전원종료
^#!Numpad0:: Shutdown, 1

$#Enter::#Tab
$#Rbutton::#Tab

$#F::
  try{
    run, C:\Program Files\Everything\Everything.exe
  }catch e{ 
    msgbox,,오류!!,"Everything" 미설치, 3
  }
return

; -----------------------------------------------------볼륨제어
$^!WheelUp::SoundSet +10	; 볼륨 조절
$^!WheelDown::SoundSet -10	; 볼륨 조절
; -----------------------------------------------------


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



;===================================================
; 브라우저 그룹 단축키 ( 크롬, 엣지, 익스플로러)
;===================================================
#IfWinActive ahk_group Browser

~Shift Up::
if (A_PriorHotkey != "~Shift Up") || (A_TimeSincePriorHotkey > 200)
	return
else
	Sendinput,^t
return

$F1::!Left  ;뒤로가기
$F2::^+tab	;왼쪽탭으로 이동
$F3::^tab	;오른쪽탭으로 이동
$F4::^F4	;탭 닫기

$+WheelUp::send,{Home}
$+WheelDown::send,{End}

#IfWinActive
;--------------------------------------------------------------------
;브라우저 끝
;--------------------------------------------------------------------