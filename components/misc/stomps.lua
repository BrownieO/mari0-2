local Component = require "class.Component"
local stomps = class("misc.stomps", Component)

stomps.argList = {
    {"level", "number", 1},
}

function stomps:bottomContact(dt, actorEvent, obj2)
	if obj2:hasComponent("misc.stompable") and not self.actor.starred then
		if self.actor.cache.speed[2] > 0 or not self.actor.iFramed then
			-- self.actor.y = obj2.y-self.actor.height
			self.actor.speed[2] = -getRequiredSpeed(VAR("enemyBounceHeight"))

			actorEvent:bind("after", function(actor)
				actor:switchState("falling") -- smb3.movement would love to set us to idle, but we can't have that
			end)

			actorEvent.returns = true

			obj2:event("getStomped")
			self.actor:event("stomp")
		end
	end
end

return stomps
