Ext.Require("Common.lua")
Ext.Require("Util.lua")

local debugMode = false
local items = {}

local function ClosedHandler(object)
    if debugMode then
        print('-- ClosedHandler')
        print('Object:', object)
    end

    if InArray(GetObjectName(object), ContainersList) then
        ApplyNewStatus(object, ExtraplanarContainerStatus)
        IterateInventory(object, "ContainerClose", "ContainerCloseFinished")
    end
end

local function OpenedHandler(object)
    if debugMode then
        print('-- OpenedHandler')
        print('Object:', object)
    end

    if InArray(GetObjectName(object), ContainersList) then
        ApplyNewStatus(object, ExtraplanarContainerStatus)
        IterateInventory(object, "ContainerOpen", "ContainerOpenFinished")
    end
end

local function OpenEventHandler(object, eventID)
    if eventID == "ContainerOpen" then
        if debugMode then
            print("-- triggered item on ContainerOpen:", object)
        end
        ApplyNewStatus(object, ExtraplanarStorageStatus)
    end
end

-- Opened and closed seem to trigger the other way around, super confusing
Ext.Osiris.RegisterListener("Closed", 1, "before", OpenedHandler)
Ext.Osiris.RegisterListener("Opened", 1, "before", ClosedHandler)
Ext.Osiris.RegisterListener("EntityEvent", 2, "after", OpenEventHandler)