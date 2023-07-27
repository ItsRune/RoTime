local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Sets the global format for all RoTime instances.

	@method setGlobalFormat
	@within RoTime
	@tag Chainable
	@tag Optional

	@param newGlobalFormat string
	
	@return RoTime
]=]
return function(self: Types.RoTime, newGlobalFormat: string): Types.RoTime
	self._globalFormat = newGlobalFormat
	return self
end
