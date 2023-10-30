local Timer = {}
local Class = {}
Class.__index = Class

--// Public Functions \\--
function Timer.new()
	local self = setmetatable({}, Class)

	self._changed = Instance.new("BindableEvent")

	self.Changed = self._changed.Event

	return self
end

--// Class Functions \\--
function Class:Start()
	--
end

function Class:Pause()
	--
end

--// Return \\--
return setmetatable(Timer, {
	__call = function(tbl, ...)
		return tbl.new(...)
	end,
})
