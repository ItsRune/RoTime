local formattingCodes = {
	-- Format: [code] = { "method", len of value - "#code", is not erect }
	["h"] = { "hour_12", 0, true },
	["hh"] = { "hour_24", -1, true },
	["s"] = { "sec", 0 },
	["m"] = { "min", 0 },
	["yy"] = { "year", 1, true },
	["YY"] = { "year", 1, true },
	["yyyy"] = { "year", -1, true },
	["YYYY"] = { "year", -1, true },
	["d"] = { "day_num", 0, true },
	["w"] = { "week", -1, true },
	["mm"] = { "month_num", 0, false },
	["MM"] = { "month_short", 0 },
	["DD"] = { "day_short", 0 },
	["a"] = { "ampm", 0 },
	-- ["MMM"] = { "month_long", 0 }, -- Max index is not supported
	-- ["DDD"] = { "day_long", 0 }, -- Max index is not supported
}

local days = {
	[7] = { "Sunday", "Sun" },
	[1] = { "Monday", "Mon" },
	[2] = { "Tuesday", "Tue" },
	[3] = { "Wednesday", "Wed" },
	[4] = { "Thursday", "Thu" },
	[5] = { "Friday", "Fri" },
	[6] = { "Saturday", "Sat" },
}

local months = {
	[1] = { "January", "Jan" },
	[2] = { "February", "Feb" },
	[3] = { "March", "Mar" },
	[4] = { "April", "Apr" },
	[5] = { "May", "May" },
	[6] = { "June", "Jun" },
	[7] = { "July", "Jul" },
	[8] = { "August", "Aug" },
	[9] = { "September", "Sep" },
	[10] = { "October", "Oct" },
	[11] = { "November", "Nov" },
	[12] = { "December", "Dec" },
}

return {
	formattingCodes = formattingCodes,
	days = days,
	months = months,
	triggerChar = "#", -- The character that triggers a formatting code
}
