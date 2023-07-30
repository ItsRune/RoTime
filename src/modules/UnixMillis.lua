local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Gets the current Unix timestamp with milliseconds.

	@within RoTime
	@method UnixMillis

	@return number
]=]
return function(self: Types.RoTime): number
	return self._nowdt.UnixTimestampMillis
end
