local debugMode = false

function InArray(item, array)
    for _, value in ipairs(array) do
        if value == item then
            return true
        end
    end

    return false
end

function GetObjectName(name, sep, ntags)
    if sep == nil then
        sep = "_"
    end

    if ntags == nil then
        ntags = 2
    end
    
    local t={}
    local i=0
    for s in string.gmatch(name, "([^"..sep.."]+)") do
        if i > ntags then
            break
        end
        i = i + 1
        table.insert(t, s)
    end

    if debugMode then
        print("--- GetObjectName")
        print("name:", name)
        for _, v in ipairs(t) do
            print("tag:", v)
        end
    end

    return table.concat(t, "_")
end