local Component = require "class.Component"
local isHurtByStar = class("misc.isHurtByStar", Component)

function isHurtByStar:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function isHurtByStar:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function isHurtByStar:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function isHurtByStar:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function isHurtByStar:resolve(dir, obj2)
	if obj2.starred or obj2.metal then
		self.actor:event("getHurt", dt)
	end
end

return isHurtByStar