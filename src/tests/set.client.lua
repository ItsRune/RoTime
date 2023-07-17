local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))

local time = RoTime.new()

local x = time:day(3)

print(x:format("#mm/#d/#yyyy"))