local Component = require("class.Component")
local sinksOnLava = class("actReact.react.sinksOnLava", Component)

function sinksOnLava:update(dt)
    local charCenterX, charCenterY =
        self.actor.world:worldToCoordinate(self.actor.x + self.actor.width / 2, self.actor.y + self.actor.height / 2)

    local tile
    if self.actor.world:inMap(charCenterX, charCenterY) then
        tile = self.actor.world:getTile(charCenterX, charCenterY)
    end

    if tile then
        if tile.props.lava == true then
            playSound("lava_sink")
            self.actor:destroy()
        end
    end
end

return sinksOnLava
