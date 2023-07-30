local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Do you plan on using just one format throughout your codespace? This method is for you! `setGlobalFormat` will set the global format for all `RoTime` instances that uses a format!

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
