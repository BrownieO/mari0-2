local Component = require "class.Component"
local changeCollisionGroup = class("misc.changeCollisionGroup", Component)

changeCollisionGroup.argList = {
    {"on", "required|string"},
    {"group", "required|number"},
    {"collisionMask", "required|number"},
    {"off", "string"},
}

function changeCollisionGroup:initialize(actor, args)
    Component.initialize(self, actor, args)
	
	self.originalGroup = self.actor.collisionGroup
	self.originalNoncollide = self.actor.collisionMask

    self[self.on] = function(self)
        self.actor.collisionGroup = self.group
        self.actor.collisionMask = self.collisionMask
    end
	
    self[self.off] = function(self)
        self.actor.collisionGroup = self.originalGroup
        self.actor.collisionMask = self.originalNoncollide
    end
end

return changeCollisionGroup
