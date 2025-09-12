#Requires AutoHotkey v2.0

ScriptDir := A_ScriptDir
IniDir := (ScriptDir, "\config.ini")

turn := IniRead(IniDir, "Other", "R", "1")
if turn = 1
{
    Run("AE.ahk")
    ExitApp()
} else if turn = 2
{
    Run("ClaimQuests.ahk")
    ExitApp()
} else if turn = 3
{
    Run("GauntletStorage.ahk")
    ExitApp()
} else if turn = 4
{
    Run("PotionStorage.ahk")
    ExitApp()
} else if turn = 5
{
    Run("QuestProgress.ahk")
    ExitApp()
} else if turn = 6
{
    ;Run(".ahk")
    ExitApp()
}

F2::ExitApp()