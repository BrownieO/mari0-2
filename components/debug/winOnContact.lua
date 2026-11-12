local Component = require "class.Component"
local winOnContact = class("misc.winOnContact", Component)

function winOnContact:anyContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end

function winOnContact:resolve(obj2)
    if obj2.player then
		returnToMenu()
    end
end

return winOnContact
