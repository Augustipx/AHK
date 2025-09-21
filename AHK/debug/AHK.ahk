; ==============================================================
; 键盘映射工具 v4.6.0
; 功能：Win/CapsLock 切换映射模式
; ==============================================================
#Requires AutoHotkey v2.0
#SingleInstance Force

; ===================== 系统初始化 =================================
oldStartupLink := A_Startup "\AHK_2.lnk"
if FileExist(oldStartupLink)
    FileDelete(oldStartupLink)

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
;恢复注册表
; try {
;     currentValue := RegRead(RegKey, ValueName, "REG_BINARY")
;     if (currentValue = correctMap) {
;         RegDelete(RegKey, ValueName)
;         MsgBox("已删除键位映射。`n请重启电脑生效。", "注册表已更新", "Iconi")
;     }
; } catch {
; }

; ===================== CapsLock键映射处理 ===========================
CapsLock:: SendEvent "{Esc}"
CapsLock & a::#a
CapsLock & e::#e
CapsLock & i::#i
CapsLock & r::#r
CapsLock & s::#s
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