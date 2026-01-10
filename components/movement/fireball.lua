local Component = require "class.Component"
local fireball = class("misc.fireball", Component)

function fireball:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function fireball:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function fireball:topCollision(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function fireball:bottomCollision(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function fireball:resolve(dir, obj2)
	if dir == "top" then
		self.actor.speed[2] = -160
	else
		self.actor:destroy()
	end
end

return fireball