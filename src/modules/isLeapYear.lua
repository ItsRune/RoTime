return function(self)
    local unix = self:unix()
    local now = os.date("*t", unix)
    local year = now.year

    return (
        (year % 4 == 0 and year % 100 ~= 0) or
        (year % 400 == 0)
    )
end