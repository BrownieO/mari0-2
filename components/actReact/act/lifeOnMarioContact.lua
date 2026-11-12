local Component = require("class.Component")
local lifeOnMarioContact = class("actReact.act.lifeOnMarioContact", Component)

function lifeOnMarioContact:anyContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end

function lifeOnMarioContact:resolve(obj2)
    if obj2.player then
        obj2.player.lives = obj2.player.lives + 1
        playSound("one_up")
    end
end

return lifeOnMarioContact
