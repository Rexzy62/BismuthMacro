#Requires AutoHotkey v2.0
scriptPath := A_ScriptDir

SplitPath scriptPath, , &parentPath

; ahh it took me too long to figure this out
iniPath := parentPath
SplitPath iniPath, , &iniPath

CPath := iniPath "\config.ini"


ObbyDo := IniRead(CPath, "Main", "ObbyDo", 0)

if ObbyDo != 0
{
    WinActivate "Roblox"
    Sleep 300


} 

