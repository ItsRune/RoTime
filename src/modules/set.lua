local Types = require(script.Parent.Parent.typeChecks)
-- local patterns = require(script.Parent.patterns)
-- local formattingCodes = patterns.formattingCodes

--[=[
	Sets the current time to a new date.

	```lua
	RoTime:setGlobalFormat("#h:#m:#s #a")
	RoTime:set("1:35:30 PM")
	```
	
	@method set
	@within RoTime
	@tag Chainable
	@tag Uses Global Format
	@unreleased

	@param toSetTo string
	@param ignoreWarnings boolean | nil

	@return RoTime

	:::info
	This method is currently unavailable and usage will result in defaulting back to the `RoTime` class.
	:::
]=]

-- selene: allow(unused_variable)
local incrementFromCode = {
	["sec"] = { 1, "second" },
	["min"] = { 2, "minute" },
	["hour"] = { 3, "hour" },
	["day"] = { 4, "day" },
	["week"] = { 5, "week" },
	["month"] = { 6, "month" },
	["year"] = { 7, "year" },
}

-- selene: allow(unused_variable)
return function(self: Types.RoTime, toSetTo: string, ignoreWarnings: boolean?): Types.RoTime
	return self
	-- local codeData = self._parser(self._globalFormat, true)
	-- local hasWarnedAlready = false

	-- for i = 1, #codeData do
	-- 	local data = codeData[i]
	-- 	local codeName = string.lower(string.split(data.code, "_")[1])
	-- 	local incrementData = incrementFromCode[codeName]

	-- 	if not incrementData then
	-- 		if hasWarnedAlready or ignoreWarnings == true then
	-- 			continue
	-- 		end

	-- 		warn("[RoTime]: set() string formats are not supported by this method.")
	-- 		hasWarnedAlready = true
	-- 	end

	-- 	local currentIndex = data.startIndex
	-- 	local endIndex = data.endIndex
	-- 	local mappedString = ""

	-- 	while currentIndex < endIndex do
	-- 		local char = string.sub(tostring(toSetTo), currentIndex, currentIndex)

	-- 		mappedString ..= (string.match(char, "%d") ~= nil) and char or ""
	-- 		currentIndex += 1
	-- 	end

	-- 	local mappedNumber = tonumber(mappedString)
	-- 	warn(mappedNumber, incrementData[2])
	-- end

	-- return self
end
