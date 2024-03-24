--// Services \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Variables \\--
local RoTime = require(ReplicatedStorage.RoTime).new()
local detectedTimezone = RoTime:getLocalTimezone()

warn(detectedTimezone)
