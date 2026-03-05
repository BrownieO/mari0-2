local Component = require "class.Component"
local wakesUp = class("misc.wakesUp", Component)

wakesUp.argList = {
    {"time", "number", 6.9},
    {"onlyWhen", "string|falseable", false},
    {"wiggles", "boolean", false},
    {"wiggleAfter", "number", 5+7/30},
    {"wiggleDistance", "number", 1},
    {"wiggleTime", "number", 1/60},
    {"wiggleFrames", "table", {1}},
    {"wiggleFrameTime", "table", {1/30}},
}

function wakesUp:initialize(actor, args)
    Component.initialize(self, actor, args)

    self.timer = self.time
	self.centerX = self.actor.centerX
end

function wakesUp:update(dt)
    local running = true

    if self.onlyWhen == "stopped" and self.actor.speed[1] ~= 0 then
        running = false
    end

    if running then
        self.timer = self.timer - dt

		if self.wiggles and self.timer <= self.time - self.wiggleAfter then
			self:updateWiggle(dt)
		end

        if self.timer <= 0 then
			self.actor.centerX = self.centerX
            self.actor:event("wakeUp", dt)
        end
    else
        self.timer = self.time
    end
end

function wakesUp:updateWiggle(dt)
	self.actor.centerX = self.centerX + self.wiggleDistance * math.round((dt*60 % self.wiggleTime)/self.wiggleTime)
end

return wakesUp