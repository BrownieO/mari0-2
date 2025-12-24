local Component = require "class.Component"
local changeCollisionGroup = class("misc.changeCollisionGroup", Component)

changeCollisionGroup.argList = {
    {"on", "required|string"},
    {"group", "required|number"},
    {"noncollide", "required|number"},
    {"off", "string"},
}

function changeCollisionGroup:initialize(actor, args)
    Component.initialize(self, actor, args)
	
	self.originalGroup = self.actor.collisionGroup
	self.originalNoncollide = self.actor.noncollide

    self[self.on] = function(self)
        self.actor.collisionGroup = self.group
        self.actor.noncollide = self.noncollide
    end
	
    self[self.off] = function(self)
        self.actor.collisionGroup = self.originalGroup
        self.actor.noncollide = self.originalNoncollide
    end
end

return changeCollisionGroup
