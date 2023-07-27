--[=[
	Sets the current month to a new value.

	@within RoTime
	@method month
	@tag Chainable

	@param newMonth number

	@return RoTime
]=]
return {
	alias = { "month", "months" },
	func = function(self, newMonth: number): {}
		local currentMonth = os.date("*t", self._now).month
		local difference = math.abs(currentMonth - newMonth)

		return (currentMonth < newMonth) and self:add(difference, "month") or self:subtract(difference, "month")
	end,
}
