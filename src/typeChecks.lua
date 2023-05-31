export type Zones = "America/Philidolphia" | "America/CDT" | "America/New_York" | "America/PDT" | "America/Los_Angeles" | "America/EDT" | "Europe/CET" | "Europe/London" | "Europe/Berlin" | "Europe/Netherlands" | "Europe/Paris" | "Australia/Perth" | "Australia/Sydney" | "Australia/Darwin" | "Australia/Victoria" | "Australia/Tasmania" | "Australia/Queensland" | "Asia/India" | "Asia/Zhongshan" | "Asia/Singapore" | "Asia/Shanghai" | "Asia/Japan" | "Africa/Western" | "Africa/Central" | "Africa/Eastern"
export type getFunctionTypes = "second" | "minute" | "hour" | "day" | "week" | "month" | "year"
export type RoTime = {
    _now: number,
    _nowdt: DateTime,

    add: (self: RoTime, time: number, unit: string) -> RoTime,
    subtract: (self: RoTime, time: number, unit: string) -> RoTime,
    timezone: (self: RoTime, timezone: Zones) -> RoTime,
    createTimer: (self: RoTime, amount: number, type: string, step: number?, startAt: number?) -> Timer,

    format: (self: RoTime, formattingString: string) -> string,
    get: (self: RoTime, type: string) -> number,
    isLeapYear: (self: RoTime) -> boolean,
    unix: (self: RoTime) -> number,
    utc: (self: RoTime) -> number,

    -- set: (self: RoTime, type: string, value: number) -> RoTime,
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