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
	@method _parser
	@private

	@param date string
	@param shouldReturnUnknownCharacters boolean | nil

	@return Parsed
]=]
local function parseData(
	date: string,
	shouldReturnUnknownCharacters: boolean?
): { code: string, startindex: number, endindex: number }
	local lengthOfStr = #tostring(date)
	local triggered = false
	local context = ""
	local codesAndIndices = {}

	for i = 1, lengthOfStr + 1 do
		local char = tostring(date):sub(i, i)

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

	return codesAndIndices
end

return parseData
