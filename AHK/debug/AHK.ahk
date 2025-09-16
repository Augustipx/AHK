; ==============================================================
; 键盘映射工具 v4.2.4
; 功能：Win/CapsLock 切换映射模式
; ==============================================================
#Requires AutoHotkey v2.0
#SingleInstance Force
A_MenuMaskKey := "vkE8"

; ===================== 系统初始化 =================================
startupLink := A_Startup "\AHK.lnk"
if !FileExist(startupLink)
    FileCreateShortcut(A_ScriptFullPath, startupLink)

; ===================== 常驻映射 ====================================
*Browser_Back::Delete
*Browser_Refresh::F2
*PrintScreen::F5
SetCapsLockState "AlwaysOff"

; ===================== 注册表处理 ====================================
RegKey := "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout"
ValueName := "Scancode Map"
correctMap :=
    "00000000" .
    "00000000" .
    "03000000" .
    "5BE038E0" . ;RAlt -> LWin
    "3A005BE0" . ;LWin -> CapsLk
    "00000000"
if (RegRead(RegKey, ValueName, "REG_BINARY") != correctMap) {
    RegWrite(correctMap, "REG_BINARY", RegKey, ValueName)
}
;;恢复注册表
; RegDelete("HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout", "Scancode Map")
; MsgBox("已删除所有键位映射。`n请重启电脑生效。", "注册表已恢复", "Iconi")

; ===================== 按键键映射处理 ===========================
CapsLock:: SendEvent "{Esc}"
CapsLock & a::#a
CapsLock & b::#b
CapsLock & d::#d
CapsLock & e::#e
CapsLock & f::#f
CapsLock & g::#g
CapsLock & h::#h
CapsLock & i::#i
CapsLock & j::#j
CapsLock & k::#k
CapsLock & m::#m
CapsLock & n::#n
CapsLock & o::#o
CapsLock & p::#p
CapsLock & q::#q
CapsLock & r::#r
CapsLock & s::#s
CapsLock & t::#t
CapsLock & u::#u
CapsLock & v::#v
CapsLock & w::#w
CapsLock & x::#x
CapsLock & y::#y
CapsLock & z::#z
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
CapsLock & [::#[
CapsLock & ]::#]
CapsLock & \::#\
CapsLock & `;::#`;
CapsLock & '::#'
CapsLock & ,::#,
CapsLock & .::#.
CapsLock & /::#/
CapsLock & `::Insert
CapsLock & Up::PgUp
CapsLock & Left::Home
CapsLock & Right::End
CapsLock & Down::PgDn
CapsLock & Esc::#Esc
CapsLock & Enter::^+Esc
CapsLock & BackSpace::Delete
CapsLock & c::CapsLock
CapsLock & L::
{
    KeyWait("L")
    KeyWait("CapsLock")
    DllCall("LockWorkStation")
}
CapsLock & Tab:: {
    if GetKeyState("Shift", "P") {
        Send "{Ctrl Down}{Shift Down}{Tab Down}"
        KeyWait "Tab"
        Send "{Tab Up}{Shift Up}{Ctrl Up}"
    } else {
        Send "{Ctrl Down}{Tab Down}"
        KeyWait "Tab"
        Send "{Tab Up}{Ctrl Up}"
    }
}
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