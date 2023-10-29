--// Variables \\--
type Options = {
	toFormat: string | "#",
}

type token = {
	code: string,
	expected: string,
	indexStart: number,
	indexEnd: number,
}

--// Functions \\--
local function tokenize(input: string, opts: Options?): { { token }? }
	input = tostring(input)

	local strLen = string.len(input)
	local strIndex = 0
	local tokens = {}

	while strIndex < strLen do
		strIndex += 1
	end
end

local function check()
	--
end

return {
	tokenize = tokenize,
	check = check,
}
