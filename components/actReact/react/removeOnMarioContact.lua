local Component = require("class.Component")
local removeOnMarioContact = class("actReact.react.removeOnMarioContact", Component)

function removeOnMarioContact:anyContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end

function removeOnMarioContact:resolve(obj2)
    if obj2.player then
        self.actor:destroy()
    end
end

return removeOnMarioContact
