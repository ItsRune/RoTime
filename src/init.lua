--!strict
--- @class RoTime

--// Variables \\--
local Settings = require(script.Settings)
local Tokenizer = require(script.Tokenize)
local Parser = require(script.Parser)
local Types = require(script.Types)
local Table = require(script.Table)

--// Module Setup \\--
local RoTime = {}
local Class = {}
Class.__index = Class

--// Documentation Types \\--
--[=[
	@type additionSubtractionInterface "second" | "minute" | "hour" | "day" | "week" | "month" | "year"
	@within RoTime
]=]

--// Functions \\--
function getTimezoneData(timezoneName: string): { name: string, offset: number }?
	local data = {}

	for timezoneNameToCheck: string, timezoneOffset: number in pairs(Settings.Timezones) do
		if string.lower(timezoneNameToCheck) == string.lower(timezoneName) then
			data.name = timezoneNameToCheck
			data.offset = timezoneOffset
			break
		end
	end

	return (data["name"] ~= nil) and data or nil
end

local function getIncrementFromTimesTable(Type: string)
	Type = tostring(Type)

	local beforeCheckDataType = string.upper(string.sub(Type, 1, 1)) .. string.lower(string.sub(Type, 2, #Type))
	local dataType = (string.sub(beforeCheckDataType, #beforeCheckDataType, #beforeCheckDataType) == "s")
			and string.sub(beforeCheckDataType, 0, #beforeCheckDataType - 1)
		or beforeCheckDataType

	return Settings.timesTable[dataType]
end

--// Public Functions \\--
--[=[
	Constructs a new class.
	@return RoTime

	@tag Constructor
	@since 2.0.0
	@within RoTime
]=]
function RoTime.new()
	local self = setmetatable({}, Class)

	self._dt = DateTime.now()
	self._timezone = {
		name = "UTC",
		offset = 0,
	}

	return self
end

--// Private Functions \\--
--[=[
	Warns to the console with a prefix.

	@private
	@since 2.0.0
	@within RoTime
]=]
function Class:_warn(...: string)
	warn("[RoTime]:", ...)
end

--[=[
	Gets a token's information.

	@private
	@since 2.0.0
	@within RoTime
]=]
function Class:_getTokenInformation(tokenExpected: { string }): { [string]: string | number }
	local new = {}

	local function insert(index: string, value: any)
		if new[index] ~= nil then
			return
		end

		new[index] = value
	end

	local timeWithZone =
		DateTime.fromUnixTimestampMillis(self._dt.UnixTimestampMillis + (60 * 60 * self._timezone.offset * 1000))
	local timeValueTable = timeWithZone:ToUniversalTime()
	local weekDayNumber = (math.floor(timeWithZone.UnixTimestampMillis / 86400) + 1) % 7

	for _, token in pairs(tokenExpected) do
		if token == "hour_12" then
			local result = (timeValueTable.Hour + 1) % 12
			insert(token, (result == 0) and 12 or result - 1)
		elseif token == "hour_24" then
			insert(token, timeValueTable.Hour + 1)
		elseif token == "minute" then
			insert(token, timeValueTable.Minute)
		elseif token == "second" then
			insert(token, timeValueTable.Second)
		elseif token == "millis" then
			insert(token, timeValueTable.Millisecond)
		elseif token == "day_short" then
			insert(token, timeValueTable.Day)
		elseif token == "day_long" then
			insert(token, Settings.Names.weekDays[weekDayNumber])
		elseif token == "year_long" then
			insert(token, timeValueTable.Year)
		elseif token == "year_short" then
			local str = tostring(timeValueTable.Year)
			insert(token, string.sub(str, #str - 1, #str))
		elseif token == "month" then
			insert(token, timeValueTable.Month)
		elseif token == "month_long" then
			insert(token, Settings.Names.Months[timeValueTable.Month])
		elseif token == "month_short" then
			insert(token, string.sub(Settings.Names.Months[timeValueTable.Month], 1, 3))
		elseif token == "week_day" then
			insert(token, weekDayNumber)
		elseif token == "week_year" then
			-- local firstThursday = weekDayNumber + ((weekDayNumber + 6) % 7)
			insert(token, "Not implemented")
		elseif token == "year_day" then
			-- day 100 / 365
			local timeFrame = self:toNow("1/1", "#mm/#dd")
			local difference = self._dt.UnixTimestamp - timeFrame
			insert(token, math.floor(difference / Settings.timesTable.Day))
		else
			insert(token, token)
		end
	end

	return new
end

--[=[
	Sets the timezone to the specified timezone.
	@return RoTime

	@since 2.0.0
	@within RoTime
]=]
function Class:timezone(newTimezone: string)
	local timezoneData = getTimezoneData(newTimezone)

	if not timezoneData then
		self:_warn(
			'"' .. newTimezone .. '"',
			'is not a valid timezone. You can add a new one with the ":addTimezone" method.'
		)
	end

	self._timezone = timezoneData
	return self
end

--[=[
	Creates a new timezone with the designated offset.
	@param timezoneName string
	@param timezoneOffset number
	@return RoTime

	@since 2.0.0
	@within RoTime
]=]
function Class:addTimezone(timezoneName: string, timezoneOffset: number)
	if not tonumber(timezoneOffset) then
		self:_warn("The new timezone offset has to be of type 'number'.")
	end

	Settings.Timezones[timezoneName] = timezoneOffset
	return self
end

--[=[
	Checks if the current time is a leap year.
	@return boolean

	@since 2.0.0
	@within RoTime
]=]
function Class:isLeapYear(): boolean
	local year = self._dt:ToUniversalTime().Year
	return ((year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0))
end

--[=[
	Sets the format if none is provided in methods.
	@return RoTime

	@tag Chainable
	@since 2.0.0
	@within RoTime
]=]
function Class:setFormat(formattingString: string)
	self._format = formattingString
	return self
end

--[=[
	Takes a future time and calculates the difference, returning time duration.
	@param input string
	@param format string?
	@return number

	@since 2.0.0
	@within RoTime
]=]
function Class:fromNow(input: string, format: string): number
	local newTime = RoTime.new()
	newTime:timezone(self._timezone.name):set(input, format)

	local nowUnix = self._dt.UnixTimestamp
	local futureUnix = newTime:getDateTime().UnixTimestamp

	if nowUnix > futureUnix then
		return 0
	end

	newTime:Destroy()
	return math.abs(futureUnix - nowUnix)
end

--[=[
	Takes a past time and calculates the difference, returning time duration.
	@param input string
	@param format string?
	@return number

	@since 2.0.0
	@within RoTime
]=]
function Class:toNow(input: string, format: string): number
	local newTime = RoTime.new()
	newTime:timezone(self._timezone.name):set(input, format)

	local nowUnix = self._dt.UnixTimestamp
	local pastUnix = newTime:getDateTime().UnixTimestamp

	if nowUnix < pastUnix then
		return 0
	end

	newTime:Destroy()
	return math.abs(nowUnix - pastUnix)
end

--[=[
	Gets the DateTime Instance.
	@return DateTime

	@since 2.0.0
	@within RoTime
]=]
function Class:getDateTime()
	return self._dt
end

--// Setters \\--
--[=[
	Adds an amount of time based on the addition/subtraction type.
	@param amount number
	@param Type additionSubtractionInterface
	@return RoTime

	:::info
	`RoTime:add(amount, Type)` also works with this method.
	:::

	@tag Chainable
	@since 2.0.0
	@within RoTime
]=]
function Class:addition(amount: number, Type: Types.addOrRemoveType)
	local increment = getIncrementFromTimesTable(Type)

	if not increment then
		self:_warn("Hmm.. An unexpected issue occurred.")
		return
	end

	self._dt = DateTime.fromUnixTimestamp(((amount + self._timezone.offset) * increment))
	return self
end
Class.add = Class.addition

--[=[
	Subtracts an amount of time based on the addition/subtraction type.
	@param amount number
	@param Type additionSubtractionInterface
	@return RoTime

	:::info
	`RoTime:sub(amount, Type)` also works with this method.
	:::

	@tag Chainable
	@since 2.0.0
	@within RoTime
]=]
function Class:subtract(amount: number, Type: Types.addOrRemoveType)
	local increment = getIncrementFromTimesTable(Type)

	if not increment then
		self:_warn("Hmm.. An unexpected issue occurred.")
		return
	end

	self._dt = DateTime.fromUnixTimestamp(((amount - self._timezone.offset) * increment))
	return self
end
Class.sub = Class.subtract

--[=[
	Sets the time to the specified input and format.
	@param input string
	@param format string?
	@return RoTime

	@tag Chainable
	@since 2.0.0
	@within RoTime
]=]
function Class:set(input: string, format: string)
	assert(typeof(input) == "string", "error 1")
	assert(typeof(format) == "string", "error 2")

	local tokens = Tokenizer(format)
	local parsed = Parser(input, false, tokens)

	local current = self._dt:ToUniversalTime()
	local tbl = {
		year = current.Year,
		month = current.Month,
		day = current.Day,
		hour = current.Hour,
		minute = current.Minute,
		second = current.Second,
		millisecond = current.Millisecond,
	}

	local unsupported = {
		"hour_12",
		"month_long",
		"month_short",
		"millis",
	}

	for _, data: { value: string | number, code: string } in pairs(parsed) do
		local patternData = Settings.Patterns[data.code]

		if not patternData then
			continue
		end

		local token = patternData.expectedType

		if table.find(unsupported, token) then
			self:_warn(`"{token}" is not supported for ":set"!`)
			continue
		end

		if token == "hour_24" then
			tbl.hour = math.clamp(data.value - self._timezone.offset, 0, 23)
		elseif token == "minute" then
			tbl.minute = math.clamp(data.value, 0, 60)
		elseif token == "second" then
			tbl.second = math.clamp(data.value, 0, 60)
		elseif token == "day_short" or token == "day_long" then
			tbl.day = math.clamp(data.value, 0, 31)
		elseif token == "year_short" then
			tbl.year = (data.value + 2000)
		elseif token == "year_long" then
			tbl.year = data.value
		elseif token == "month" then
			tbl.month = math.clamp(data.value, 1, 12)
		end
	end

	self._dt =
		DateTime.fromUniversalTime(tbl.year, tbl.month, tbl.day, tbl.hour, tbl.minute, tbl.second, tbl.millisecond)
	return self
end

--[=[
	Formats the current time with certain formatting parameters.
	@param input string
	@return string

	@tag Chainable
	@since 2.0.0
	@within RoTime
]=]
function Class:format(input: string): string
	local tokens = Tokenizer(input)

	local bulkData = self:_getTokenInformation(Table.Map(tokens, function(value)
		return (value.expected == "Unknown") and value.code or value.expected
	end))

	local resultingData = Table.Map(tokens, function(value)
		return bulkData[(value.expected == "Unknown") and value.code or value.expected]
	end)

	return table.concat(resultingData, "")
end

--[=[
	Destroys the module and cleans methods.
	@return nil

	@since 2.0.0
	@within RoTime
]=]
function Class:Destroy()
	table.clear(self)
	setmetatable(self, nil)
	self = nil
end

return setmetatable(RoTime, {
	__call = function(tbl, ...)
		return tbl.new(...)
	end,
})
