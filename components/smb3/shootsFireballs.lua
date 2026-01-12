local Component = require "class.Component"
local Actor = require("class.Actor")
local shootsFireballs = class("smb3.shootsFireballs", Component)

local FIREBALLSPEED = 15*16
local MAXFIREBALLS = 2
local SHOOTSPEEDY = getRequiredSpeed(16)

function shootsFireballs:initialize(actor, args)
    Component.initialize(self, actor, args)
    self.fireballCount = 0
end

function shootsFireballs:action()
	if self.fireballCount < MAXFIREBALLS then
		local fireball = Actor:new(self.actor.world, self.actor.cache.x+(self.actor.width/2), self.actor.cache.y+self.actor.height-16, actorTemplates["fireball"])
		fireball.parent = self.actor
		self.fireballCount = self.fireballCount + 1
		fireball.speed[2] = SHOOTSPEEDY
		fireball.speed[1] = self.actor.animationDirection * FIREBALLSPEED
		fireball.animationDirection = self.actor.animationDirection
		playSound("fireball")
	end
end

function shootsFireballs:childDestroyed()
	self.fireballCount = self.fireballCount - 1
end

return shootsFireballs
