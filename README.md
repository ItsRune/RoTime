# Project Title

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
<!-- - [Contributing](../CONTRIBUTING.md) -->

## About <a name = "about"></a>

RoTime is a roblox module for manipulating, parsing, timezoning, and validating times. Currently this project is a work in progress and is not intended for published applications.

## Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Usage <a name = "usage"></a>

#### Formatting
```lua
local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))

-- Formats to UTC time.
local formatted = RoTime.new():format("#MM #d, #YYYY #h:#m") --> August 3, 2022 4:31
```

#### Timezones
```lua
local RoTime = require(game:GetService("ReplicatedStorage"):WaitForChild("RoTime"))
local losAngelesTime = RoTime.new():timezone("America/Los_Angeles")

print(losAngelesTime:format("#mm/#d/#yyyy #h:#m #a")) --> 8/2/2022 9:33 PM
```

More features are planned to come!