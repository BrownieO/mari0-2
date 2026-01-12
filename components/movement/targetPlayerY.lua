local Component = require "class.Component"
local targetPlayerY = class("movement.targetPlayerY", Component)

targetPlayerY.argList = {
    {"YSpeed", "number", 2*16},
}

function targetPlayerY:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.targety = game.players[1].actor.cache.y
end

function targetPlayerY:update(dt)
	if self.actor.cache.y > self.targety then
		self.actor.speed[2] = -self.YSpeed
	elseif self.actor.cache.y < self.targety then
		self.actor.speed[2] = self.YSpeed
	else
		self.actor.speed[2] = 0
	end
end

return targetPlayerY