Ext.Require("Common.lua")
Ext.Require("Util.lua")

local debugMode = false
local statusTriggers = {
    "TUT_RESTORATION",
    "ALCH_POTION_REST_SLEEP_GREATER_RESTORATION",
    "HEAL",
}

local function StatusAppliedHandler(object, status, causee, storyActionID)
    local character = Osi.GetHostCharacter()
    if debugMode then
        print('-- StatusAppliedHandler')
        print('object:', object)
        print('status:', status)
        print('causee:', causee)
        print('storyActionID:', storyActionID)
        print('Character:', character)

        if InArray(status, statusTriggers) and object == character then
            IterateInventory(character, "InventoryCheck", "InventoryCheckFinished")
        end
    end

end

Ext.Osiris.RegisterListener("StatusApplied", 4, "after", StatusAppliedHandler)
