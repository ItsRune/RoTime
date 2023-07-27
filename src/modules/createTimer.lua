local RunService = game:GetService("RunService")
local Types = require(script.Parent.Parent.typeChecks)
local cachedIds = {}
local fromType = {
	["year"] = 31536000,
	["month"] = 2592000,
	["day"] = 86400,
	["hour"] = 3600,
	["minute"] = 60,
	["second"] = 1,
}

-- selene: allow(unused_variable)
-- selene: allow(shadowing)

--[=[
	@within RoTime
	@interface Timer
	.OnUpdate RBXScriptSignal
	.OnCompletion RBXScriptSignal

	.Start (self: Timer) -> nil
	.Pause (self: Timer) -> nil
	.Resume (self: Timer) -> nil
	.Cancel (self: Timer) -> nil
]=]

--[=[
	Creates a timer that can be used to track the amount of time until a certain time.

	```lua
	-- This timer will update every 5 seconds, will start at 1 minute and last for 1 hour.
	local myTimer = RoTime:createTimer(1, "hour", 5, 60)

	myTimer.OnUpdate:Connect(function(elapsedTime: number)
		print("Timer updated! Elapsed time: " .. elapsedTime)
	end)

	myTimer.OnCompletion:Connect(function()
		print("Timer completed!")
	end)

	myTimer:Start()
	```

	@within RoTime
	@method createTimer

	@param waitForAmount number
	@param incrementType string
	@param step number | nil
	@param startAt number | nil
	
	@return Timer
	:::danger
	At this moment, [**Signal**](https://sleitnick.github.io/RbxUtil/api/Signal/) is not being used! Please remember to disconnect any connections you make!
	:::
]=]
return function(
	self: Types.RoTime,
	waitForAmount: number,
	incrementType: string,
	step: number?,
	startAt: number?
): Types.Timer
	local timer = {}
	local mt = {}
	mt.__index = mt

	assert(typeof(waitForAmount) == "number", debug.traceback("Expected number, got " .. typeof(waitForAmount), 2))
	assert(
		fromType[incrementType] ~= nil,
		debug.traceback("Expected one of the following types: hour, minute, second", 2)
	)

	local toWaitFor = waitForAmount * fromType[incrementType]

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

	function mt:Start(): nil
		if timerMod._started or (timerMod["_class"] == nil or timerMod["_class"] ~= "Timer") then
			return
		end

		timerMod._started = true
		timerMod._startTime = os.time()
	end

	function mt:Pause(): nil
		if not timerMod._started then
			return
		end
		timerMod._paused = true
	end

	function mt:Resume(): nil
		if not timerMod._paused then
			return
		end
		timerMod._paused = false
	end

	function mt:Cancel(): nil
		if not timerMod._started or (timerMod["_class"] == nil or timerMod["_class"] ~= "Timer") then
			return
		end
		RunService:UnbindFromRenderStep(timerMod._id)
		timerMod._class = "CancelledTimer"
		return nil
	end

	RunService:BindToRenderStep(timerMod._id, Enum.RenderPriority.Last.Value, function()
		if timerMod._paused or timerMod._started == false then
			return
		end
		if os.time() - timerMod._lastUpdate >= timerMod._step then
			if timerMod._now >= toWaitFor then
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
