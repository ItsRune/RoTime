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
export type RoTime = {
	_now: number,
	_nowdt: DateTime,

	add: (self: RoTime, time: number, unit: string) -> RoTime,
	subtract: (self: RoTime, time: number, unit: string) -> RoTime,
	addTimezone: (self: RoTime, zoneName: string, zoneOffset: number) -> RoTime,
	removeTimezone: (self: RoTime, zoneName: string) -> RoTime,
	timezone: (self: RoTime, timezone: Zones) -> RoTime,
	createTimer: (self: RoTime, amount: number, type: string, step: number?, startAt: number?) -> Timer,

	format: (self: RoTime, formattingString: string) -> string,
	get: (self: RoTime, type: string) -> number,
	isLeapYear: (self: RoTime) -> boolean,
	Unix: (self: RoTime) -> number,
	UnixMillis: (self: RoTime) -> number,
	-- set: (self: RoTime, toSetTo: string, format: string?) -> RoTime,
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
