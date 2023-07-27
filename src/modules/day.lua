local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Sets the day of the month to a new value.

	@method day
	@within RoTime
	@tag Chainable

	@param newDay number

	@return RoTime
]=]
return {
	alias = { "day", "days" },
	func = function(self, newDay: number): Types.RoTime
		local currentDay = os.date("*t", self._now).day
		local difference = math.abs(currentDay - newDay)

		return (currentDay < newDay) and self:add(difference, "day") or self:subtract(difference, "day")
	end,
}
