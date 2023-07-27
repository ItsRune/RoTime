local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Gets the date in format of `HH:MM:SS AM/PM`

	@method getTime
	@within RoTime

	@return string
]=]
return function(self: Types.RoTime): string
	return self:format("#h:#m:#s #a")
end
