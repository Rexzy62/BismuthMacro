#Requires AutoHotkey v2.0
ScriptDir := A_ScriptDir
IniDir := StrReplace(ScriptDir, "\assets\macros", "\config.ini")

PSLink := IniRead(IniDir, "Other", "PSLink", "Nothing")

WinActivate "Roblox"
WinClose "Roblox"
Sleep 1000
Run PSLink

Sleep 60000

for browser in ["chrome.exe", "msedge.exe", "firefox.exe", "opera.exe", "brave.exe"]
    RunWait "taskkill /F /IM " browser, , "Hide"

WinActivate "Roblox"