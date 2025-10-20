#Requires AutoHotkey v2.0
#SingleInstance Force
; Create a hotkey to exit the script (e.g., F1)
F1::ExitApp

; Start an infinite loop
Loop {
    ; Get the current X and Y coordinates of the mouse
    MouseGetPos(&x, &y)
    
    ; Display the coordinates in a tooltip near the cursor
    ToolTip("X: " x "`nY: " y)
    
    ; Pause for 100 milliseconds to reduce CPU usage
    Sleep(10)
}
