local patterns = require(script.Parent.patterns)
local formattingCodes = patterns.formattingCodes
local days = patterns.days
local months = patterns.months
local Types = require(script.Parent.Parent.typeChecks)

local function addAppropriateOutput(codeType: string, nowTime: string | {any}): string
    local split = codeType:split("_")
    local name = split[1]
    local type = split[2]

    if name == "day" then
        if type == "num" then
            return tostring(nowTime.day)
        elseif type == "short" then
            return days[nowTime.wday][2]
        elseif type == "long" then
            return days[nowTime.wday][1]
        end
    elseif name == "month" then
        if type == "num" then
            return tostring(nowTime.month)
        elseif type == "short" then
            return months[nowTime.month][2]
        elseif type == "long" then
            return months[nowTime.month][1]
        end
    elseif name == "hour" then
        if type == "12" then
            return tostring((nowTime.hour % 12) == 0 and 12 or nowTime.hour % 12)
        elseif type == "24" then
            return tostring(nowTime.hour)
        end
    elseif name == "week" then
        return tostring(nowTime.wday)
    elseif name == "min" then
        if nowTime.min > 9 then
            return tostring(nowTime.min)
        else
            return "0" .. tostring(nowTime.min)
        end
    elseif name == "sec" then
        if nowTime.sec > 9 then
            return tostring(nowTime.sec)
        else
            return "0" .. tostring(nowTime.sec)
        end
    elseif name == "year" then
        return tostring(nowTime.year)
    elseif name == "ampm" then
        if nowTime.hour < 12 then
            return "AM"
        else
            return "PM"
        end
    end

    return "Unknown"
end

return function(self: Types.RoTime, code: string): string
    local codeData = self._parser(code)
    local newCode = ""
    local alreadyDone = {}
    local nowDate = os.date("!*t", self._now)
    
    for i = 1, #tostring(code) do
        local didSomething = false
        for index,_ in next, codeData do
            if (i >= codeData[index].startindex and i <= codeData[index].endindex) and alreadyDone[codeData[index].endindex] == true then
                didSomething = true
                continue
            end

            if codeData[index].startindex == i then
                local dating = addAppropriateOutput(codeData[index].code, nowDate)
                if dating == "Unknown" then
                    break
                end

                newCode = newCode .. dating
                alreadyDone[codeData[index].endindex] = true
                didSomething = true
                break
            end
        end

        if not didSomething then
            newCode = newCode .. tostring(code):sub(i, i)
        end
    end

    return newCode
end