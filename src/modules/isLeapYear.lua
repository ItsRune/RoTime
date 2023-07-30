local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Checks if a year is a leap year. If `year` is not provided it will default to the current year.

	```lua
	RoTime:isLeapYear(2020) -- true
	RoTime:isLeapYear() -- false
	```

	@within RoTime
	@method isLeapYear

	@param year number | nil

	@return boolean
]=]
return function(self: Types.RoTime, year: number?): boolean
	local unix = self:Unix()
	year = year or os.date("*t", unix).year

	return ((year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0))
end
