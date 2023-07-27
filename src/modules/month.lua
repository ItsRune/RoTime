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

		if currentMonth < newMonth then
			return self:add(difference, "month")
		else
			return self:subtract(difference, "month")
		end
	end,
}
