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

    return setmetatable(time, mt)
end

local x = {}
x.new = Constructor

return x