return function(self, amount, type)
    local toMult = 0

    if type == "second" then
        toMult = 1
    elseif type == "minute" then
        toMult = 60
    elseif type == "hour" then
        toMult = 3600
    elseif type == "day" then
        toMult = 86400
    elseif type == "week" then
        toMult = 604800
    elseif type == "month" then
        toMult = 2592000
    elseif type == "year" then
        toMult = 31536000
    end

    local multiAmount = (amount * toMult)
    warn(multiAmount)
    
    self._now -= multiAmount
    self._nowdt = DateTime.fromUnixTimestamp(self._now)

    return self
end