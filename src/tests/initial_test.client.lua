local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))

local time = RoTime.new()

time = time:timezone("America/New_York")
time = time:add(2, "hour"):add(30, "minute")

warn(time:format("#h:#m:#s"))