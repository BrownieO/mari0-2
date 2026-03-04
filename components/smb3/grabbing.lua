local Component = require "class.Component"
local grabbing = class("smb3.grabbing", Component)

local GRAB_RANGE = 32
local GRAB_HEIGHT = 32

function grabbing:initialize(actor, args)
    Component.initialize(self, actor, args)

    self.actor.grabbing = false
    self.grabbedActors = {}
end

function grabbing:update(dt)
    if controls3.cmdDown("run") and not self.actor.grabbing then
        self.actor.grabbing = true
        self:grabActorsInFront()
    elseif not controls3.cmdDown("run") and self.actor.grabbing then
        self.actor.grabbing = false
        self:releaseGrabbedActors()
    end

    if self.actor.grabbing then
        self:updateGrabbedActorPositions()
    end
end

function grabbing:grabActorsInFront()
    local frontX = self.actor.x + (self.actor.animationDirection * GRAB_RANGE)
    local frontY = self.actor.y - GRAB_HEIGHT / 2

    for _, actor in ipairs(self.actor.world.actors) do
        if actor.grabbable and actor ~= self.actor then
            local dist = math.sqrt((actor.x - frontX) ^ 2 + (actor.y - frontY) ^ 2)
            if dist < GRAB_RANGE then
                table.insert(self.grabbedActors, actor)
                actor.speed[1] = 0
                actor.speed[2] = 0
            end
        end
    end
end

function grabbing:updateGrabbedActorPositions()
    for _, actor in ipairs(self.grabbedActors) do
        if actor and actor.grabbable then
            local offsetX = self.actor.animationDirection * (GRAB_RANGE / 2)
            actor.x = self.actor.x + offsetX
            actor.y = self.actor.y
            actor.speed[1] = 0
            actor.speed[2] = 0
        end
    end
end

function grabbing:releaseGrabbedActors()
    for _, actor in ipairs(self.grabbedActors) do
        if actor and actor.grabbable then
        end
    end
    self.grabbedActors = {}
end

return grabbing
