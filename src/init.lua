-- Documentation on how to use:
-- https://github.com/ItsRune/RoTime/blob/master/README.md
local function Constructor()
    local time = {}
    local mt = {}

    mt.__index = mt

    for _,v in next, script.modules:GetChildren() do
        if v:IsA("ModuleScript") then
            local data = require(v)

            if typeof(data) == "function" then
                mt[v.Name] = data
                continue
            end

            if (typeof(data) == "table" and data["alias"] ~= nil) then
                for _,alias in next, data["alias"] do
                    mt[alias] = data["func"]
                end
                continue
            end
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