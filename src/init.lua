-- Documentation on how to use:
-- https://github.com/ItsRune/RoTime/blob/master/README.md
local function Constructor()
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