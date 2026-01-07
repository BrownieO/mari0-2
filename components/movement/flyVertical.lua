local Component = require "class.Component"
local flyVertical = class("movement.flyVertical", Component)

flyVertical.argList = {
    {"flyingtime", "number", 7},
    {"flyingdistance", "number", 7.5*16},
    {"circleRadiusY", "number"},
    {"circleTime", "number", 3},
}

function flyVertical:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.flyingtimer  = 0
	self.startx = self.actor.x
	self.starty = self.actor.y
end

function flyVertical:func(i) -- 0-1 in please
	return (-math.cos(i*math.pi*2)+1)/2
end

function flyVertical:update(dt)
	self.flyingtimer = self.flyingtimer + dt

	while self.flyingtimer > self.flyingtime do
		self.flyingtimer = self.flyingtimer - self.flyingtime
	end
			
	local newy = self:func(self.flyingtimer/self.flyingtime)*self.flyingdistance + self.starty
	self.actor.y = newy
end

return flyVertical