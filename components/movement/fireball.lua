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

function fireball:shouldCollide(a, b)
	return bit.band(a.collisionGroup, b.collisionMask) ~= 0
	and bit.band(b.collisionGroup, a.collisionMask) ~= 0
end

function fireball:resolve(dir, obj2)
	if dir == "top" then
		if self:shouldCollide(obj2, self.actor) then
			self.actor.speed[2] = -140
		end
	else
		self.actor:destroy()
	end
end

return fireball