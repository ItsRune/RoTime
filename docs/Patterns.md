---
sidebar_position: 4
---

# Formatting Patterns

## What are formatting patterns?
Formatting patterns are a way to format time. For example, if you wanted to format time to look like this: `12:00:00 AM`, you would use the formatting pattern `#h:#m:#s #a`. Formatting patterns are used in the `RoTime:format()` method. Each pattern must begin with a "#" and end with a letter.

## List of formatting patterns
| Pattern | Description | Type | Example |
| --- | --- | --- | --- |
| `#yd` | Gets the day of the year (1/365) | Number | `1` |
| `#dd` | Shortened day of the month | String | `Mon` |
| `#dddd` | Full day of the month | String | `Monday` |
| `#ms` | The current milliseconds | Number | `924` |
| `#mm` | The month of the year | Number | `1` |
| `#mmm` | Shortened month of the year | String | `Jan` |
| `#mmmm` | Full month of the year | String | `January` |
| `#yyyy` | The full year | Number | `2021` |
| `#yy` | The year but shortened | Number | `21` |
| `#h` | The hour of the day (12 hour) | Number | `1` |
| `#hh` | The hour of the day (24 hour) | Number | `13` |
| `#w` | Gets the week day number | Number | `3` |
| `#ww` | Token not implemented yet | String | `Not_Implemented` |
| `#m` | The minute of the hour | Number | `1` |
| `#s` | The second of the minute | Number | `1` |
| `#a` | The AM/PM of the time | String | `AM` |
| `#z` | The current timezone | String | `UTC` |