local Component = require "class.Component"
local isHurtByStar = class("misc.isHurtByStar", Component)

function isHurtByStar:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function isHurtByStar:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function isHurtByStar:topCollision(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function isHurtByStar:bottomCollision(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function isHurtByStar:resolve(dir, obj2)
	if obj2.starred then
		print("oof")
		self.actor:event("getHurt", dt)
	end
end

return isHurtByStar