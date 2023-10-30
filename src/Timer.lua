local Timer = {}
local Class = {}
Class.__index = Class

--// Public Functions \--
function Timer.new()
	local self = setmetatable({}, Class)

	return self
end

--// Private Functions \--
function Class:Destroy()
	table.clear(self)
	setmetatable(self, nil)
	self = nil
end

--// Return \--
return setmetatable(Timer, {
	__call = function(self, ...)
		return self.new(...)
	end,
})
