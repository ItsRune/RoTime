local Types = require(script.Parent.Parent.typeChecks)
return function(self: Types.RoTime): number
	return os.time()
end
