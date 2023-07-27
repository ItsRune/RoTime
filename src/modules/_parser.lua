local patterns = require(script.Parent.patterns)
local formattingCodes = patterns.formattingCodes

--[=[
	@within RoTime
	@private
	@interface Parsed
	.code string
	.startindex number
	.endindex number
]=]

--[=[
	@within RoTime
	@method _parser

	@return Parsed
	@private
]=]
local function parseData(date: string): { code: string, startindex: number, endindex: number }
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
					["startindex"] = i - #context - 1,
					["endindex"] = i - 1,
				})
				context = ""
				triggered = false
				continue
			end

			if char == nil then
				break
			end
			context = `{context}{char}`
		elseif char == "#" then
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
