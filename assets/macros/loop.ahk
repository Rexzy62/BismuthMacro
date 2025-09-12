#Requires AutoHotkey v2.0

ScriptDir := A_ScriptDir
IniDir := StrReplace(ScriptDir, "\assets\macros", "\config.ini")

loopturn := IniRead(IniDir, "Other", "loopturn", "1")

if loopturn = 1
{
    Run("AE.ahk")
} else if loopturn = 2
{
    Run("BE.ahk")
} else if loopturn = 3
{
    ; Do something when loopturn is 3
} else if loopturn = 4
{
    ; Do something when loopturn is 4
} else if loopturn = 5
{
    ; Do something when loopturn is 5
} else if loopturn = 6
{
    ; Do something when loopturn is 6
}