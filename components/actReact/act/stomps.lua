local Component = require("class.Component")
local stomps = class("actReact.act.stomps", Component)

stomps.argList = {
    { "level", "number", 1 },
}

function stomps:anyContact(dt, actorEvent, obj2)
    self:resolve(obj2, actorEvent)
end

function stomps:resolve(obj2, actorEvent)
    if self.stompDebounce then
        return
    end
    if not obj2:hasComponent("actReact.tag.stompable") then
        return
    end
    if self.actor.invincibility then
        return
    end
	print(self.actor.cache.y + self.actor.height, obj2.cache.y)

    if self.actor.cache.speed[2] > 0 or self.actor.cache.y + self.actor.height <= obj2.cache.y then
        self.stompDebounce = true
        self.actor.y = obj2.y - self.actor.height
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
    self.stompDebounce = false
end

return stomps
