Ext.Require("Common.lua")
Ext.Require("Util.lua")

local debugMode = false

local function AddedToHandler(object, inventoryHolder, addType)
    if debugMode then
        print('-- AddedToHandler')
        print('Object:           ', object)
        print('Inventory holder: ', inventoryHolder)
        print('Add type:         ', addType)
        e = Ext.Entity.Get(object)
        if (e and e.Tag) then
            print('Tags:')
            _D(e.Tag)
        end
    end

    -- apply ExtraplanarStorageStatus if its into one of the containers of containersList
    if InArray(GetObjectName(inventoryHolder), ContainersList) then
        ApplyNewStatus(object, ExtraplanarStorageStatus)
    end
end

local function RemovedFromHandler(object, inventoryHolder)
    if debugMode then
        print('-- RemovedFromHandler')
        print('Object:           ', object)
        print('Inventory holder: ', inventoryHolder)
        e = Ext.Entity.Get(object)
        if (e and e.Tag) then
            print('Tags:')
            _D(e.Tag)
        end
    end

    RemoveExistingStatus(object, ExtraplanarStorageStatus)
end

Ext.Osiris.RegisterListener("AddedTo", 3, "after", AddedToHandler)
Ext.Osiris.RegisterListener("RemovedFrom", 2, "before", RemovedFromHandler)