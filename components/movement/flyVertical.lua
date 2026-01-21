local Component = require "class.Component"
local flyVertical = class("movement.flyVertical", Component)

flyVertical.argList = {
    {"flyingTime", "number", 7},
    {"flyingDistance", "number", 7.5*16},
}

function flyVertical:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.flyingTimer  = 0
	self.startx = self.actor.x
	self.starty = self.actor.y
end

function flyVertical:func(i) -- 0-1 in please
	return (-math.cos(i*math.pi*2)+1)/2
end

function flyVertical:update(dt)
	self.flyingTimer = self.flyingTimer + dt

	while self.flyingTimer > self.flyingTime do
		self.flyingTimer = self.flyingTimer - self.flyingTime
	end
			
	local newy = self:func(self.flyingTimer/self.flyingTime)*self.flyingDistance + self.starty
	self.actor.y = newy
end

return flyVertical