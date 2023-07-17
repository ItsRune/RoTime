return {
    alias = {"day", "days"},
    func = function(self, newDay: number): {}
        local currentDay = os.date("*t", self._now).day
        local difference = math.abs(currentDay - newDay)

        if currentDay < newDay then
            return self:add(difference, "day")
        else
            return self:subtract(difference, "day")
        end
    end
}