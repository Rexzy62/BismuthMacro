#Requires AutoHotkey v2.0
#SingleInstance force

WinActivate("Roblox")
Sleep(333)

scriptPath := A_ScriptDir

SplitPath scriptPath, , &parentPath

iniPath := parentPath
SplitPath iniPath, , &iniPath

CPath := iniPath "\config.ini"

AuraEnable := IniRead(CPath, "Main", "AuraEnable", 1)
Msgbox AuraEnable

if AuraEnable != "0" {
    Aura := IniRead(CPath, "Main", "Aura", "None")

    Sleep(333)
    MouseMove(52, 400)
    Sleep(100)
    MouseMove(52, 390)
    Sleep(100)
    MouseClick("Left")
    Sleep(700)
    MouseMove(1264, 370)
    MouseMove(1252, 370)
    Sleep(500)
    MouseClick("Left")
    Sleep(700)
    Send(Aura)
    Sleep(100)
    MouseMove(1100, 450)
    MouseMove(1104, 450)
    Loop 10 {
        Send("{WheelUp}")
        Sleep(10)
    }
    Sleep(400)
    MouseClick("Left")
    Sleep(400)
    MouseMove(800, 640)

    x := 800
    y := 853

    color := PixelGetColor(x, y, "RGB")

    targetColor := 0x7BFA6F

    if (color = targetColor) {
        MouseMove(784, 640)
        MouseClick("Left")
        Sleep(1000)
        MouseMove(1892, 300)
        MouseMove(1904, 300)
        MouseClick("Left")
        Run "\CAllign.ahk"
        ExitApp()
    } else {
        MouseMove(1892, 300)
        MouseMove(1904, 300)
        MouseClick("Left")
        Run "\CAllign.ahk"
        ExitApp()
    }

} else {
    Run "\CAllign.ah"
    Msgbox "Hey"
    ExitApp()
}
