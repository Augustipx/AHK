; ==============================================================
; 键盘映射工具 v5.0.0
; 功能：Win/CapsLock 映射
; ==============================================================
#Requires AutoHotkey v2.0
#SingleInstance Force
A_MenuMaskKey := "vkE8"
; ===================== 系统初始化 =================================
startupLink := A_Startup "\AHK.lnk"
if !FileExist(startupLink)
    FileCreateShortcut(A_ScriptFullPath, startupLink)

; ===================== 常驻映射 ====================================
SetCapsLockState "AlwaysOff"
*Browser_Back::Delete
*Browser_Refresh::F2
*PrintScreen::F5

CapsLock:: SendEvent "{Esc}"
CapsLock & a::#a
CapsLock & d::#d
CapsLock & e::#e
CapsLock & i::#i
CapsLock & r::#r
CapsLock & t::#t
CapsLock & v::#v
CapsLock & x::#x
CapsLock & 1::F1
CapsLock & 2::F2
CapsLock & 3::F3
CapsLock & 4::F4
CapsLock & 5::F5
CapsLock & 6::F6
CapsLock & 7::F7
CapsLock & 8::F8
CapsLock & 9::F9
CapsLock & 0::F10
CapsLock & -::F11
CapsLock & =::F12
CapsLock & Up::PgUp
CapsLock & `::Insert
CapsLock & Left::Home
CapsLock & Right::End
CapsLock & Down::PgDn
CapsLock & c::CapsLock
CapsLock & Enter::^+Esc
CapsLock & BackSpace::Delete

#1::F1
#2::F2
#3::F3
#4::F4
#5::F5
#6::F6
#7::F7
#8::F8
#9::F9
#0::F10
#-::F11
#=::F12
#Up::PgUp
#`::Insert
#Down::PgDn
#Right::End
*#Left::Home
#Enter::^+Esc
#c::CapsLock
~LWin:: Send "{Blind}{vkE8}"
~LWin Up::
{
    if (A_PriorKey = "LWin")
        Send "{Esc}"
}
~LAlt Up::
{
    if (A_PriorKey = "LAlt")
        Send "{LWin}"
}