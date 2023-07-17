local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))

local timerTest = RoTime.new():createTimer(1, "hour", 5)
local timer2Test = RoTime.new():createTimer(os.time() + 3600, "second", 30, os.time())

timerTest.OnUpdate:Connect(function(Elapsed)
    warn("timerTest Elapsed: " .. Elapsed)
end)

timer2Test.OnUpdate:Connect(function(Elapsed)
    warn("timer2Test Elapsed: " .. Elapsed)

    if Elapsed % 5 == 0 then
        timer2Test:Pause()
        warn("Paused")
        task.wait(3)
        warn("Resumed")
        timer2Test:Resume()
    end
end)

timerTest.OnCompletion:Connect(function()
    warn("timerTest completed")
end)

timer2Test.OnCompletion:Connect(function()
    warn("timer2Test completed")
end)

timerTest:Start()
timer2Test:Start()