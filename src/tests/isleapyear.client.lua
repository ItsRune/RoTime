local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))

local time = RoTime.new()

warn(time:isLeapYear()) -- false
warn(time:isLeapYear(2020)) -- true