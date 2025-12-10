local Component = require "class.Component"
local isHurtByContact = class("misc.isHurtByContact", Component)

isHurtByContact.argList = {
    {"dontHurtSameGroup", "boolean", true},
}

function isHurtByContact:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function isHurtByContact:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function isHurtByContact:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function isHurtByContact:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function isHurtByContact:resolve(dir, obj2)
	if self.actor.starred or self.actor.iFramed then return end
    local hurtsByContactComponent = obj2:hasComponent("misc.hurtsByContact")
    if hurtsByContactComponent and hurtsByContactComponent[dir] then
        if not hurtsByContactComponent.onlyWhenMoving or obj2.cache.speed[1] ~= 0 then
            if not self.dontHurtSameGroup or obj2.collisionGroup ~= self.actor.collisionGroup then
				print("oof")
				self.actor:event("getHurt", dt)
			end
        end
    end
end

return isHurtByContact