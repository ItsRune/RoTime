local patterns = require(script.Parent.patterns)
local formattingCodes = patterns.formattingCodes

--[=[
	@within RoTime
	@private
	@interface Parsed
	.code string
	.startIndex number
	.endIndex number
]=]

--[=[
	The main parser for converting formatting strings into usable tokens.

	@within RoTime
	@method _tokenizer
	@private

	@param format string
	@param input string
	@param shouldReturnUnknownCharacters boolean | nil

	@return Parsed
]=]
local function parseData(
	format: string,
	input: string,
	shouldReturnUnknownCharacters: boolean?
): { code: string, startindex: number, endindex: number }
	format = tostring(format)
	input = tostring(input)

	local triggered = false
	local context = ""
	local codesAndIndices = {}
	local primary, secondary = (#format > #input and format or input), (#format > #input and input or format)
	local difference = #primary - #secondary

	warn(format, input)

	--[[
		month_num  -  Client - set:127
		day_num  -  Client - set:127
		year  -  Client - set:127
		hour_12  -  Client - set:127
		min  -  Client - set:127
		ReplicatedStorage.RoTime.modules.set:120: attempt to perform arithmetic (sub) on nil and number

		- End indices are based off the length of the original code, not the input.
	]]

	local function insert(code: string, startIndex: number, endIndex: number)
		if startIndex > #input then
			startIndex -= difference
		end

		if endIndex > #input then
			endIndex -= difference
		end

		table.insert(codesAndIndices, {
			["code"] = code,
			["value"] = string.sub(input, startIndex, endIndex),
			["startIndex"] = startIndex,
			["endIndex"] = endIndex,
		})
	end

	for i = 1, #primary do
		local formatChar
		local realChar

		if primary == input then
			formatChar = string.sub(format, i - difference, i - difference)
			realChar = string.sub(input, i, i)
		else
			formatChar = string.sub(format, i, i)
			realChar = string.sub(input, i - difference, i - difference)
		end

		if triggered then
			if formattingCodes[context] and formatChar ~= string.sub(context, 1, 1) then
				insert(formattingCodes[context], i - #context - 1, i - 1)

				context = ""
				triggered = false

				if
					shouldReturnUnknownCharacters == true
					and formatChar ~= patterns.triggerChar
					and formatChar ~= ""
				then -- Make sure to not include that last empty string.
					insert("unknown_char", i - 1, i - 1)
				end

				continue
			end

			if formatChar == nil then
				break
			end

			context ..= realChar
		elseif formatChar == patterns.triggerChar then
			if triggered then
				context ..= realChar
			else
				triggered = true
			end
		end
	end

	return codesAndIndices
end

return parseData

--[[
Before Changes:
for i = 1, lengthOfStr + 1 do
		local char = tostring(format):sub(i, i)

		if triggered then
			if formattingCodes[context] and tostring(char) ~= string.sub(context, 1, 1) then
				table.insert(codesAndIndices, {
					["code"] = formattingCodes[context],
					["startIndex"] = i - #context - 1,
					["endIndex"] = i - 1,
				})

				context = ""
				triggered = false

				if shouldReturnUnknownCharacters == true and char ~= patterns.triggerChar and char ~= "" then -- Make sure to not include that last empty string.
					table.insert(codesAndIndices, {
						["code"] = "unknown_char",
						["value"] = char,
						["startIndex"] = i - 1,
						["endIndex"] = i - 1,
					})
				end

				continue
			end

			if char == nil then
				break
			end

			context = `{context}{char}`
		elseif char == patterns.triggerChar then
			if triggered then
				context = `{context}{char}`
			else
				triggered = true
			end
		end
	end
]]
