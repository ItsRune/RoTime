local formattingCodes = {
	["h"] = "hour_12",
	["hh"] = "hour_24",
	["s"] = "sec",
	["m"] = "min",
	["y"] = "year",
	["yy"] = "year",
	["yyy"] = "year",
	["yyyy"] = "year",
	["YY"] = "year",
	["YYY"] = "year",
	["YYYY"] = "year",
	["d"] = "day_num",
	["w"] = "week",
	["mm"] = "month_num",
	["MM"] = "month_short",
	["MMM"] = "month_long",
	["DD"] = "day_short",
	["DDD"] = "day_long",
	["a"] = "ampm",
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
}
