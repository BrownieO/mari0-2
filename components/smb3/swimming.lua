--[[ This module detects if the character is underwater.
If so, it tells other movement modules to standby and then works by itself.
Only square water tiles are supported.
--]]
local Component = require "class.Component"
local swimming = class("smb3.swimming", Component)

local UW_MINSURFACESPEED = -45		-- Unused
local UW_SURFACEJUMPFORCE = -191.25 -- Unused

local UW_GRAVITY = 112.5            --applied when moving downwards
local UW_SWIMGRAVITY = 225          -- applied when moving upwards
local UW_SWIMFORCE = -116.25        -- Upward force after a swim. Can be done every other frame
local UW_MAXUPSWIMSPEED = 0         -- how fast mario can be moving DOWN after a swim
local UW_MINUPSWIMSPEED = -120      -- how fast mario can be moving UP after a swim 

local UW_MAXSWIMSPEED = 90
local UW_SWIMACCELERATION = 42.1875
local UW_SWIMFRICTION = 28.125
local UW_SWIMSKIDACCELERATION = 112.5

function swimming:initialize(actor, args)
    Component.initialize(self, actor, args)

    self.actor.upSwimCycles = 0 -- Counter for tracking consecutive swim paddles.

    self.actor:registerState("swimming", function(actor)
        -- Empty function for now; swimming state logic is handled elsewhere.
    end)
end

-- Calls setUnderWater() when on water.
-- Also applies friction, acceleration, skid, and sets gravity based on motion direction. 
-- @param actorEvent The event dispatcher for modifying physics values.
function swimming:update(dt, actorEvent)
    local charCenterX, charCenterY = self.actor.world:worldToCoordinate(
        self.actor.x + self.actor.width / 2,
        self.actor.y + self.actor.height / 2
    )
	
    local tile
    if self.actor.world:inMap(charCenterX, charCenterY) then
        tile = self.actor.world:getTile(charCenterX, charCenterY)
    end
	
	local tileAbove
    if self.actor.world:inMap(charCenterX, charCenterY - 1) then
        tileAbove = self.actor.world:getTile(charCenterX, charCenterY - 1)
    end
	
	-- Calls if water tile is detected
    if tile then
        self:setUnderWater(tile.props.water == true)
    else
        self:setUnderWater(false)
    end
	
    if not tileAbove then
        self:setEmptyAbove(tileAbove == nil)
    else
        self:setEmptyAbove(false)
    end

    -- Only apply swimming physics if in "swimming" state.
    if self.actor.state.name == "swimming" then
        if not controls3.cmdDown("left") and not controls3.cmdDown("right") then
            self.actor:friction(dt, UW_SWIMFRICTION)
        end

        accelerate(dt, self.actor, UW_SWIMACCELERATION, UW_MAXSWIMSPEED)
        skid(dt, self.actor, UW_SWIMSKIDACCELERATION)

        -- Use different gravity depending on movement direction.
        local gravity
        if self.actor.cache.speed[2] >= 0 then
            gravity = UW_GRAVITY -- Sinking
        else
            gravity = UW_SWIMGRAVITY -- Rising
        end

        -- Apply the selected gravity.
        actorEvent:setValue("gravity", gravity, 10)
    end
end

-- Declares and sets the "underWater" instance variable read by other modules.
-- It's also read here by jump() and startFall()
-- Then, triggers events to transition between swimming and normal physics.
-- @param underWater Boolean used to avoid redundant updates.
function swimming:setUnderWater(underWater)
    if underWater ~= self.actor.underWater then
        self.actor.underWater = underWater

        if self.actor.underWater then
            self.actor:event("enterWater")
        else
            self.actor:event("leaveWater")
        end
    end
end

-- Declares and sets the "emptyAbove" instance variable read here.
function swimming:setEmptyAbove(emptyAbove)
    if emptyAbove ~= self.actor.emptyAbove then
        self.actor.emptyAbove = emptyAbove
	end
end

-- Handles jump velocity and animations.
-- Triggers state change to "swimming".
-- @param actorEvent The event dispatcher for binding post-jump physics.
function swimming:jump(dt, actorEvent)
    if self.actor.underWater then
        self.actor.onGround = false

        -- Apply upward force after current update frame.
		if self.actor.emptyAbove and controls3.cmdDown("up") then
			actorEvent:bind("after", function(actor)
				actor.speed[2] = actor.cache.speed[2] + UW_SURFACEJUMPFORCE
			end)		
		else
			actorEvent:bind("after", function(actor)
				actor.speed[2] = math.clamp(
					actor.cache.speed[2] + UW_SWIMFORCE,
					UW_MINUPSWIMSPEED,
					UW_MAXUPSWIMSPEED
				)
			end)	
		end

        -- Reset or update swimming animation cycle.
        if self.actor.upSwimCycles == 0 then
            self.actor.swimAnimationFrame = 1
        end

        if self.actor.swimAnimationFrame > self.actor.frameCounts.swimUp then
            self.actor.swimAnimationFrame = 1
        end

        -- Track swim cycles to adjust swim rate.
        self.actor.upSwimCycles = math.min(self.actor.upSwimCycles, 1) + 2

        self.actor:switchState("swimming")
    end
end

function swimming:bottomCollision()
    if self.actor.state.name == "swimming" then
        self.actor:switchState("grounded")
    end
end

function swimming:startFall()
    if self.actor.underWater then
        self.actor:switchState("swimming")
    end
end

-- Used on setUnderWater()
function swimming:enterWater()
    self.actor.speed[2] = math.min(0, self.actor.speed[2])
    self.actor:switchState("swimming")
end

-- Used on setUnderWater()
function swimming:leaveWater()
    self.actor:switchState("falling")
end

return swimming
