local RunService = game:GetService("RunService")
local Types = require(script.Parent.Parent.typeChecks)
local cachedIds = {}
local fromType = {
    ["hour"] = 3600;
    ["minute"] = 60;
    ["second"] = 1;
}

return function(self: Types.RoTime, amount: number, type: string, step: number?, startAt: number?) : Types.Timer
    local timer = {}
    local mt = {}
    mt.__index = mt

    assert(typeof(amount) == "number", debug.traceback("Expected number, got " .. typeof(amount), 2))
    assert(fromType[type] ~= nil, debug.traceback("Expected one of the following types: hour, minute, second", 2))

    local toWaitFor = amount * fromType[type]

    timer._updateEvent = Instance.new("BindableEvent")
    timer._completeEvent = Instance.new("BindableEvent")

    timer.OnUpdate = timer._updateEvent.Event
    timer.OnCompletion = timer._completeEvent.Event
    
    timer._id = math.random(1, 1000000)
    timer._startTime = 0
    timer._lastUpdate = os.time()
    timer._now = (tonumber(startAt) == nil) and 0 or (tonumber(startAt) <= 0) and 0 or tonumber(startAt)
    timer._step = (tonumber(step) == nil) and 1 or (tonumber(step) <= 0) and 1 or tonumber(step)
    
    timer._started = false
    timer._paused = false
    
    timer._class = "Timer"

    local timerMod = setmetatable(timer, mt)

    if table.find(cachedIds, timerMod._id) ~= nil then
        timer._id = math.random(1, 1000000)
    end
    table.insert(cachedIds, timerMod._id)

    function mt.Start(this: Types.Timer) : nil
        warn(timerMod._class)
        if timerMod._started or (timerMod["_class"] == nil or timerMod["_class"] ~= "Timer") then return end
        
        timerMod._started = true
        timerMod._startTime = os.time()
    end

    function mt.Pause(this: Types.Timer) : nil
        if not timerMod._started then return end
        timerMod._paused = true
    end

    function mt.Resume(this: Types.Timer) : nil
        if not timerMod._paused then return end
        timerMod._paused = false
    end

    function mt.Cancel(this: Types.Timer) : nil
        if not timerMod._started or (timerMod["_class"] == nil or timerMod["_class"] ~= "Timer") then return end
        RunService:UnbindFromRenderStep(timerMod._id)
        timerMod._class = "CancelledTimer"
        return nil
    end

    RunService:BindToRenderStep(timerMod._id, Enum.RenderPriority.Last.Value, function()
        if timerMod._paused or timerMod._started == false then return end
        if os.time() - timerMod._lastUpdate >= timerMod._step then
            if (timerMod._now >= toWaitFor) then
                timerMod._completeEvent:Fire()
                table.remove(cachedIds, table.find(cachedIds, timerMod._id))
                timerMod:Cancel()
                return
            end

            timerMod._lastUpdate = os.time()
            timerMod._now = timerMod._now + timerMod._step
            timerMod._updateEvent:Fire(timerMod._now)
        end
    end)

    mt.__call = mt.Start

    return timerMod
end