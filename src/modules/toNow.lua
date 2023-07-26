local Types = require(script.Parent.Parent.typeChecks)
local Patterns = require(script.Parent.Patterns)

-- selene: allow(unused_variable)
return function(self: Types.RoTime, toFormatFrom: string): Types.RoTime
	local globalFormat = self._globalFormat

	return self
end
