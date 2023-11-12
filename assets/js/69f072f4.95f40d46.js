"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[972],{15828:e=>{e.exports=JSON.parse('{"functions":[{"name":"new","desc":"Constructs a new class.","params":[],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"static","tags":["Constructor"],"since":"2.0.0","source":{"line":63,"path":"src/init.lua"}},{"name":"_warn","desc":"Warns to the console with a prefix.","params":[{"name":"...","desc":"","lua_type":"string"}],"returns":[],"function_type":"method","since":"2.0.0","private":true,"source":{"line":91,"path":"src/init.lua"}},{"name":"_getTokenInformation","desc":"Gets a token\'s information.","params":[{"name":"tokenExpected","desc":"","lua_type":"{ string }"}],"returns":[{"desc":"","lua_type":"{ [string]: string | number }\\r\\n"}],"function_type":"method","since":"2.0.0","private":true,"source":{"line":102,"path":"src/init.lua"}},{"name":"timezone","desc":"Sets the timezone to the specified timezone.","params":[{"name":"newTimezone","desc":"","lua_type":"string"}],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"method","since":"2.0.0","source":{"line":169,"path":"src/init.lua"}},{"name":"addTimezone","desc":"Creates a new timezone with the designated offset.","params":[{"name":"timezoneName","desc":"","lua_type":"string"},{"name":"timezoneOffset","desc":"","lua_type":"number"}],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"method","since":"2.0.0","source":{"line":192,"path":"src/init.lua"}},{"name":"isLeapYear","desc":"Checks if the current time is a leap year.","params":[],"returns":[{"desc":"","lua_type":"boolean"}],"function_type":"method","since":"2.0.0","source":{"line":208,"path":"src/init.lua"}},{"name":"setFormat","desc":"Sets the format if none is provided in methods.","params":[{"name":"formattingString","desc":"","lua_type":"string"}],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"method","tags":["Chainable"],"since":"2.0.0","source":{"line":221,"path":"src/init.lua"}},{"name":"fromNow","desc":"Takes a future time and calculates the difference, returning time duration.","params":[{"name":"input","desc":"","lua_type":"string"},{"name":"format","desc":"","lua_type":"string?"}],"returns":[{"desc":"","lua_type":"number"}],"function_type":"method","since":"2.0.0","source":{"line":235,"path":"src/init.lua"}},{"name":"toNow","desc":"Takes a past time and calculates the difference, returning time duration.","params":[{"name":"input","desc":"","lua_type":"string"},{"name":"format","desc":"","lua_type":"string?"}],"returns":[{"desc":"","lua_type":"number"}],"function_type":"method","since":"2.0.0","source":{"line":259,"path":"src/init.lua"}},{"name":"getDateTime","desc":"Gets the DateTime Instance.","params":[],"returns":[{"desc":"","lua_type":"DateTime"}],"function_type":"method","since":"2.0.0","source":{"line":281,"path":"src/init.lua"}},{"name":"getDate","desc":"Gets the Date.","params":[],"returns":[{"desc":"","lua_type":"string"}],"function_type":"method","since":"2.0.0","source":{"line":294,"path":"src/init.lua"}},{"name":"getTime","desc":"Gets the Time.","params":[],"returns":[{"desc":"","lua_type":"string"}],"function_type":"method","since":"2.0.0","source":{"line":305,"path":"src/init.lua"}},{"name":"getCalender","desc":"Gets the calender for the month.","params":[],"returns":[{"desc":"","lua_type":"{ amountOfDays: number, year: number, isLeapYear: boolean, days: { { dayName: string, isToday: boolean } } }"}],"function_type":"method","since":"2.0.1","source":{"line":316,"path":"src/init.lua"}},{"name":"addition","desc":"Adds an amount of time based on the addition/subtraction type.\\n\\n:::info HEY\\n`RoTime:add(amount, Type)` also works with this method.\\n:::","params":[{"name":"amount","desc":"","lua_type":"number"},{"name":"Type","desc":"","lua_type":"additionSubtractionInterface"}],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"method","tags":["Chainable"],"since":"2.0.0","source":{"line":361,"path":"src/init.lua"}},{"name":"subtract","desc":"Subtracts an amount of time based on the addition/subtraction type.\\n\\n:::info HEY\\n`RoTime:sub(amount, Type)` also works with this method.\\n:::","params":[{"name":"amount","desc":"","lua_type":"number"},{"name":"Type","desc":"","lua_type":"additionSubtractionInterface"}],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"method","tags":["Chainable"],"since":"2.0.0","source":{"line":388,"path":"src/init.lua"}},{"name":"set","desc":"Sets the time to the specified input and format.","params":[{"name":"input","desc":"","lua_type":"string"},{"name":"format","desc":"","lua_type":"string?"}],"returns":[{"desc":"","lua_type":"RoTime"}],"function_type":"method","tags":["Chainable"],"since":"2.0.0","source":{"line":411,"path":"src/init.lua"}},{"name":"format","desc":"Formats the current time with certain formatting parameters.","params":[{"name":"input","desc":"","lua_type":"string"}],"returns":[{"desc":"","lua_type":"string"}],"function_type":"method","tags":["Chainable"],"since":"2.0.0","source":{"line":481,"path":"src/init.lua"}},{"name":"Destroy","desc":"Destroys the module and cleans methods.","params":[],"returns":[{"desc":"","lua_type":"nil"}],"function_type":"method","since":"2.0.0","source":{"line":502,"path":"src/init.lua"}}],"properties":[{"name":"Timer","desc":"","lua_type":"(start: number, finish: number, increment: number?) -> Timer","source":{"line":8,"path":"src/init.lua"}}],"types":[{"name":"additionSubtractionInterface","desc":"","lua_type":"\\"second\\" | \\"minute\\" | \\"hour\\" | \\"day\\" | \\"week\\" | \\"month\\" | \\"year\\"","source":{"line":27,"path":"src/init.lua"}}],"name":"RoTime","desc":"","source":{"line":3,"path":"src/init.lua"}}')}}]);