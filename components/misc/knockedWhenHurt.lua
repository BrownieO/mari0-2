local Component = require "class.Component"
local knockedWhenHurt = class("category.knockedWhenHurt", Component)

function knockedWhenHurt:initialize(actor, args)
    Component.initialize(self, actor, args)
end

function knockedWhenHurt:getHurt()
	playSound("knock")
    self.actor:destroy()
end

return knockedWhenHurt