--[=[
	@class Constructor
]=]
local Types = require(script.typeChecks)

--[=[
	@class RoTime
]=]

--[=[
	Main constructor for RoTime.

	@within Constructor
	@function new
	@return RoTime
]=]
local function Constructor(): Types.RoTime
	local time = {}
	local mt = {}

	mt.__index = mt

	for _, v in next, script.modules:GetChildren() do
		if v:IsA("ModuleScript") then
			local data = require(v)

			if typeof(data) == "function" then
				mt[v.Name] = data
				continue
			end

			if typeof(data) == "table" and data["alias"] ~= nil then
				for _, alias in next, data["alias"] do
					mt[alias] = data["func"]
				end
				continue
			end

			if typeof(data) == "table" and data["alias"] == nil then
				for _, b in next, data do
					mt[b.alias] = b.func
				end
			end
		end
	end

	--[=[
		@prop _now number
		@within RoTime
		@readonly
		@private
	]=]
	time._now = DateTime.now().UnixTimestamp

	--[=[
		@prop _nowdt DateTime
		@within RoTime
		@readonly
		@private
	]=]
	time._nowdt = DateTime.now()

	--[=[
		@prop _timezone string
		@within RoTime
		@readonly
		@private
	]=]
	time._timezone = "UTC"

	--[=[
		@prop _globalFormat string
		@within RoTime
		@readonly
		@private
	]=]
	time._globalFormat = "#dd/#mm/#yyyy #h:#m:#s #a"

	return setmetatable(time, mt)
end

local x = {}
x.new = Constructor

return x
