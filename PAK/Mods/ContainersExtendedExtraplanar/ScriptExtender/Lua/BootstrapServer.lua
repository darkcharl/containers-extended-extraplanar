--[[
    Adds weight reduction (negative value) boost to items to reduce their weight

    Interesting events from https://github.com/LaughingLeader/BG3ModdingTools/blob/master/generated/Osi.Events.lua

    ---@param object GUIDSTRING
    ---@param inventoryHolder GUIDSTRING
    ---@param addType string
    function Osi.AddedTo(object, inventoryHolder, addType) end

    ---@param object GUIDSTRING
    ---@param inventoryHolder GUIDSTRING
    function Osi.RemovedFrom(object, inventoryHolder) end

    ---@param item ITEM
    function Osi.Closed(item) end

    ---@param item ITEM
    function Osi.Opened(item) end

    Interesting functions from https://github.com/LaughingLeader/BG3ModdingTools/blob/master/generated/Osi.lua

    ---@param inventoryHolder GUIDSTRING
    ---@param event string
    ---@param completionEvent string
    function Osi.IterateInventory(inventoryHolder, event, completionEvent) end

]]--

Ext.Require("Server/AddRemove.lua")
Ext.Require("Server/OpenClose.lua")
Ext.Require("Server/LevelGameplayStarted.lua")
