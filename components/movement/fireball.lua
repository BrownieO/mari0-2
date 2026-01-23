local Component = require "class.Component"
local fireball = class("misc.fireball", Component)

local FIREBALLJUMPFORCE = -getRequiredSpeed(10)
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

function fireball:bottomContact(dt, actorEvent, obj2)
    if obj2.collisionGroup == VAR("collisionCategories").ENEMY then
		obj2:event("getHurt")
		self.actor:destroy()
	end
end

function fireball:resolve(dir, obj2)
	if dir == "top" then
		self.actor.speed[2] = FIREBALLJUMPFORCE
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