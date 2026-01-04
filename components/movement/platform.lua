local Component = require "class.Component"
local platform = class("movement.platform", Component)

platform.argList = {
    {"platformtime", "number", 4},
    {"distancex", "number", -3.3*16},
    {"distancey", "number", 0},
}

function platform:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.startx = self.actor.x
	self.starty = self.actor.y
	self.time = self.platformtime
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
	
	if self.distancex ~= 0 then
		local newx = self:func(self.timer/self.time) * self.distancex + self.startx
		self.actor.speed[1] = (newx-self.actor.x)/dt
	end

	if self.distancey ~= 0 then
		local newy = self:func(self.timer/self.time) * self.distancey + self.starty
		self.actor.speed[2] = (newy-self.actor.y)/dt
	end
end

return platform