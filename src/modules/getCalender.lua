local Types = require(script.Parent.Parent.typeChecks)

--[=[
	@within RoTime
	@interface calenderData
	.dayName string
	.dayNumber number
]=]

--[=[
	@within RoTime
	@method getCalender

	@param month number | nil
	@param year number | nil

	@return {calenderData}

	:::info
	This method is currently unavailable and usage will result in defaulting back to the `RoTime` class.
	:::
]=]

-- selene: allow(unused_variable)
return function(self: Types.RoTime, month: number?, year: number?): string
	return self
	-- month = month or self:get("month")
	-- year = year or self:get("year")

	-- local lastDayNum, calender = nil, {}
	-- self:setGlobalFormat("#mm/#d/#yyyy"):set(`{month + 1}/{1}/{year}`):subtract(1, "day")
	-- lastDayNum = tonumber(self:format("#d"))

	-- for _ = 1, lastDayNum do
	-- 	local day = self:format("#DDD")
	-- 	local dayNum = tonumber(self:format("#d"))

	-- 	table.insert(calender, {
	-- 		dayName = day,
	-- 		dayNumber = dayNum,
	-- 	})

	-- 	self:add(1, "day")
	-- end

	-- return calender
end
