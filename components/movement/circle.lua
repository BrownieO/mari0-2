local Component = require "class.Component"
local circle = class("movement.circle", Component)

circle.argList = {
    {"circleRadius", "number", 48},
    {"circleRadiusX", "number"},
    {"circleRadiusY", "number"},
    {"circleTime", "number", 3},
}

function circle:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.circletimer = 0
	self.startx = self.actor.x
	self.starty = self.actor.y - 8
end

function circle:update(dt)
	self.circletimer = self.circletimer + dt
	
	while self.circletimer > math.abs(self.circleTime) do
		self.circletimer = self.circletimer - math.abs(self.circleTime)
	end
	
	local v = ((self.circletimer/(self.circleTime))*math.pi*2)
	local newx = math.sin(v)*(self.circleRadiusX or self.circleRadius) + self.startx
	local newy = math.cos(v)*(self.circleRadiusY or self.circleRadius) + self.starty
	self.actor.x = newx
	self.actor.y = newy
end

return circle