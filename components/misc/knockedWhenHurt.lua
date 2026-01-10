local Component = require "class.Component"
local knockedWhenHurt = class("category.knockedWhenHurt", Component)

function knockedWhenHurt:getHurt()
	playSound("knock")
    self.actor:destroy()
end

return knockedWhenHurt