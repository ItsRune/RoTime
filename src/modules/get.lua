return function(self, type)
    local date = os.date("!*t", self._now)

    local typeConversion = {
        ["year"] = date.year;
        ["month"] = date.month;
        ["week"] = date.wday;
        ["day"] = date.day;
        ["hour"] = date.hour;
        ["minute"] = date.min;
        ["second"] = date.sec;
    }

    assert(typeConversion[type] ~= nil, debug.traceback("Expected one of the following types: year, month, week, day, hour, minute, second", 2))
    return typeConversion[type]
end