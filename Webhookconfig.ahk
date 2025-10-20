#Requires AutoHotkey v2.0
#SingleInstance Force
CPath := A_ScriptDir "\config.ini"

webhooklink := IniRead(CPath, "Main2", "webhooklink", "https://discord.com/api/webhooks/...")
discorduserid := IniRead(CPath, "Main2", "discorduserid", "discord user id")

myGui := Gui()
	myGui.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop -Theme")

	webhooklink := myGui.Add("Edit", "x10 y25 w385 h20", "https://discord.com/api/webhooks/...")
    webhooklink.OnEvent("Change", (*) => IniWrite(webhooklink.Value, CPath, "Main2", "webhooklink"))
	discorduserid := myGui.Add("Edit", "x10 y50 w190 h20", "discord user id")
	discorduserid.OnEvent("Change", (*) => IniWrite(discorduserid.Value, CPath, "Main2", "discorduserid"))

    myGui.Add("Text", "x8 y0 w120 h23 +0x200", "Webhook Settings")
    myGui.Add("Link", "x8 y80 w127 h15", "<a href=`"https://www.youtube.com/watch?v=fKksxz2Gdnc`">Discord Webhook Tutorial</a>")
	myGui.Add("Link", "x264 y80 w127 h15", "<a href=`"https://www.youtube.com/watch?v=mc3cV57m3mM`">User ID Tutorial</a>")
	
    myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "BismuthMacro Extra Settings"
	
	
myGui.Show("w400 h100 x+0 y+0")