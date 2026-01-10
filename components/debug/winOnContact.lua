local Component = require "class.Component"
local winOnContact = class("misc.winOnContact", Component)

function winOnContact:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function winOnContact:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function winOnContact:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function winOnContact:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function winOnContact:resolve(dir, obj2)
    if obj2.player then
		self.actor:destroy()
		exitEditor = true
    end
end

return winOnContact
