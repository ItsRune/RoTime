---
sidebar_position: 4
---

# Formatting Patterns

## What are formatting patterns?
Formatting patterns are a way to format time. For example, if you wanted to format time to look like this: `12:00:00 AM`, you would use the formatting pattern `#h:#m:#s #a`. Formatting patterns are used in the `RoTime:format()` method. Each pattern must begin with a "#" and end with a letter.

## List of formatting patterns
| Pattern | Description | Type | Example |
| --- | --- | --- | --- |
| `#d` | The day of the month | Number | `1` |
| `#DD` | Shortened day of the month | String | `Mon` |
| `#DDD` | Full day of the month | String | `Monday` |
| `#mm` | The month of the year | Number | `1` |
| `#MM` | Shortened month of the year | String | `Jan` |
| `#MMM` | Full month of the year | String | `January` |
| `#y` | The year | Number | `2021` |
| `#h` | The hour of the day (12 hour) | Number | `1` |
| `#hh` | The hour of the day (24 hour) | Number | `13` |
| `#m` | The minute of the hour | Number | `1` |
| `#s` | The second of the minute | Number | `1` |
| `#a` | The AM/PM of the time | String | `AM` |