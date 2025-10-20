IniDir := (A_ScriptDir, "\config.ini")

Click 1415, 295, 0
Sleep 100
Click 1414, 295, 0
Sleep 100
Click "Left", 1

; === Get the user's "Pictures\Screenshots" folder ===
picturesPath := ComObject("Shell.Application").NameSpace(0x27).Self.Path
screenshotDir := picturesPath "\Screenshots"

; === Target directory inside the script's folder ===
targetDir := A_ScriptDir "\screens"
targetFile := targetDir "\PotionStorage.png"

; === Create the target folder if it doesn't exist ===
if !DirExist(targetDir)
    DirCreate(targetDir)

; === Find the most recent .png file in the screenshot folder ===
latestFile := ""
latestTime := 0

Loop Files screenshotDir "\*.png", "F" {
    if A_LoopFileTimeModified > latestTime {
        latestTime := A_LoopFileTimeModified
        latestFile := A_LoopFilePath
    }
}

; === M ove and rename the file if found ===
if latestFile {
    FileMove(latestFile, targetFile, true) ; true = overwrite if exists
     
} else {
     
} 
 
F2::ExitApp()

turn := IniRead(IniDir, "Turn", "R", "4")

turn := 4
IniWrite(turn, IniDir, "Turn", "R")
Run("CAllign.ahk")
ExitApp()