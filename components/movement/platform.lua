local Component = require "class.Component"
local platform = class("movement.platform", Component)

platform.argList = {
    {"platformTime", "number", 4},
    {"distanceX", "number", -3.3*16},
    {"distanceY", "number", 0},
}

function platform:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.startx = self.actor.x
	self.starty = self.actor.y
	self.time = self.platformTime
	self.timer = 0
end

function platform:func(i) -- 0-1 in please
	return (-math.cos(i*math.pi*2)+1)/2
end

function platform:update(dt)
	self.timer = self.timer + dt
	while self.timer > self.time do
		self.timer = self.timer - self.time
	end
	
	if self.distanceX ~= 0 then
		local newx = self:func(self.timer/self.time) * self.distanceX + self.startx
		self.actor.speed[1] = (newx-self.actor.x)/dt
	end

	if self.distanceY ~= 0 then
		local newy = self:func(self.timer/self.time) * self.distanceY + self.starty
		self.actor.speed[2] = (newy-self.actor.y)/dt
	end
end

return platform