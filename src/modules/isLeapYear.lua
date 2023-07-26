local Types = require(script.Parent.Parent.typeChecks)
return function(self: Types.RoTime, year: number?): boolean
	local unix = self:unix()

	if not tonumber(year) then
		local now = os.date("*t", unix)
		year = now.year
	end

	return ((year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0))
end
