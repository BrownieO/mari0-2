local Component = require "class.Component"
local kicks = class("misc.kicks", Component)

function kicks:leftContact(dt, actorEvent, obj2)
	self:resolve("left", obj2, actorEvent)
end

function kicks:rightContact(dt, actorEvent, obj2)
	self:resolve("right", obj2, actorEvent)
end

function kicks:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2, actorEvent)
end

function kicks:bottomContact(dt, actorEvent, obj2)
	self:resolve("top", obj2, actorEvent)
end

function kicks:resolve(dir, obj2, actorEvent)
	if self.kickDebounce then return end
	if not obj2:hasComponent("misc.kickable") then return end
	if self.actor.starred or self.actor.metal then return end
	
	if obj2.cache.speed[1] == 0 then
		self.kickDebounce = true
		if dir == "left" then
			obj2:event("kicked", 0, -1)
		elseif dir == "right" then
			obj2:event("kicked", 0, 1)
		end
	end
	
	if not self.actor.iFramed and dir == "top" or self.actor.cache.speed[2] > 0 then
		self.kickDebounce = true
        if obj2.cache.speed[1] == 0 then-- kick it
            local selfX = self.actor.x + self.actor.width*.5
            local obj2X = obj2.x + obj2.width*.5

            local dir = 1

            if selfX > obj2X then
                dir = -1
            end

            if dir == 1 then
                obj2.x = self.actor.x + self.actor.width
            else
                obj2.x = self.actor.x - obj2.width
            end

            obj2:event("kicked", 0, dir)

        else -- stop it
            self.actor.y = obj2.y-self.actor.height
            self.actor.speed[2] = -getRequiredSpeed(VAR("enemyBounceHeight"))

            actorEvent:bind("after", function(actor)
                actor:switchState("falling") -- smb3.movement would love to set us to idle, but we can't have that
            end)

            obj2:event("unkicked")
        end
	end
	
	actorEvent.returns = true
end

function kicks:postUpdate(dt)
	self.kickDebounce = false
end

return kicks
