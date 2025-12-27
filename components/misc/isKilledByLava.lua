local Component = require "class.Component"
local isKilledByLava = class("misc.isKilledByLava", Component)

function isKilledByLava:update(dt, actorEvent)
    local charCenterX, charCenterY = self.actor.world:worldToCoordinate(
        self.actor.x + self.actor.width / 2,
        self.actor.y + self.actor.height / 2
    )

    local tile
    if self.actor.world:inMap(charCenterX, charCenterY) then
        tile = self.actor.world:getTile(charCenterX, charCenterY)
    end

    if tile then
        if tile.props.lava == true then
			self.actor:event("getKilled")
		end
    end
end

return isKilledByLava