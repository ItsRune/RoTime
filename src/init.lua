local time = {}
local mt = {}

mt.__index = mt

local function Constructor()
    local self = setmetatable({}, mt)
    
    for _,v in next, script.modules:GetChildren() do
        if v:IsA("ModuleScript") then
            self[v.Name] = require(v)
        end
    end

    self._now = os.time()
    self._nowtick = tick()

    return self
end

time.new = Constructor

return time