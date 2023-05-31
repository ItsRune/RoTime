-- Documentation on how to use:
-- https://github.com/ItsRune/RoTime/blob/master/README.md
local Types = require(script.typeChecks)
local function Constructor(): Types.RoTime
    local time = {}
    local mt = {}

    mt.__index = mt

    for _,v in next, script.modules:GetChildren() do
        if v:IsA("ModuleScript") then
            mt[v.Name] = require(v)
        end
    end

    time._now = os.time()
    time._nowdt = DateTime.now()
    time._timezone = "UTC"

    return setmetatable(time, mt)
end

local x = {}
x.new = Constructor

return x