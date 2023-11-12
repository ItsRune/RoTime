---
sidebar_position: 2
---

# Why use RoTime?
Let's face it, we've all been there. Whether it's creating a countdown timer, formatting time, accounting for certain timezones, or just getting the current time, it's a pain to do. RoTime aims to make this process as easy as possible.

### Features

1. **Easy to use** - RoTime is designed to be as easy to use as possible.
2. **Customizable** - RoTime is designed to be as customizable as possible. You can change the time format, timezone, and more.
3. **Chainable** - RoTime is designed to be as chainable as possible. You can chain methods to make your code look cleaner.

### Examples

```lua
local RoTime = require(10459870631).new()

print(RoTime:getTime()) -- 12:00:00 AM
print(RoTime:getDate()) -- 1/1/1970
print(RoTime:getTimezone()) -- UTC
print(RoTime:format("#h Hours #m Minutes #s Seconds")) -- 0 Hours 0 Minutes 0 Seconds
print(RoTime:timezone("America/New_York")) -- Changes the timezone to America/New_York
```