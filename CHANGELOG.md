# Changelog 

## [0.0.2]
### Added
- Add `RoTime:set`
    - Sets a specified time with a given format.
    - Usage: `RoTime:set("12:00:00 AM", "#h:#m:#s #a")`
- Add `RoTime:reset`
    - Resets the time to the current unix time.
    - Usage: `RoTime:reset()`
- Add `RoTime:getCalender`
    - Returns a table with each day of the month's name and week number.
    - Usage: `RoTime:getCalender(12, 2020)`
- Add `RoTime:fromNow`
    - Returns a number of seconds from the current time to the given time.
    - Usage: `RoTime:fromNow("12:00:00 AM", "#h:#m:#s #a")`
- Add `RoTime.formatSeconds`
    - Formats seconds into a table with years, months, weeks, days, hours, minutes, and seconds.
    - Usage: `RoTime:formatSeconds(1_000_000)`

### Changed
- `RoTime:timezone` has been changed to `RoTime:setTimezone`
- Optimized internal methods to be more efficient.

### Fixed
- Fixed `calenderData`'s documented interface to match the actual data it has.

## [0.0.1]
### Added
- Add `RoTime:getDate`
    - Returns the current date as a string.
    - Usage: `RoTime:getDate()`
- Add `RoTime:getTime`
    - Returns the current time as a string.
    - Usage: `RoTime:getTime()`
- Add `RoTime:getTimezone`
    - Returns the current timezone as a string.
    - Usage: `RoTime:getTimezone()`
- Add `RoTime:addTimezone`
    - Adds a timezone to the list of timezones along with their GMT offsets.
    - Usage: `RoTime:addTimezone("EST", -5)`
- Add `RoTime:removeTimezone`
    - Removes a timezone from the list of timezones.
    - Usage: `RoTime:removeTimezone("EST")`

### Changed
- `RoTime:utc` has been changed to `RoTime:UnixMillis`