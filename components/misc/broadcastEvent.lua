local Component = require "class.Component"
local broadcastEvent = class("misc.broadcastEvent", Component)

broadcastEvent.argList = {
    {"on", "required|string"},
    {"fire", "required|string"},
}

function broadcastEvent:initialize(actor, args)
    Component.initialize(self, actor, args)

    self[self.on] = function(self)
        for _, actor in ipairs(self.actor.world.actors) do
            actor:event(self.fire)
        end
    end
end

return broadcastEvent
