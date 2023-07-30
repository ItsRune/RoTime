# Timezones

## Adding
If you'd like to add your own custom timezone to the module, there's an easy method setup for you to do so! Simply name the timezone, and then add the offset from UTC. For example, if you wanted to add a timezone for the United Kingdom, you would do the following:
```lua
local RoTime = require(script.Parent).new()
RoTime:addTimezone("United Kingdom", 0)
```

## Setting
If you'd like to set the timezone, you can do so by using the `setTimezone` method. For example, if you wanted to set the timezone to the United Kingdom, you would do the following:
```lua
local RoTime = require(script.Parent).new()
RoTime:setTimezone("United Kingdom")
```

## Removing
If you'd like to remove a timezone, you can do so by using the `removeTimezone` method. For example, if you wanted to remove the timezone for the United Kingdom, you would do the following:
```lua
local RoTime = require(script.Parent).new()
RoTime:removeTimezone("United Kingdom")
```

## Defaults
The module comes with a few default timezones, which are listed below:
- GMT
- America/Philidolphia
- America/CDT
- America/New_York
- America/PDT
- America/Los_Angeles
- America/EDT
- Europe/CET
- Europe/London
- Europe/Berlin
- Europe/Netherlands
- Europe/Paris
- Australia/Perth
- Australia/Sydney
- Australia/Darwin
- Australia/Victoria
- Australia/Tasmania
- Australia/Queensland
- Asia/India
- Asia/Zhongshan
- Asia/Singapore
- Asia/Shanghai
- Asia/Japan
- Africa/Western
- Africa/Central
- Africa/Eastern