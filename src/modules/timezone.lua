local Zones = {
    ["America/Los_Angeles"] = -7;
    ["America/New_York"] = -4;
    ["America/PDT"] = -5;
    ["America/EDT"] = -8;
    ["America/Philidolphia"] = 0;
    ["America/CDT"] = 0;
    ["Europe/CET"] = 1;
    ["Europe/Netherlands"] = 2;
    ["Europe/London"] = 1;
    ["Europe/Paris"] = 2;
    ["Europe/Berlin"] = 1;
    ["Australia/Sydney"] = 9.5;
    ["Australia/Darwin"] = 9.5;
    ["Australia/Victoria"] = 10;
    ["Australia/Tasmania"] = 10;
    ["Australia/Queensland"] = 10;
    ["Australia/Perth"] = 8;
    ["Asia/Shanghai"] = 8;
    ["Asia/Zhongshan"] = 6;
    ["Asia/India"] = 5.5;
    ["Asia/Japan"] = 9;
    ["Asia/Singapore"] = 8;
    ["Africa/Western"] = 1;
    ["Africa/Eastern"] = 3;
    ["Africa/Central"] = 2;
}

return function(self, zone)
    local zoneTime = Zones[zone]
    if not zoneTime then
        return error(debug.traceback("Invalid zone was provided. Please double check your spelling & capitalization!"), 3)
    end

    local nowGMT = DateTime.now().UnixTimestamp
    --/ Utc and Gmt are the same.
    self._now = nowGMT + math.floor(60 * 60 * zoneTime)
    self._nowdt = nowGMT + math.floor(60 * 60 * zoneTime) * 1000

    return self
end