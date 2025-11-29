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
	self.starty = self.actor.y
end

function circle:update(dt)
	self.circletimer = self.circletimer + dt
	
	while self.circletimer > math.abs(self.circleTime or 1) do
		self.circletimer = self.circletimer - math.abs(self.circleTime or 1)
	end
	
	local v = ((self.circletimer/(self.circleTime or 1))*math.pi*2)
	local newx = math.sin(v)*(self.circleRadiusX or self.circleRadius or 1) + self.startx
	local newy = math.cos(v)*(self.circleRadiusY or self.circleRadius or 1) + self.starty
	self.actor.x = newx
	self.actor.y = newy
end

return circle