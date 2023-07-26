return {
	alias = { "month", "months" },
	func = function(self, newMonth: number): {}
		local currentMonth = os.date("*t", self._now).month
		local difference = math.abs(currentMonth - newMonth)

		if currentMonth < newMonth then
			return self:add(difference, "day")
		else
			return self:subtract(difference, "day")
		end
	end,
}
