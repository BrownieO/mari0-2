local Component = require "class.Component"
local bounceOnBlocks = class("misc.bounceOnBlocks", Component)

bounceOnBlocks.argList = {
    {"dontBreak", "boolean", false},
}

function bounceOnBlocks:bottomCollision(dt, actorEvent, obj2)
	if obj2.tile.props.noteblock then
		self.actor.world:bounceOnBlock(obj2, self.actor)
		
		self.actor.speed[2] = -getRequiredSpeed(VAR("enemyBounceHeight"))

		actorEvent:bind("after", function(actor)
			actor:switchState("falling") -- smb3.movement would love to set us to idle, but we can't have that
		end)
		
		if controls3.cmdDown("jump") then
			playSound("note-block-long")
		else
			playSound("note-block")
		end
	end
end

return bounceOnBlocks
