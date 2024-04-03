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
        if HasActiveStatus(object, ExtraplanarContainerStatus) == 0 then
            ApplyStatus(object, ExtraplanarContainerStatus, -1)
        end
        
        IterateInventory(object, "ContainerClose", "ContainerCloseFinished")
    end
end

local function OpenedHandler(object)
    if debugMode then
        print('-- OpenedHandler')
        print('Object:', object)
    end

    if InArray(GetObjectName(object), ContainersList) then
        if HasActiveStatus(object, ExtraplanarContainerStatus) == 0 then
            ApplyStatus(object, ExtraplanarContainerStatus, -1)
        end

        IterateInventory(object, "ContainerOpen", "ContainerOpenFinished")
    end
end

local function MainEventRouter(object, eventId)
    if eventId == "ContainerOpen" then
        print("-- triggered item on ContainerOpen:", object)
        if HasActiveStatus(object, ExtraplanarStorageStatus) == 0 then
            ApplyStatus(object, ExtraplanarStorageStatus, -1)
        end
    end
end

-- Opened and closed seem to trigger the other way around, super confusing
Ext.Osiris.RegisterListener("Closed", 1, "before", OpenedHandler)
Ext.Osiris.RegisterListener("Opened", 1, "before", ClosedHandler)
Ext.Osiris.RegisterListener("EntityEvent", 2, "after", MainEventRouter)