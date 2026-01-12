local Component = require "class.Component"
local fireball = class("misc.fireball", Component)

local FIREBALLJUMPFORCE = -getRequiredSpeed(9)
local LIFETIME = 1.2

function fireball:initialize(actor, args)
    Component.initialize(self, actor, args)
    self.actor.timer = 0
end

function fireball:destroy()
	if self.actor.parent then
		self.actor.parent:event("childDestroyed")
	end
end

function fireball:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function fireball:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function fireball:topCollision(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function fireball:bottomCollision(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function fireball:shouldCollide(a, b)
	return bit.band(a.collisionGroup, b.collisionMask) ~= 0
	and bit.band(b.collisionGroup, a.collisionMask) ~= 0
end

function fireball:resolve(dir, obj2)
	if dir == "top" then
		if self:shouldCollide(obj2, self.actor) then
			self.actor.speed[2] = FIREBALLJUMPFORCE
		end
	else
		playSound("block")
		self.actor:destroy()
	end
end

function fireball:update(dt)
	self.actor.timer = self.actor.timer + dt
    if self.actor.timer >= LIFETIME then
        self.actor:destroy()
    end
end

return fireball