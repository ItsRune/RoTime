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

	["UTC"] = 0,
	["GMT"] = 0,
}

--[=[
	Sets the current class's timezone to the one specified.

	@within RoTime
	@tag Chainable
	@method timezone

	@param zone string
	
	@return RoTime
]=]

--[=[
	Adds a new timezone defined by the developer.

	```lua
	RoTime:addTimezone("Texas", -6)
	```

	@within RoTime
	@tag Chainable
	@method addTimezone

	@param zoneName string
	@param zoneOffset number

	@return RoTime
]=]

--[=[
	Removes a timezone.

	@within RoTime
	@tag Chainable
	@method removeTimezone

	@param zoneName string

	@return RoTime
]=]

--[=[
	Gets the current timezone's name.

	@within RoTime
	@method getTimezone

	@return string
]=]
return {
	{
		name = "timezone",
		func = function(self: Types.RoTime, zone: Types.Zones): Types.RoTime
			local zoneTime = Zones[zone]
			if not zoneTime then
				return error(
					debug.traceback("Invalid zone was provided. Please double check your spelling & capitalization!", 2)
				)
			end

			local nowGMT = DateTime.now().UnixTimestamp

			self._now = nowGMT + math.floor(60 * 60 * zoneTime)
			self._nowdt = DateTime.fromUnixTimestamp(self._now)
			self._timezone = zone

			return self
		end,
	},

	{
		name = "addTimezone",
		func = function(self: Types.RoTime, zoneName: string, zoneOffset: number): Types.RoTime
			assert(Zones[zoneName] == nil, "Zone already exists!")
			Zones[zoneName] = zoneOffset
			return self
		end,
	},

	{
		name = "removeTimezone",
		func = function(self: Types.RoTime, zoneName: string): Types.RoTime
			assert(Zones[zoneName], "Zone already doesn't exist!")
			Zones[zoneName] = nil
			return self
		end,
	},

	{
		name = "getTimezone",
		func = function(self: Types.RoTime): string
			return self._timezone
		end,
	},
}
