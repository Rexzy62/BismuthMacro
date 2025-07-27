#Requires AutoHotkey v2.0
#SingleInstance Force

iniPath := A_ScriptDir "\ItemConfig.ini"
myGui := Gui()
myGui.Title := "Item -- Config"

entryY := 72
entrySpacing := 40
entries := []

myGui.SetFont("s18", "Lucida Console")
myGui.Add("Text", "x8 y3 w160 h34 +0x200", "Item Config")

myGui.SetFont("s9", "Ms shell Dlg")
myGui.Add("Text", "x15 y40 w29 h23 +0x200", "Type")
myGui.Add("Text", "x190 y40 w31 h23 +0x200", "Hours")
myGui.Add("Text", "x312 y40 w42 h23 +0x200", "Minutes")
myGui.Add("Text", "x520 y40 w40 h23 +0x200", "Name")


; First row
TypeList := myGui.Add("DropDownList", "x56 y40 w120", ["Item", "Gauntlet"])
Edit1 := myGui.Add("Edit", "x232 y40 w56 h21")  ; Hours
Edit2 := myGui.Add("Edit", "x376 y40 w61 h21")  ; Minutes
EditName := myGui.Add("Edit", "x560 y40 w100 h21")  ; Name

EntryDelete := myGui.Add("Button", "x16 y384 w110 h23", "Delete Entries")
EntryDelete.OnEvent("Click", DeleteAll)
Help := myGui.Add("Button", "x230 y384 w85 h23 +0x200", "PLEASE READ!")
Help.OnEvent("Click", (*) => MsgBox("This isnt Completely Finished sorry Ill fix it with future updates...`n`nThe First Entry DOES NOT WORK, IT IS ONLY FOR CONFIURING THE NEW ENTRIES! `n`n After Adding a new entry IT IS SAVED LIKE THAT NO CHAGNING!`n`n Btw, the delete entries button deletes every entry. `n`n Name stands for the Item/Gauntlet Name"))

NewEntry := myGui.Add("Button", "x140 y384 w80 h23", "New Entry")
NewEntry.OnEvent("Click", AddNewEntryAndSave)

myGui.OnEvent("Close", (*) => ExitApp())

LoadEntriesFromIni()
myGui.Show()

AddNewEntry()
{
    global entryY, entrySpacing, myGui, entries
    global TypeList, Edit1, Edit2, EditName

    selectedType := TypeList.Text
    hourText := Edit1.Text
    minText := Edit2.Text
    nameText := EditName.Text

    newType := myGui.Add("DropDownList", "x56 y" entryY " w120", ["Item", "Gauntlet"])
    newType.Text := selectedType

    newHour := myGui.Add("Edit", "x232 y" entryY " w56 h21")
    newHour.Text := hourText

    newMin := myGui.Add("Edit", "x376 y" entryY " w61 h21")
    newMin.Text := minText



    newName := myGui.Add("Edit", "x560 y" entryY " w100 h21")
    newName.Text := nameText

    entries.Push({type: newType, hour: newHour, min: newMin, name: newName})
    entryY += entrySpacing
}

AddNewEntryAndSave(ctrl, info)
{
    AddNewEntry()
    SaveAllEntries()
}

SaveAllEntries()
{
    global entries, iniPath

    IniDelete(iniPath, "")
    Loop entries.Length
    {
        index := A_Index
        entry := entries[index]
        IniWrite(entry.type.Text, iniPath, "Entry" index, "Type")
        IniWrite(entry.hour.Text, iniPath, "Entry" index, "Hours")
        IniWrite(entry.min.Text, iniPath, "Entry" index, "Minutes")
        IniWrite(entry.name.Text, iniPath, "Entry" index, "Name")
    }
}

LoadEntriesFromIni()
{
    global iniPath, TypeList, Edit1, Edit2, EditName

    i := 1
    while IniRead(iniPath, "Entry" i, "Type", "") != ""
    {
        typeVal := IniRead(iniPath, "Entry" i, "Type", "Item")
        hourVal := IniRead(iniPath, "Entry" i, "Hours", "0")
        minVal := IniRead(iniPath, "Entry" i, "Minutes", "0")
        enableVal := IniRead(iniPath, "Entry" i, "Enabled", "0")
        nameVal := IniRead(iniPath, "Entry" i, "Name", "")

        if (i = 1)
        {
            TypeList.Text := typeVal
            Edit1.Text := hourVal
            Edit2.Text := minVal
            EditName.Text := nameVal
        }
        else
        {
            TypeList.Text := typeVal
            Edit1.Text := hourVal
            Edit2.Text := minVal
            EditName.Text := nameVal
            AddNewEntry()
        }

        i++
    }
}

DeleteAll(ctrl, info)
{
    FileDelete A_ScriptDir "\ItemConfig.ini"
    Run A_ScriptDir "\UseItem.ahk"
}