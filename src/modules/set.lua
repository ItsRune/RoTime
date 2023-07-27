-- local patterns = require(script.Parent.patterns)
-- local formattingCodes = patterns.formattingCodes

--[=[
	Sets the current time to a new date.
	
	@method set
	@within RoTime
	@tag Chainable
	@unreleased

	@param newDate string
	@param format string

	@return RoTime
]=]

-- selene: allow(unused_variable)
return function(self, newDate: string, format: string)
	-- Sets the self._now variable to a new date
	-- @param newDate: string
	-- @param format: string
	-- @returns self

	local codeData = self._parser(format)

	warn(codeData)
end
