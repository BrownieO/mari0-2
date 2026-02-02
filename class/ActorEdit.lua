local ActorEdit = class("ActorEdit", Physics3.PhysObj)
local ActorState = require "class.ActorState"
local ActorEvent = require "class.ActorEvent"

function ActorEdit:__tostring()
    return string.format("Actor icon (%s)", self.actorTemplate.name)
end

function ActorEdit:initialize(world, x, y, actorTemplate)
	self.actorTemplate = actorTemplate
	self:loadActorTemplate(self.actorTemplate)
	
	self.width = self.actorTemplate.width
	self.height = self.actorTemplate.height
	self.x = x-self.width/2
	self.y = y-self.height
	
	self.world = world
	world:addObject(self)
end

function ActorEdit:loadActorTemplate(actorTemplate)
    self.actorTemplate = actorTemplate

	self.active = false
	self.alpha = 0.75

    self.img = self.actorTemplate.img

    self.quadWidth = self.actorTemplate.quadWidth
    self.quadHeight = self.actorTemplate.quadHeight

    self.centerX = self.actorTemplate.centerX
    self.centerY = self.actorTemplate.centerY

    self.quads = self.actorTemplate.quads
    self.quad = self.quads[1]
	self.animationDirection = -1
end

function ActorEdit:draw() end

return ActorEdit