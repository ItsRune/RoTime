export type Zones =
	"America/Philidolphia"
	| "America/CDT"
	| "America/New_York"
	| "America/PDT"
	| "America/Los_Angeles"
	| "America/EDT"
	| "Europe/CET"
	| "Europe/London"
	| "Europe/Berlin"
	| "Europe/Netherlands"
	| "Europe/Paris"
	| "Australia/Perth"
	| "Australia/Sydney"
	| "Australia/Darwin"
	| "Australia/Victoria"
	| "Australia/Tasmania"
	| "Australia/Queensland"
	| "Asia/India"
	| "Asia/Zhongshan"
	| "Asia/Singapore"
	| "Asia/Shanghai"
	| "Asia/Japan"
	| "Africa/Western"
	| "Africa/Central"
	| "Africa/Eastern"
	| "UTC"

export type getFunctionTypes = "second" | "minute" | "hour" | "day" | "week" | "month" | "year"
export type calenderData = {
	weekCount: number,
	totalDays: number,
	calender: { [number]: string },
}

export type RoTime = {
	-- Private Properties
	_now: number,
	_nowdt: DateTime,
	_globalFormat: string,
	_timezone: string,

	-- Setters
	add: (self: RoTime, time: number, unit: string) -> RoTime,
	addTimezone: (self: RoTime, zoneName: string, zoneOffset: number) -> RoTime,
	createTimer: (self: RoTime, amount: number, type: string, step: number?, startAt: number?) -> Timer,
	removeTimezone: (self: RoTime, zoneName: string) -> RoTime,
	setGlobalFormat: (self: RoTime, format: string) -> RoTime,
	setTimezone: (self: RoTime, timezone: Zones) -> RoTime,
	subtract: (self: RoTime, time: number, unit: string) -> RoTime,
	set: (self: RoTime, toSetTo: string, formatToUse: string?, ignoreWarnings: boolean?) -> RoTime,

	-- Getters
	format: (self: RoTime, formattingString: string) -> string,
	getDate: (self: RoTime) -> string,
	getTime: (self: RoTime) -> string,
	get: (self: RoTime, type: string) -> number,
	isLeapYear: (self: RoTime) -> boolean,
	Unix: (self: RoTime) -> number,
	UnixMillis: (self: RoTime) -> number,

	-- Disabled
	getCalender: (self: RoTime) -> {},
	fromNow: (self: RoTime, destinationDate: string, formatToUse: string?) -> RoTime,
}

export type Timer = {
	_updateEvent: BindableEvent,
	_completeEvent: BindableEvent,

	OnUpdate: RBXScriptSignal,
	OnCompletion: RBXScriptSignal,

	_id: number,
	_startTime: number,
	_lastUpdate: number,
	_now: number,
	_step: number,

	_started: boolean,
	_paused: boolean,

	_class: string,

	Start: (self: Timer) -> nil,
	Pause: (self: Timer) -> nil,
	Resume: (self: Timer) -> nil,
	Cancel: (self: Timer) -> nil,
}

return {}
