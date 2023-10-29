# RoTime

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
<!-- - [Contributing](../CONTRIBUTING.md) -->

## About <a name = "about"></a>

RoTime is a roblox module for manipulating, parsing, timezoning, and validating times. Currently this project is a work in progress and is not intended for published applications.

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Installation is pretty simple, just get the [module](https://www.roblox.com/library/10459870631/RoTime) and place it into `ReplicatedStorage` then you're basically finished.

```lua
local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))
```

## Usage <a name = "usage"></a>

#### Formatting
```lua
-- Formats to UTC time.
local formatted = RoTime.new():format("#MM #d, #YYYY #h:#m") --> August 3, 2022 4:31
```

#### Timezones
```lua
local losAngelesTime = RoTime.new():timezone("America/Los_Angeles")

print(losAngelesTime:format("#mm/#d/#yyyy #h:#m #a")) --> 8/2/2022 9:33 PM
```

#### Adding / Subtracting
```lua
local oneHourAhead = RoTime.new():add(1, "hour")
local oneMinuteBehind = RoTime.new():subtract(1, "minute")

-- Assuming right now is 1:36
print(oneHourAhead:format("#h:#m")) --> 2:36
print(oneMinuteBehind:format("#h:#m")) --> 1:35
```

#### Timers

##### Creating Timers
```lua
-- (howLong : number, type : string, step, startAt)
local myTimer = RoTime.new():createTimer(1, "minute", 1, 0)
```

##### Functions
```lua
myTimer:Start() -- Starts the timer.
myTimer:Pause() -- Pauses the timer.
myTimer:Resume() -- Resumes the timer after being paused.
myTimer:Cancel() -- Cancels the timer entirely.
```

##### Connections
```lua
-- elapsedTime will always be how many seconds since start.
myTimer.OnUpdate:Connect(function(elapsedTime)
    print("myTimer's elapsed time: " .. elapsedTime)
end)

myTimer.OnCompletion:Connect(function()
    print("myTimer's finished!")
end)
```