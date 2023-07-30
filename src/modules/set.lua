local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Want to set an arbitrary time? `set` will set the time of the `RoTime` instance to the time you want it to be!

	```lua
	RoTime:setGlobalFormat("#h:#m:#s #a")
	RoTime:set("1:35:30 PM")

	-- OR

	-- No global format required!
	RoTime:set("1:35:30 PM", "#h:#m:#s #a")
	```
	
	@method set
	@within RoTime
	@tag Chainable
	@tag Uses Global Format
	@unreleased

	@param toSetTo string
	@param formatToUse string | nil
	@param ignoreWarnings boolean | nil

	@return RoTime
	:::info
	This method is currently unavailable and usage will result in defaulting back to the `RoTime` class.
	:::
]=]

local incrementFromCode = {
	["sec"] = { 1, "second" },
	["min"] = { 2, "minute" },
	["hour"] = { 3, "hour" },
	["day"] = { 4, "day" },
	["week"] = { 5, "week" },
	["month"] = { 6, "month" },
	["year"] = { 7, "year" },
	["ampm"] = { 8 },
}

local timeIncrements = {
	["second"] = 1,
	["minute"] = 60,
	["hour"] = 60 * 60,
	["day"] = 60 * 60 * 24,
	["week"] = 60 * 60 * 24 * 7,
	["month"] = 60 * 60 * 24 * 30,
	["year"] = 60 * 60 * 24 * 365,
}

return function(self: Types.RoTime, toSetTo: string, formatToUse: string?, ignoreWarnings: boolean?): Types.RoTime
	formatToUse = formatToUse or self._globalFormat

	warn(toSetTo, formatToUse)

	local codeData = self._tokenizer(formatToUse, toSetTo, true)
	local currentFormat = string.split(self:format("#h #m #s #mm #d #yyyy #a"), " ")
	local hasWarnedAlready = false

	local currentData = {
		["hour"] = tonumber(currentFormat[1]),
		["minute"] = tonumber(currentFormat[2]),
		["second"] = tonumber(currentFormat[3]),
		["month"] = tonumber(currentFormat[4]),
		["day"] = tonumber(currentFormat[5]),
		["year"] = tonumber(currentFormat[6]),
		["ampm"] = currentFormat[7],
	}

	for i = 1, #codeData do
		local data = codeData[i]
		local codeName = string.lower(string.split(data.code, "_")[1])
		local incrementData = incrementFromCode[codeName]

		if not incrementData then
			if not hasWarnedAlready and ignoreWarnings == false then
				hasWarnedAlready = true
				warn("[RoTime]: set() string formats are not supported by this method.")
			end

			continue
		end

		-- This function looks for specific types within the formatted string.
		local function lookFor(Type: "number" | "string")
			local currentIndex = (data.startIndex == 1) and data.startIndex or data.startIndex - 1
			local mappedString = ""
			local characters = string.split(string.sub(tostring(toSetTo), currentIndex, #toSetTo), "")

			for charIndex = 1, #characters do
				local char = characters[charIndex]

				if Type == "number" then
					local _, isNumber = pcall(tonumber, char)

					if not isNumber and #mappedString > 0 then
						break
					elseif not isNumber and #mappedString == 0 then
						continue
					end

					mappedString ..= char
				elseif Type == "string" and string.match(char, "%a") then
					mappedString ..= char
				else
					break
				end
			end

			return mappedString
		end

		-- Handles the incrementation of the time.
		local function handleIncrementation()
			local mappedString = lookFor("number")
			local mappedNumber = tonumber(mappedString)
			-- warn(mappedNumber, currentData[incrementData[2]], incrementData[2])
			local difference = math.abs(mappedNumber - currentData[incrementData[2]])
			local direction = (mappedNumber > currentData[incrementData[2]]) and 1 or -1

			self._now += timeIncrements[incrementData[2]] * difference * direction
		end

		-- Make sure we handle am/pm flips.
		if data.code == "ampm" then
			local mappedString = lookFor("string")
			local loweredString = string.lower(mappedString)

			if loweredString == "am" and currentData["ampm"] == "PM" then
				self._now += timeIncrements["hour"] * -12
			elseif loweredString == "pm" and currentData["ampm"] == "AM" then
				self._now += timeIncrements["hour"] * 12
			end
		else
			handleIncrementation()
		end
	end

	self._nowdt = DateTime.fromUnixTimestamp(self._now)

	return self
end
