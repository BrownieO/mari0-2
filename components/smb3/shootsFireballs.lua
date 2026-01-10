local Component = require "class.Component"
local Actor = require("class.Actor")
local shootsFireballs = class("smb3.shootsFireballs", Component)

function shootsFireballs:action()
	local fireball = Actor:new(self.actor.world, self.actor.cache.x+(self.actor.width/2), self.actor.cache.y+self.actor.height-16, actorTemplates["fireball"])
	fireball.speed[1] = self.actor.animationDirection * 15 * 16
end

return shootsFireballs
