local formattingCodes = {
    ["h"] = "hour_12";
    ["hh"] = "hour_24";
    ["s"] = "sec";
    ["m"] = "min";
    ["y"] = "year";
    ["yy"] = "year";
    ["yyy"] = "year";
    ["yyyy"] = "year";
    ["YY"] = "year";
    ["YYY"] = "year";
    ["YYYY"] = "year";
    ["d"] = "day_num";
    ["w"] = "week";
    ["mm"] = "month_num";
    ["MM"] = "month_short";
    ["MMM"] = "month_long";
    ["DD"] = "day_short";
    ["DDD"] = "day_long";
    ["a"] = "ampm";
}

local days = {
    [7] = {"Sunday", "Sun"};
    [1] = {"Monday", "Mon"};
    [2] = {"Tuesday", "Tue"};
    [3] = {"Wednesday", "Wed"};
    [4] = {"Thursday", "Thu"};
    [5] = {"Friday", "Fri"};
    [6] = {"Saturday", "Sat"};
}

local months = {
    [1] = {"January", "Jan"};
    [2] = {"February", "Feb"};
    [3] = {"March", "Mar"};
    [4] = {"April", "Apr"};
    [5] = {"May", "May"};
    [6] = {"June", "Jun"};
    [7] = {"July", "Jul"};
    [8] = {"August", "Aug"};
    [9] = {"September", "Sep"};
    [10] = {"October", "Oct"};
    [11] = {"November", "Nov"};
    [12] = {"December", "Dec"};
}


local function addAppropriateOutput(codeType, nowTime)
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

local function parseData(date)
    local lengthOfStr = #tostring(date)
    local triggered = false
    local context = ""
    local codesAndIndices = {}

    for i = 1, lengthOfStr + 1 do
        local char = tostring(date):sub(i, i)
        
        if triggered then
            if formattingCodes[context] and tostring(char) ~= string.sub(context, 1, 1) then
                table.insert(codesAndIndices, {
                    ["code"] = formattingCodes[context];
                    ["startindex"] = i - #context - 1;
                    ["endindex"] = i - 1;
                })
                context = ""
                triggered = false
                continue
            end

            if char == nil then break end
            context = context .. char
        elseif char == "#" then
            if triggered then
                context = context .. char
            else
                triggered = true
            end
        end
    end

    return codesAndIndices
end

return function(self, code)
    local codeData = parseData(code)
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