local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Gets the date in format of `MM/DD/YYYY`

	@method getDate
	@within RoTime

	@return string
]=]
return function(self: Types.RoTime): string
	return self:format("#mm/#d/#yyyy")
end
