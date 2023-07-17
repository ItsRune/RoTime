local patterns = require(script.Parent.patterns)
local formattingCodes = patterns.formattingCodes

return function(self, newDate, format)
    -- Sets the self._now variable to a new date
    -- @param newDate: string
    -- @param format: string
    -- @returns self

    local codeData = self._parser(format)
    
    warn(codeData)
end