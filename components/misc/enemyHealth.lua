local Component = require "class.Component"
local enemyHealth = class("category.enemyHealth", Component)

enemyHealth.argList = {
    {"health", "number", 5},
}

function enemyHealth:getHurt()
	self.health = self.health - 1
	if self.health <= 0 then
		playSound("knock")
		self.actor:destroy()
	end
end

return enemyHealth