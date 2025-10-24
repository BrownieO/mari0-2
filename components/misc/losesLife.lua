local Component = require "class.Component"
local losesLife = class("misc.losesLife", Component)

losesLife.argList = {
    {"on", "required|string"},
}

function losesLife:initialize(actor, args)
    Component.initialize(self, actor, args)

    self[self.on] = function(self)
        playSound("death")
		self.actor.player.lives = self.actor.player.lives - 1
		love.window.showMessageBox("Game", "You died!", "info", true)
    end
end

return losesLife
