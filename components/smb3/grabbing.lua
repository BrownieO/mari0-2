local Component = require "class.Component"
local grabbing = class("smb3.grabbing", Component)

local GRABBER_POSITION = 32

function grabbing:initialize(actor, args)
    Component.initialize(self, actor, args)

    self.actor.grabbing = false
    self.grabbedActor = nil
end

function grabbing:update(dt)
    if controls3.cmdDown("run") and not self.grabbedActor then
        self:grabActorsInFront()
    elseif not controls3.cmdDown("run") and self.grabbedActor then
        self:releaseGrabbedActors()
    end

    if self.grabbedActor then
        self:updateGrabbedActorPosition()
    end
end

function grabbing:grabActorsInFront()
    local frontX = self.actor.x + (self.actor.animationDirection * GRABBER_POSITION)
    local frontY = self.actor.y - self.actor.height / 2

    for _, actor in ipairs(self.actor.world.actors) do
        if actor.grabbable and actor ~= self.actor then
            local dist = math.sqrt((actor.x - frontX) ^ 2 + (actor.y - frontY) ^ 2)
            if dist < GRABBER_POSITION then
                actor.speed[1] = 0
                actor.speed[2] = 0
                self.grabbedActor = actor
				actor.collisionGroup = 0
				actor.collisionMask = 0
            end
        end
    end
end

function grabbing:updateGrabbedActorPosition()
	local offsetX = self.actor.animationDirection * self.actor.width
	self.grabbedActor.x = self.actor.x + offsetX
	self.grabbedActor.y = self.actor.y + self.actor.height / 2
	self.grabbedActor.speed[1] = 0
	self.grabbedActor.speed[2] = 0
end


function grabbing:releaseGrabbedActors()
	self.grabbedActor = nil
end

return grabbing
