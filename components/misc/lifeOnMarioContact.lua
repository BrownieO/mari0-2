local Component = require "class.Component"
local lifeOnMarioContact = class("misc.lifeOnMarioContact", Component)

function lifeOnMarioContact:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function lifeOnMarioContact:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function lifeOnMarioContact:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function lifeOnMarioContact:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function lifeOnMarioContact:resolve(dir, obj2)
    if obj2.player then
		obj2.player.lives = obj2.player.lives + 1
		playSound("one_up")
    end
end

return lifeOnMarioContact
