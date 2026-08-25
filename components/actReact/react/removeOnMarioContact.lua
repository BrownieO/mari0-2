local Component = require "class.Component"
local removeOnMarioContact = class("misc.removeOnMarioContact", Component)

function removeOnMarioContact:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function removeOnMarioContact:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function removeOnMarioContact:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function removeOnMarioContact:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function removeOnMarioContact:resolve(dir, obj2)
    if obj2.player then
		self.actor:destroy()
    end
end

return removeOnMarioContact
