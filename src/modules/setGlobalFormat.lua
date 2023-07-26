local Types = require(script.Parent.Parent.typeChecks)

return function(self: Types.RoTime, newGlobalFormat: string): Types.RoTime
	self._globalFormat = newGlobalFormat
	return self
end
