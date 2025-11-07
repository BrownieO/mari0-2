local Component = require "class.Component"
local eightWay = class("category.eightWay", Component)

local ACCELERATION = 196.875
local MAX_SPEED = 196.875

function eightWay:initialize(actor, args)
    Component.initialize(self, actor, args)
	
	self.actor.gravity = 0
end

local function accelerate(dt, actor, acceleration, maxSpeed)
    if math.abs(actor.speed[1]) < maxSpeed then
        if controls3.cmdDown("left") and not controls3.cmdDown("right") and actor.speed[1] <= 0 then
            actor.speed[1] = math.max(-maxSpeed, actor.speed[1] - acceleration*dt)
        end

        if controls3.cmdDown("right") and not controls3.cmdDown("left") and actor.speed[1] >= 0 then
            actor.speed[1] = math.min(maxSpeed, actor.speed[1] + acceleration*dt)
        end
	end

    if math.abs(actor.speed[2]) < maxSpeed then
        if controls3.cmdDown("down") and not controls3.cmdDown("up") and actor.speed[1] <= 0 then
            actor.speed[2] = math.max(-maxSpeed, actor.speed[2] - acceleration*dt)
        end

        if controls3.cmdDown("up") and not controls3.cmdDown("down") and actor.speed[1] >= 0 then
            actor.speed[2] = math.min(maxSpeed, actor.speed[2] + acceleration*dt)
        end
    end
end

function eightWay:update(dt, actorEvent)
	accelerate(dt, self.actor, ACCELERATION, MAX_SPEED)
end

return eightWay