--!strict
--// Variables \\--
local Settings = require(script.Settings)

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

--// Public Functions \\--
function RoTime.new()
	local self = setmetatable({}, Class)

	self._dt = DateTime.now()
	self._unixms = self._dt.UnixTimestampMillis
	self._unix = self._dt.UnixTimestamp
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
end

return setmetatable(RoTime, {
	__call = function(tbl, ...)
		return tbl.new(...)
	end,
})
