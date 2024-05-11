Ext.Require("Common.lua")
Ext.Require("Util.lua")

local debugMode = false

local function LevelGameplayStartedHandler(levelName, isEditorMode)
    local character = Osi.GetHostCharacter()
    if debugMode then
        print('-- LevelGameplayStartedHandler')
        print('Character:', character)
    end

    IterateInventory(character, "InventoryCheck", "InventoryCheckFinished")
end

local function InventoryCheckHandler(object, eventID)
    if eventID == "InventoryCheck" then
        if debugMode then
            print("-- InventoryCheck triggered")
        end
        
        if InArray(GetObjectName(object), ContainersList) then
            if debugMode then
                print("Container found:", object)
            end
            ApplyNewStatus(object, ExtraplanarContainerStatus)
            IterateInventory(object, "ContainerOpen", "ContainerOpenFinished")
        end
    end
end

Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", LevelGameplayStartedHandler)
Ext.Osiris.RegisterListener("EntityEvent", 2, "after", InventoryCheckHandler)
