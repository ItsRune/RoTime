local Types = require(script.Parent.Parent.typeChecks)

--[=[
	Adds a certain amount of time to the current time.

	@within RoTime
	@method add
	@tag Chainable
	
	@param amount number
	@param type string

	@return RoTime
]=]
return function(self: Types.RoTime, amount: number, type: Types.getFunctionTypes): Types.RoTime
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

	self._now = self._now + (amount * toMult)
	self._nowdt = self._nowdt + ((amount * toMult) * 1000)

	return self
end
