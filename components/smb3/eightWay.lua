local Component = require "class.Component"
local ActorState = require "class.ActorState"
local eightWay = class("category.eightWay", Component)

local ACCELERATION = 150
local DECCELERATION = ACCELERATION/2
local MAX_SPEED = 60
local RUN_MAX_SPEED = 120

function eightWay:initialize(actor, args)
    Component.initialize(self, actor, args)
	
	self.actor.gravity = 0
	
    self.actor:registerState("flying", function(actor)

    end)

	self.actor.state = ActorState:new(self.actor, "flying", self.actor.states.flying)
end

local maxSpeed
local function accelerate(dt, actor, acceleration)
	if controls3.cmdDown("run") then
		maxSpeed = RUN_MAX_SPEED
	else
		maxSpeed = MAX_SPEED
	end

	if controls3.cmdDown("right") and not controls3.cmdDown("left") then
		actor.speed[1] = math.min(maxSpeed, actor.speed[1] + acceleration*dt)
	elseif controls3.cmdDown("left") and not controls3.cmdDown("right") then
		actor.speed[1] = math.max(-maxSpeed, actor.speed[1] - acceleration*dt)
	elseif actor.speed[1] > 0 then
		actor.speed[1] = actor.speed[1] - DECCELERATION*dt
	elseif actor.speed[1] < 0 then
		actor.speed[1] = actor.speed[1] + DECCELERATION*dt
	end

	if controls3.cmdDown("up") and not controls3.cmdDown("down") then
		actor.speed[2] = math.max(-maxSpeed, actor.speed[2] - acceleration*dt)
	elseif controls3.cmdDown("down") and not controls3.cmdDown("up") then
		actor.speed[2] = math.min(maxSpeed, actor.speed[2] + acceleration*dt)
	elseif actor.speed[2] > 0 then
		actor.speed[2] = actor.speed[2] - DECCELERATION*dt
	elseif actor.speed[2] < 0 then
		actor.speed[2] = actor.speed[2] + DECCELERATION*dt
	end
end

function eightWay:update(dt, actorEvent)
	accelerate(dt, self.actor, ACCELERATION)
end

return eightWay