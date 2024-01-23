# Timezones

## Adding
If you'd like to add your own custom timezone to the module, there's an easy method setup for you to do so! Simply name the timezone, and then add the offset from UTC. For example, if you wanted to add a timezone for the United Kingdom, you would do the following:
```lua
local RoTime = require(10459870631).new()
RoTime:addTimezone("United Kingdom", 0)
```

## Removing
If you'd like to remove a timezone, you can do so by using the `removeTimezone` method. For example, if you wanted to remove the timezone for the United Kingdom, you would do the following:
```lua
local RoTime = require(10459870631).new()
RoTime:removeTimezone("United Kingdom")
```

## Defaults
The module comes with a few default timezones, which are listed below:
- UTC
- GMT
- PDT
- PST
- EST
- EDT
- DST
- HST
- AKDT
- UMST
- MDT
- CAST
- CDT
- CCST
- SPST
- UEDT
- VST
- PYT
- ADT
- CBST
- SWST
- PSST
- NDT
- ESAST
- AST
- SEST
- GDT
- MST
- BST
- CVST
- GST
- WEDT
- CEDT
- RDT
- WCAST
- NST
- MEDT
- SDT
- EEDT
- SAST
- FDT
- TDT
- JDT
- LST
- JST
- KST
- EAST
- MSK
- SAMT
- IDT
- GET
- CST
- WAST
- YEKT
- PKT
- IST
- SLST
- NCAST
- NAST
- MPST
- TST
- UST
- NAEST
- ACST
- AEST
- WPST
- YST
- CPST
- NZST
- FST
- KDT
- SST