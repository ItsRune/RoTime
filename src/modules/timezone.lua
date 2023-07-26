local Types = require(script.Parent.Parent.typeChecks)
local Zones = {
	["America/Philidolphia"] = 0,
	["America/CDT"] = 0,
	["America/New_York"] = -4,
	["America/PDT"] = -5,
	["America/Los_Angeles"] = -7,
	["America/EDT"] = -8,

	["Europe/CET"] = 1,
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
}

return function(self: Types.RoTime, zone: Types.Zones): Types.RoTime
	local zoneTime = Zones[zone]
	if not zoneTime then
		return error(
			debug.traceback("Invalid zone was provided. Please double check your spelling & capitalization!", 2)
		)
	end

	local nowGMT = DateTime.now().UnixTimestamp
	--/ Utc and Gmt are the same.
	self._now = nowGMT + math.floor(60 * 60 * zoneTime)
	self._nowdt = DateTime.fromUnixTimestamp(self._now)
	self._timezone = zone

	return self
end
