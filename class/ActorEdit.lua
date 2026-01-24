local ActorEdit = class("ActorEdit", Physics3.PhysObj)
local ActorState = require "class.ActorState"
local ActorEvent = require "class.ActorEvent"

function ActorEdit:__tostring()
    return string.format("Actor icon (%s)", self.actorTemplate.name)
end

function ActorEdit:initialize(world, x, y, actorTemplate)
	self.actorTemplate = actorTemplate
	self:loadActorTemplate(self.actorTemplate)
	
	self.x = x
	self.y = y
	self.world = world
	world:addObject(self)
end

function ActorEdit:loadActorTemplate(actorTemplate)
    self.actorTemplate = actorTemplate
	
	self.active = false

    self.img = self.actorTemplate.img
	
	self.width = self.actorTemplate.width
	self.height = self.actorTemplate.height

    self.quadWidth = self.actorTemplate.quadWidth
    self.quadHeight = self.actorTemplate.quadHeight

    self.centerX = self.actorTemplate.centerX
    self.centerY = self.actorTemplate.centerY

    self.quad = nil
    self.quads = self.actorTemplate.quads
end

function ActorEdit:draw() end

return ActorEdit