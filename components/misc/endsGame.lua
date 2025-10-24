local Component = require "class.Component"
local endsGame = class("misc.endsGame", Component)

endsGame.argList = {
    {"on", "required|string"},
}

function endsGame:initialize(actor, args)
    Component.initialize(self, actor, args)

    self[self.on] = function(self)
        playSound("death")
		love.window.showMessageBox("Game", "You died!", "info", true)
    end
end

return endsGame
