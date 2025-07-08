#Requires AutoHotkey v2.0
#SingleInstance Force
	
	myGui := Gui()
	myGui.Add("Text", "x16 y138 w117 h2 +0x10")


	DU := myGui.Add("CheckBox", "x16 y40 w120 h23", "Detect Unique")
	DL := myGui.Add("CheckBox", "x16 y72 w120 h23", "Detect Legendary")
	DM := myGui.Add("CheckBox", "x16 y104 w120 h23", "Detect Mythic")
	DE := myGui.Add("CheckBox", "x16 y152 w120 h23", "Detect Exalted")
	DG := myGui.Add("CheckBox", "x16 y184 w120 h23", "Detect Glorius")
	TD := myGui.Add("CheckBox", "x16 y216 w120 h23", "Detect Transendant")
	EP := myGui.Add("CheckBox", "x168 y152 w119 h23", "Allow Pings")
	GP := myGui.Add("CheckBox", "x168 y184 w119 h23", "Allow Pings")
	TP := myGui.Add("CheckBox", "x168 y216 w119 h23", "Allow Pings")

	AllowOtherT := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "AllowOtherT", "1")


	DU.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "DU", "0")
	DL.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "DL", "0")
	DM.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "DM", "0")
	DE.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "DE", "0")
	DG.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "DG", "0")
	TD.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "TD", "0")
	EP.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "EP", "0")
	GP.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "GP", "0")
	TP.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "TP", "0")
	

    SB := myGui.Add("StatusBar", , "made by: Rexzy61")
    if AllowOtherT := 0
	{

    AllowOther := myGui.Add("Button", "x136 y41 w80 h85", "I allow to be Ping Spammed")
	UP := myGui.Add("CheckBox", "x168 y40 w119 h23", "Allow Pings")
	UP.Visible := false
    LP := myGui.Add("CheckBox", "x168 y72 w119 h23", "Allow Pings")
	LP.Visible := false
    MP := myGui.Add("CheckBox", "x168 y104 w119 h23", "Allow Pings")
    MP.Visible := false    
	AllowOther.OnEvent("Click", (*) => OtherPingAllow())
	
	} else {

	UP := myGui.Add("CheckBox", "x168 y40 w119 h23", "Allow Pings")
    LP := myGui.Add("CheckBox", "x168 y72 w119 h23", "Allow Pings")
    MP := myGui.Add("CheckBox", "x168 y104 w119 h23", "Allow Pings")
	SB.Text := "made by: Rexzy61, Other Pings Allowed."
	
	}
	

	UP.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "UP", "0")
	LP.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "LP", "0")
	MP.Value := IniRead( A_ScriptDir "\StarConfig.ini", "Settings", "MP", "0")


    
	OtherPingAllow() {
		UP.Visible := true
		LP.Visible := true
		MP.Visible := true
		AllowOther.Visible := false
		SB.Text := "made by: Rexzy61, Other Pings Allowed."
		AllowOtherT := 1
		IniWrite(AllowOtherT, A_ScriptDir "\StarConfig.ini", "Settings", "AllowOtherT")
	}
    
    DU.OnEvent("Click", (*) => IniWrite(DU.Value, A_ScriptDir "\StarConfig.ini", "Settings", "DU",))
	DL.OnEvent("Click", (*) => IniWrite(DL.Value, A_ScriptDir "\StarConfig.ini", "Settings", "DL",))
	DM.OnEvent("Click", (*) => IniWrite(DM.Value, A_ScriptDir "\StarConfig.ini", "Settings", "DM",))
	DE.OnEvent("Click", (*) => IniWrite(DE.Value, A_ScriptDir "\StarConfig.ini", "Settings", "DE",))
	DG.OnEvent("Click", (*) => IniWrite(DG.Value, A_ScriptDir "\StarConfig.ini", "Settings", "DG",))
	TD.OnEvent("Click", (*) => IniWrite(TD.Value, A_ScriptDir "\StarConfig.ini", "Settings", "TD",))
	EP.OnEvent("Click", (*) => IniWrite(EP.Value, A_ScriptDir "\StarConfig.ini", "Settings", "EP",))
	GP.OnEvent("Click", (*) => IniWrite(GP.Value, A_ScriptDir "\StarConfig.ini", "Settings", "GP",))
	TP.OnEvent("Click", (*) => IniWrite(TP.Value, A_ScriptDir "\StarConfig.ini", "Settings", "TP",))
	UP.OnEvent("Click", (*) => IniWrite(UP.Value, A_ScriptDir "\StarConfig.ini", "Settings", "UP",))
	LP.OnEvent("Click", (*) => IniWrite(LP.Value, A_ScriptDir "\StarConfig.ini", "Settings", "LP",))
	MP.OnEvent("Click", (*) => IniWrite(MP.Value, A_ScriptDir "\StarConfig.ini", "Settings", "MP",))


    mygui.title := "Star Config"
    myGui.Show("w400 h300")