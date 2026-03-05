local Component = require "class.Component"
local stomps = class("misc.stomps", Component)

stomps.argList = {
    {"level", "number", 1},
}

function stomps:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2, actorEvent)
end

function stomps:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2, actorEvent)
end

function stomps:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2, actorEvent)
end

function stomps:bottomContact(dt, actorEvent, obj2)
	self:resolve("top", obj2, actorEvent)
end

function stomps:resolve(dir, obj2, actorEvent)
	if self.stomping then return end
	if not obj2:hasComponent("misc.stompable") then return end
	if self.actor.starred or self.actor.metal then return end
	
	if not self.actor.iFramed and dir == "top" or self.actor.cache.speed[2] > 0 then
		self.stomping = true
		self.actor.y = obj2.y-self.actor.height
		self.actor.speed[2] = -getRequiredSpeed(VAR("enemyBounceHeight"))

		actorEvent:bind("after", function(actor)
			actor:switchState("falling") -- smb3.movement would love to set us to idle, but we can't have that
		end)

		actorEvent.returns = true

		obj2:event("getStomped")
		self.actor:event("stomp")
	end
end

function stomps:postUpdate(dt)
	self.stomping = false
end

return stomps
