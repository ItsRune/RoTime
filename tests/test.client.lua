--// Services \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Variables \\--
local RoTime = require(ReplicatedStorage.RoTime).new()
local detectedTimezone = RoTime:getLocalTimezone()

local thirtyDaysFromNow = 0
local firstTimestamp = DateTime.now().UnixTimestamp

warn(RoTime.getHumanTimestamp(firstTimestamp, thirtyDaysFromNow, {
	removeZeros = true,
}))
warn(detectedTimezone)
