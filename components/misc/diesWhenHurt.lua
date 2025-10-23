local Component = require "class.Component"
local diesWhenHurt = class("misc.diesWhenHurt", Component)

function diesWhenHurt:hurt(dt, actorEvent)
	playSound("death")
	love.window.showMessageBox("Game", "You died!", "info", true)
end

return diesWhenHurt