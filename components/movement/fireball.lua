--[[
  Fireball.lua by BrownieO
  
  This component not only handles the movement and terrain collisions,
  of the fireball, but also defines its explosion and extinguish behaviors.
  
  In case of entity collision, it sends a message to collapsesOnEvents,
  which can send a message back that can trigger the behaviors defined here.
]]
local Component = require "class.Component"
local fireball = class("misc.fireball", Component)

local FIREBALLJUMPFORCE = -getRequiredSpeed(12)
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

function fireball:projectileFailure()
	playSound("block")
	self.actor:destroy()
end

function fireball:projectileSuccess()
	self.actor:destroy()
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

function fireball:resolve(dir, obj2)
	if dir == "top" then
		self.actor.speed[2] = FIREBALLJUMPFORCE
	else
		self:projectileFailure()
	end
end

function fireball:rightContact(dt, actorEvent, obj2)
    self:contact(obj2)
end

function fireball:leftContact(dt, actorEvent, obj2)
    self:contact(obj2)
end

function fireball:topContact(dt, actorEvent, obj2)
    self:contact(obj2)
end

function fireball:bottomContact(dt, actorEvent, obj2)
    self:contact(obj2)
end

function fireball:contact(obj2)
	if obj2:hasComponent("actReact.react.collapsesOnEvents") then
		obj2:event("getFireballDamage", nil, self.actor)
	end
end

function fireball:update(dt)
	self.actor.timer = self.actor.timer + dt
    if self.actor.timer >= LIFETIME then
        self.actor:destroy()
    end
end

return fireball