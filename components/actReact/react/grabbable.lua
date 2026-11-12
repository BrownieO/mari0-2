local Component = require("class.Component")
local grabbable = class("actReact.act.grabbable", Component)

function grabbable:initialize(actor, args)
	Component.initialize(self, actor, args)
	self.originalGroup = self.actor.collisionGroup
	self.originalMask = self.actor.collisionMask
end

function grabbable:used(dt, actorEvent, obj2)
	if self.actor.parent then return end
	self.actor.parent = obj2
	self.actor.static = true
    self.actor.collisionGroup = 0
    self.actor.collisionMask = 0
	obj2.pickup = self.actor
	self.actor.speed = {0, 0}
end

function grabbable:dropped()
	self.actor.parent = nil
	self.actor.static = false
    self.actor.collisionGroup = self.originalGroup
    self.actor.collisionMask = self.originalMask
end

function grabbable:update(dt)
	if self.actor.parent then
		self.actor.x = self.actor.parent.x
		self.actor.y = self.actor.parent.y
	end
end

return grabbable
