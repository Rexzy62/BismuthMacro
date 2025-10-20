#Requires AutoHotkey v2.0+
#SingleInstance Force

	DoObby := IniRead(A_ScriptDir "\Config.ini", "Main", "DoObby", "0")
	ClaimQuests := IniRead(A_ScriptDir "\Config.ini", "Main", "ClaimQuests", "0")
	CollectResonance := IniRead(A_ScriptDir "\Config.ini", "Main", "CollectResonance", "0")
	CollectItems := IniRead(A_ScriptDir "\Config.ini", "Main", "CollectItems", "0")
	AuraName := IniRead(A_ScriptDir "\Config.ini", "Main", "AuraName", "Aura Name")
	EnableAutoEquip := IniRead(A_ScriptDir "\Config.ini", "Main", "EnableAutoEquip", "0")
	CraftEnable := IniRead(A_ScriptDir "\Config.ini", "Crafting", "CraftEnable", "0")
	StarOwned := IniRead(A_ScriptDir "\Config.ini", "Crafting", "StarOwned", "0")
	Slot1 := IniRead(A_ScriptDir "\Config.ini", "Crafting", "Slot1", "Select Potion	")
	Slot2 := IniRead(A_ScriptDir "\Config.ini", "Crafting", "Slot2", "Select Potion")
	Slot3 := IniRead(A_ScriptDir "\Config.ini", "Crafting", "Slot3", "Select Potion")
	TestRun := IniRead(A_ScriptDir "\Config.ini", "Detection", "TestRun", "0")
	BiomeDetection := IniRead(A_ScriptDir "\Config.ini", "Detection", "BiomeDetection", "0")
	ConfigBiomes := IniRead(A_ScriptDir "\Config.ini", "Detection", "ConfigBiomes", "0")
	AuraDetection := IniRead(A_ScriptDir "\Config.ini", "Detection", "AuraDetection", "0")
	ConfigAura := IniRead(A_ScriptDir "\Config.ini", "Detection", "ConfigAura", "0")
	MerchantDetection := IniRead(A_ScriptDir "\Config.ini", "Detection", "MerchantDetection", "0")
	ConfigMerchant := IniRead(A_ScriptDir "\Config.ini", "Detection", "ConfigMerchant", "0")
	SendScreenshots := IniRead(A_ScriptDir "\Config.ini", "Detection", "SendScreenshots", "0")
	WebhookConfig := IniRead(A_ScriptDir "\Config.ini", "Detection", "WebhookConfig", "0")
	RestartRoblox := IniRead(A_ScriptDir "\Config.ini", "Misc", "RestartRoblox", "0")
	Edit2 := IniRead(A_ScriptDir "\Config.ini", "Misc", "Edit2", "Private Server Link")
	AltLoop := IniRead(A_ScriptDir "\Config.ini", "Misc", "AltLoop", "0")
	DailyShop := IniRead(A_ScriptDir "\Config.ini", "Misc", "DailyShop", "0")
	ItemUsing := IniRead(A_ScriptDir "\Config.ini", "Misc", "ItemUsing", "0")
	ConfigItemUsing := IniRead(A_ScriptDir "\Config.ini", "Misc", "ConfigItemUsing", "0")

CPath := A_ScriptDir "\config.ini"

myGui := Gui()
	myGui.Opt("-Theme")
	Tab := myGui.Add("Tab3", "x0 y0 w348 h271 +Buttons", ["Main", "Crafting", "Detection", "Misc", "Credits"])
	
	Tab.UseTab(1)
	
    myGui.Add("Text", "x8 y144 w200 h2 +0x10")
    ;myGui.Add("Text", "x24 y120 w14 h23 +0x200", "↪")
    myGui.Add("GroupBox", "x8 y216 w196 h42")
    myGui.Add("Text", "x101 y228 w15 h23 +0x200", "or")

    ;DoObby := myGui.Add("CheckBox", "x16 y32 w62 h23", "Do Obby")
	;DoObby.OnEvent("click", (*) => IniWrite(DoObby, CPath, "Main", "DoObby"))


	ClaimQuests := myGui.Add("CheckBox", "x16 y64 w81 h23", "Claim Quests")
	ClaimQuests.OnEvent("click", (*) => IniWrite(ClaimQuests.Value, CPath, "Main", "ClaimQuests"))

	;CollectResonance := myGui.Add("CheckBox", "x16 y96 w173 h23", "Collect Resonance of Elements")
	;CollectResonance.OnEvent("click", (*) => IniWrite(CollectResonance, CPath, "Main", "CollectResonance"))

	;CollectItems := myGui.Add("CheckBox", "x40 y120 w80 h23", "Collect Items")
	;CollectItems.OnEvent("click", (*) => IniWrite(CollectItems, CPath, "Main", "CollectItems"))

	;AuraName := myGui.Add("Edit", "x16 y184 w120 h21", "Aura Name")
	;AuraName.OnEvent("Change", (*) => IniWrite(AuraName.Value, CPath, "Main", "AuraName"))

	
	EnableAutoEquip := myGui.Add("CheckBox", "x16 y152 w108 h23", "Enable Auto Equip")
	EnableAutoEquip.OnEvent("click", (*) => IniWrite(EnableAutoEquip.Value, CPath, "Main", "EnableAutoEquip"))

	Export := myGui.Add("Button", "x16 y227 w57 h23", "Export")
	Import := myGui.Add("Button", "x141 y228 w59 h23", "Import")
	
    Tab.UseTab(2)
	
	;myGui.Add("Text", "x16 y88 w66 h23 +0x200", "Potion Slot 1:")
	;myGui.Add("Text", "x16 y120 w66 h23 +0x200", "Potion Slot 2:")
	;myGui.Add("Text", "x16 y152 w65 h23 +0x200", "Potion Slot 3:")
	myGui.Add("Text", "x32 y248 w341 h23 +0x200", "Coming With V1.1! Stay tuned :)")
	
	;CraftEnable := myGui.Add("CheckBox", "x16 y32 w126 h23", "Enable Potion Crafting")
	;CraftEnable.OnEvent("click", (*) => IniWrite(CraftEnable, CPath, "Crafting", "CraftEnable"))

	;StarOwned := myGui.Add("CheckBox", "x16 y56 w120 h23", "Star Owned?")
	;StarOwned.OnEvent("click", (*) => IniWrite(StarOwned, CPath, "Crafting", "StarOwned"))

	;Slot1 := myGui.Add("DropDownList", "x88 y88 w120", ["DropDownList", "", ""])
	;Slot1.OnEvent("Change", (*) => IniWrite(Slot1, CPath, "Crafting", "Slot1"))
	
	;Slot2 := myGui.Add("DropDownList", "x88 y120 w120", ["DropDownList", "", ""])
	;Slot2.OnEvent("Change", (*) => IniWrite(Slot2, CPath, "Crafting", "Slot2"))

	;Slot3 := myGui.Add("DropDownList", "x88 y152 w120", ["DropDownList", "", ""])
	;Slot3.OnEvent("Change", (*) => IniWrite(Slot3, CPath, "Crafting", "Slot3"))

	Tab.UseTab(3)
	
	TestRun := myGui.Add("Button", "x232 y234 w109 h31", "Run Webhook Test")
	TestRun.OnEvent("click", (*) => Run(A_ScriptDir "\assets\WebhookTest.pyw"))

	BiomeDetection := myGui.Add("CheckBox", "x16 y32 w135 h23", "Enable Biome Detection")
	BiomeDetection.OnEvent("click", (*) => IniWrite(BiomeDetection.Value, CPath, "Detection", "BiomeDetection"))

	ConfigBiomes := myGui.Add("Button", "x48 y56 w80 h23", "Config")
	ConfigBiomes.OnEvent("click", (*) => Run("BiomeConfig.pyw"))

	;AuraDetection := myGui.Add("CheckBox", "x16 y80 w138 h23", "Enable Aura Detection")
	;AuraDetection.OnEvent("click", (*) => IniWrite(AuraDetection, CPath, "Detection", "AuraDetection"))

	;ConfigAura := myGui.Add("Button", "x48 y104 w80 h23", "Config")
	;ConfigAura.OnEvent("click", (*) => Run("AuraConfig.pyw"))

	;MerchantDetection := myGui.Add("CheckBox", "x16 y136 w151 h23", "Enable Merchant Detection")
	;MerchantDetection.OnEvent("click", (*) => IniWrite(MerchantDetection, CPath, "Detection", "MerchantDetection"))

	;ConfigMerchant := myGui.Add("Button", "x48 y160 w80 h23", "Config")
	;ConfigMerchant.OnEvent("click", (*) => Run("MerchantConfig.pyw"))

	SendScreenshots := myGui.Add("CheckBox", "x16 y240 w120 h23", "Send Screenshots")
	SendScreenshots.OnEvent("click", (*) => IniWrite(SendScreenshots.Value, CPath, "Detection", "SendScreenshots"))
	
	WebhookConfig := myGui.Add("Button", "x8 y208 w118 h23", "Edit Webhook Config")
	WebhookConfig.OnEvent("click", (*) => Run("WebhookConfig.ahk"))
	
	Tab.UseTab(4)

	myGui.Add("Text", "x16 y88 w317 h2 +0x10")

	;RestartRoblox := myGui.Add("CheckBox", "x16 y32 w142 h23", "Enable Roblox Restarting")
	;RestartRoblox.OnEvent("click", (*) => IniWrite(RestartRoblox, CPath, "Misc", "RestartRoblox"))

	PSLink := myGui.Add("Edit", "x8 y56 w333 h21", "Private Server Link")
	PSLink.OnEvent("Change", (*) => IniWrite(PSLink, CPath, "Main2", "pslink"))

	;AltLoop := myGui.Add("CheckBox", "x16 y96 w120 h23", "Enable Alt Loop")
	;AltLoop.OnEvent("click", (*) => IniWrite(AltLoop, CPath, "Misc", "AltLoop"))

	;DailyShop := myGui.Add("CheckBox", "x16 y120 w164 h23", "Enable Daily Shop Purchasing")
	;DailyShop.OnEvent("click", (*) => IniWrite(DailyShop, CPath, "Misc", "DailyShop"))
	
	;ItemUsing := myGui.Add("CheckBox", "x16 y216 w120 h23", "Enable Item Using")
	;ItemUsing.OnEvent("click", (*) => IniWrite(ItemUsing, CPath, "Misc", "ItemUsing"))

	;ConfigItemUsing := myGui.Add("Button", "x32 y240 w80 h23", "Edit Config")
	;ConfigItemUsing.OnEvent("click", (*) => Run("ItemConfig.pyw"))
	
	Tab.UseTab(5)

	myGui.Add("Text", "x8 y32 w333 h234", "Credits (frfr):`n`n- Author: Rexzy62`n- Thanks to contributors and testers`n- Repo: https://github.com/Rexzy62/BismuthMacro`n`nThank you for using BismuthMacro!")
	Tab.UseTab()
	myGui.Show()
	myGui.OnEvent("Close", (*) => ExitApp())


	 ExportSettings(*) {
        try {
            content := FileRead(CPath)
            A_Clipboard := content
            MsgBox("Export complete", "Export Settings", 0x40)
        } catch as e {
            MsgBox("Failed to export: " e.Message, "Export Error", 0x10)
        }
    }
    
    ImportSettings(*) {
        try {
            content := A_Clipboard
            FileDelete(CPath)
            FileAppend(content, CPath)
            MsgBox("Import complete", "Import Settings", 0x40)
            Reload()
        } catch as e {
            MsgBox("Failed to import: " e.Message, "Import Error", 0x10)
        }
    }