--!strict
--// Variables \\--
local Settings = require(script.Settings)
local Tokenizer = require(script.Tokenize)
local Parser = require(script.Parser)
local Types = require(script.Types)

--// Module Setup \\--
local RoTime = {}
local Class = {}
Class.__index = Class

--// Functions \\--
-- local function Filter<T>(tbl: { T }, predicate: (data: T) -> boolean): { T }
-- 	local new = table.create(#tbl, 1)

-- 	for _, v: T in ipairs(tbl) do
-- 		if predicate(v) then
-- 			table.insert(new, v)
-- 		end
-- 	end

-- 	return new
-- end

local function Map<T, K>(tbl: { T }, callback: (value: T, index: any, tbl: { T }) -> K): { K }
	local new = {}

	for index, value in pairs(tbl) do
		local result = callback(value, index, tbl)
		table.insert(new, result)
	end

	return new
end

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

local function getIncrementFromTimesTable(self: { any }, Type: string)
	Type = tostring(Type)
	local found = table.find(Settings.addOrRemoveType, string.lower(Type))

	if not found then
		self:_warn(`"{string.lower(tostring(Type))}" is an invalid type to change.`)
		return
	end

	local beforeCheckDataType = string.upper(string.sub(Type, 1, 1)) .. string.lower(string.sub(Type, 2, #Type))
	local dataType = (string.sub(beforeCheckDataType, #beforeCheckDataType, #beforeCheckDataType) == "s")
			and string.sub(beforeCheckDataType, 0, #beforeCheckDataType - 1)
		or beforeCheckDataType

	return Settings.timesTable[dataType]
end

--// Public Functions \\--
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
function Class:_warn(...: string)
	warn("[RoTime]:", ...)
end

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
		else
			insert(token, token)
		end
	end

	return new
end

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

function Class:addTimezone(timezoneName: string, timezoneOffset: number)
	if not tonumber(timezoneOffset) then
		self:_warn("The new timezone offset has to be of type 'number'.")
	end

	Settings.Timezones[timezoneName] = timezoneOffset
	return self
end

--// Setters \\--
function Class:add(amount: number, Type: Types.addOrRemoveType)
	local increment = getIncrementFromTimesTable(Type)

	if not increment then
		self:_warn("Hmm.. An unexpected issue occurred.")
		return
	end

	self._dt = DateTime.fromUnixTimestamp(((amount - self._timezone.offset) * increment))
end

function Class:sub(amount: number, Type: Types.addOrRemoveType)
	local increment = getIncrementFromTimesTable(Type)

	if not increment then
		self:_warn("Hmm.. An unexpected issue occurred.")
		return
	end

	self._dt = DateTime.fromUnixTimestamp(((-amount + self._timezone.offset) * increment))
end

Class.addition = Class.add
Class.subtract = Class.sub

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
			tbl.hour = math.clamp(data.value - self._timezone.offset, 1, 24)
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

function Class:format(input: string): string
	local tokens = Tokenizer(input)

	local bulkData = self:_getTokenInformation(Map(tokens, function(value)
		return (value.expected == "Unknown") and value.code or value.expected
	end))

	local resultingData = Map(tokens, function(value)
		return bulkData[(value.expected == "Unknown") and value.code or value.expected]
	end)

	return table.concat(resultingData, "")
end

return setmetatable(RoTime, {
	__call = function(tbl, ...)
		return tbl.new(...)
	end,
})
