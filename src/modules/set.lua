local Types = require(script.Parent.Parent.typeChecks)
return function(self: Types.RoTime, toSetTo: string, format: string?): Types.RoTime
    return self, "Broken"
    -- assert(typeof(toSetTo) == "number", debug.traceback("Expected number, got " .. typeof(toSetTo), 2))
    -- local date = os.date("!*t", self._now)

    -- warn(self)

    -- return self
end