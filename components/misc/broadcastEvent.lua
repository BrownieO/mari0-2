local Component = require "class.Component"
local broadcastEvent = class("misc.broadcastEvent", Component)

broadcastEvent.argList = {
    {"on", "required|string"},
    {"fire", "required|table"},
	{"collisionBlacklist", "number"}
}

function broadcastEvent:initialize(actor, args)
    Component.initialize(self, actor, args)

    self[self.on] = function(self)
        for _, actor in ipairs(self.actor.world.actors) do
			if not self.collisionBlacklist or bit.band(actor.collisionGroup, self.collisionBlacklist) == 0 then
                for _, eventName in ipairs(self.fire) do
                    actor:event(eventName)
                end
			end
        end
    end
end

return broadcastEvent
