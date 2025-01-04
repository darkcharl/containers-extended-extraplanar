Ext.Require("Common.lua")
Ext.Require("Util.lua")

local debugMode = false

local function LongRestFinishedHandler()
    local character = Osi.GetHostCharacter()
    if debugMode then
        print('-- LongRestFinishedHandler')
        print('Character:', character)
    end

    IterateInventory(character, "InventoryCheck", "InventoryCheckFinished")
end

Ext.Osiris.RegisterListener("LongRestFinished", 0, "after", LongRestFinishedHandler)
