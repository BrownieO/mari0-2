local Component = require "class.Component"
local targetPlayerY = class("movement.targetPlayerY", Component)

targetPlayerY.argList = {
    {"YSpeed", "number", 2*16},
}

function targetPlayerY:initialize(actor, args)
    Component.initialize(self, actor, args)
	
	local closestPlayerY = nil
	local smallestDiff = math.huge
	
	for i = 1, #game.players do
		local player = game.players[i]
		if player.actor then
			local diff = math.abs(player.actor.cache.y - self.actor.y)
			if diff < smallestDiff then
				smallestDiff = diff
				closestPlayerY = player.actor.cache.y
			end
		end
	end
	self.targety = closestPlayerY
end

function targetPlayerY:update(dt)
	if not self.targety then return end
	if self.actor.cache.y > self.targety then
		self.actor.speed[2] = -self.YSpeed
	elseif self.actor.cache.y < self.targety then
		self.actor.speed[2] = self.YSpeed
	else
		self.actor.speed[2] = 0
	end
end

return targetPlayerY