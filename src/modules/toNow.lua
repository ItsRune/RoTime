local Types = require(script.Parent.Parent.typeChecks)
-- local Patterns = require(script.Parent.Patterns)

-- selene: allow(unused_variable)

--[=[
	Provides the use case to get the amount of time until a certain date.	

	@within RoTime
	@method toNow
	@tag Chainable

	@param date string

	@return RoTime
]=]
return function(self: Types.RoTime, toFormatFrom: string): Types.RoTime
	return self
end
