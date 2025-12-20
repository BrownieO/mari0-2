local Component = require "class.Component"
local bounceOnBlocks = class("misc.bounceOnBlocks", Component)

bounceOnBlocks.argList = {
    {"dontBreak", "boolean", false},
}

function bounceOnBlocks:bottomCollision(dt, actorEvent, obj2)
	if obj.tile then
		if obj2.tile.props.noteblock then
			self.actor.world:bounceOnBlock(obj2, self.actor)
			
			if obj2.tile.props.noteblockForceY then
				self.actor.speed[2] = -getRequiredSpeed(obj2.tile.props.noteblockForceY)
			else
				self.actor.speed[2] = -getRequiredSpeed(VAR("enemyBounceHeight"))
			end

			actorEvent:bind("after", function(actor)
				actor:switchState("falling") -- smb3.movement would love to set us to idle, but we can't have that
			end)
			
			if controls3.cmdDown("jump") then
				if obj2.tile.props.noteblockForceX then
					self.actor.speed[1] = obj2.tile.props.noteblockForceX*2*3
				end
				playSound("note-block-long")
			else
				if obj2.tile.props.noteblockForceX then
					self.actor.speed[1] = obj2.tile.props.noteblockForceX*3
				end
				playSound("note-block")
			end
		end
	end
end

return bounceOnBlocks
