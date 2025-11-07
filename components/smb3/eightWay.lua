local Component = require "class.Component"
local eightWay = class("category.eightWay", Component)

local ACCELERATION = 150
local MAX_SPEED = 60

function eightWay:initialize(actor, args)
    Component.initialize(self, actor, args)
	
	self.actor.gravity = 0
end

local function accelerate(dt, actor, acceleration, maxSpeed)
	if controls3.cmdDown("left") and not controls3.cmdDown("right") then
		actor.speed[1] = math.max(-maxSpeed, actor.speed[1] - acceleration*dt)
	end

	if controls3.cmdDown("right") and not controls3.cmdDown("left") then
		actor.speed[1] = math.min(maxSpeed, actor.speed[1] + acceleration*dt)
	end

	if controls3.cmdDown("up") and not controls3.cmdDown("down") then
		actor.speed[2] = math.max(-maxSpeed, actor.speed[2] - acceleration*dt)
	end

	if controls3.cmdDown("down") and not controls3.cmdDown("up") then
		actor.speed[2] = math.min(maxSpeed, actor.speed[2] + acceleration*dt)
	end

end

function eightWay:update(dt, actorEvent)
	accelerate(dt, self.actor, ACCELERATION, MAX_SPEED)
end

return eightWay