local patterns = require(script.Parent.patterns)
local days = patterns.days
local months = patterns.months
local Types = require(script.Parent.Parent.typeChecks)

local function addAppropriateOutput(codeType: string, nowTime: string | { any }): string
	local split = codeType:split("_")
	local name = split[1]
	local type = split[2]

	if name == "day" then
		if type == "num" then
			return tostring(nowTime.day)
		elseif type == "short" then
			return days[nowTime.wday][2]
		elseif type == "long" then
			return days[nowTime.wday][1]
		end
	elseif name == "month" then
		if type == "num" then
			return tostring(nowTime.month)
		elseif type == "short" then
			return months[nowTime.month][2]
		elseif type == "long" then
			return months[nowTime.month][1]
		end
	elseif name == "hour" then
		return (type == "12") and tostring((nowTime.hour % 12) == 0 and 12 or nowTime.hour % 12)
			or (nowTime.hour > 9) and tostring(nowTime.hour)
			or "0" .. tostring(nowTime.hour)
	elseif name == "week" then
		return tostring(nowTime.wday)
	elseif name == "min" then
		return (nowTime.min > 9) and tostring(nowTime.min) or "0" .. tostring(nowTime.min)
	elseif name == "sec" then
		return (nowTime.sec > 9) and tostring(nowTime.sec) or "0" .. tostring(nowTime.sec)
	elseif name == "year" then
		return tostring(nowTime.year)
	elseif name == "ampm" then
		return (nowTime.hour < 12) and "AM" or "PM"
	end

	return "Unknown"
end

--[=[
	Formats a string of code into a string of time.

	```lua
	RoTime:format("#h:#m:#s")
	RoTime:format() -- Uses the global format
	```

	You can find the formatting patterns [here](/RoTime/docs/Patterns).

	@method format
	@within RoTime

	@param code string | nil

	@return string
]=]
return function(self: Types.RoTime, code: string?): string
	code = code or self._globalFormat

	local codeData = self._tokenizer(code)
	local newCode = ""
	local alreadyDone = {}
	local nowDate = os.date("!*t", self._now)

	for i = 1, #tostring(code) do
		local didSomething = false
		for index, _ in next, codeData do
			local data = codeData[index]
			if (i >= data.startIndex and i <= data.endIndex) and alreadyDone[data.endIndex] == true then
				didSomething = true
				continue
			end

			if data.startIndex == i then
				local dating = addAppropriateOutput(data.code, nowDate)
				if dating == "Unknown" then
					break
				end

				newCode = newCode .. dating
				alreadyDone[data.endIndex] = true
				didSomething = true
				break
			end
		end

		if not didSomething then
			newCode = `{newCode}{tostring(code):sub(i, i)}`
		end
	end

	return newCode
end
