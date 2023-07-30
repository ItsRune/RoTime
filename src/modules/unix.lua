local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Gets the current Unix timestamp.

	@within RoTime
	@method Unix

	@return number
]=]
return function(self: Types.RoTime): number
	return self._now
end