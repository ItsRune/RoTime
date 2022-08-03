local Zones = {
    --/ UTC and GMT are the same thing.
    ["America/LA"] = -7;
    -- ["America/NY"] = -4;
    -- ["America/LA-PDT"] = -5;
    -- ["America/NY-EDT"] = -8;
}

return function (self, zone)
    local zoneTime = Zones[zone]
    if not zoneTime then
        return error(debug.traceback("Invalid zone was provided. Please double check your spelling & capitalization!"), 3)
    end

    local now = self._now
    local nowTick = self._nowtick
end