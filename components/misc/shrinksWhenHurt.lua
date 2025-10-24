local Component = require "class.Component"
local shrinksWhenHurt = class("misc.shrinksWhenHurt", Component)

function shrinksWhenHurt:getHurt(dt, actorEvent)
	if self.actor.player.powerUp == "big" then
		self.actor:loadActorTemplate(actorTemplates["smb3_small"])
		self.actor.player.powerUp = "small"
	else
		self.actor:loadActorTemplate(actorTemplates["smb3_big"])
		self.actor.player.powerUp = "big"
	end
	playSound("shrink")
end

return shrinksWhenHurt