local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))

local aussie = RoTime.new()
local ny = RoTime.new()
local cali = RoTime.new()

ny = ny:timezone("America/New_York")
cali = cali:timezone("America/Los_Angeles")
aussie = aussie:timezone("Australia/Sydney")

RoTime.new():timezone("Australia")

warn(ny:format("It's currently #mm/#d/#y #h:#m:#s #a in New York!"))
warn(cali:format("It's currently #mm/#d/#y #h:#m:#s in California!"))
warn(aussie:format("It's currently #mm/#d/#y #h:#m:#s #a in Australia!"))