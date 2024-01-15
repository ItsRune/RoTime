---
sidebar_position: 4
---

# Formatting Patterns

## What are formatting patterns?
Formatting patterns are a way to format time. For example, if you wanted to format time to look like this: `12:00:00 AM`, you would use the formatting pattern `#h:#m:#s #a`. Formatting patterns are used in the `RoTime:format()` method. Each pattern must begin with a "#" and end with a letter.

## List of formatting patterns
| Pattern | Description | Type | Example |
| --- | --- | --- | --- |
| `#h` | The hour of the day (12 hour) | Number | `1` |
| `#hh` | The hour of the day (24 hour) | Number | `13` |
| `#m` | The minute of the hour | Number | `1` |
| `#s` | The second of the minute | Number | `1` |
| `#ms` | The current milliseconds | Number | `924` |
| `#mm` | The month of the year | Number | `1` |
| `#mmm` | Shortened month of the year | String | `Jan` |
| `#mmmm` | Full month of the year | String | `January` |
| `#dd` | Shortened day of the month | String | `Mon` |
| `#dddd` | Full day of the month | String | `Monday` |
| `#yd` | Gets the day of the year (1/365) | Number | `1` |
| `#myd` | Gets the max amount of days in the year | Number | `365` |
| `#yyyy` | The full year | Number | `2021` |
| `#yy` | The year but shortened | Number | `21` |
| `#z` | The current timezone | String | `UTC` |
| `#w` | Gets the week day number | Number | `3` |
| `#ww` | Gets the amount of weeks it's been since January | Number | `3` |
| `#u` | The unix timestamp | Number | `1705303405` |
| `#uu` | The unix timestamp (Milliseconds) | Number | `1705303405915` |
| `#a` | The AM/PM of the time | String | `AM` |