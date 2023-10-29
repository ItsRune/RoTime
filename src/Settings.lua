return {
	Tokenizer = {
		toFormat = "#", -- Prefix before tokenizing | "#H:#M:#S" -> {"#H", "#M", "#S"}

		resultShouldIncludeUnknownTokens = true,
	},

	Patterns = {
		["h"] = { Type = "hour_12" },
		["m"] = { Type = "minute" },
		["s"] = { Type = "second" },
		["mm"] = { Type = "month" },
		["dd"] = { Type = "day_short" },
		["dddd"] = { Type = "day_long" },
		["yy"] = { Type = "year_short" },
		["yyyy"] = { Type = "year_long" },
	},

	Timezones = {
		-- Format: [timeZoneName] = to_add_to_GMT
		-- Types: [string] = number
		["UTC"] = 0,
		["GMT"] = 0,
		["CDT"] = 0,
		["PDT"] = -5,
		["EDT"] = -8,
		["CET"] = 1,

		["America/Philidolphia"] = 0,
		["America/New_York"] = -4,
		["America/Los_Angeles"] = -7,

		["Europe/London"] = 1,
		["Europe/Berlin"] = 1,
		["Europe/Netherlands"] = 2,
		["Europe/Paris"] = 2,

		["Australia/Perth"] = 8,
		["Australia/Sydney"] = 9.5,
		["Australia/Darwin"] = 9.5,
		["Australia/Victoria"] = 10,
		["Australia/Tasmania"] = 10,
		["Australia/Queensland"] = 10,

		["Asia/India"] = 5.5,
		["Asia/Zhongshan"] = 6,
		["Asia/Singapore"] = 8,
		["Asia/Shanghai"] = 8,
		["Asia/Japan"] = 9,

		["Africa/Western"] = 1,
		["Africa/Central"] = 2,
		["Africa/Eastern"] = 3,
	},

	Names = {
		weekDays = {
			"Sunday",
			"Monday",
			"Tuesday",
			"Wednesday",
			"Thursday",
			"Friday",
			"Saturday",
		},
	},
}
