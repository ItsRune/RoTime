--// Services \\--
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Variables \\--
local RoTime = require(ReplicatedStorage.RoTime).new()

--// Main \\--
warn(RoTime:timezone(RoTime:getLocalTimezone()):format("#mmmm #dd, #yyyy #hh:#m:#s"))
