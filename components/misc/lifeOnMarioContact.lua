local Component = require "class.Component"
local lifeOnMarioContact = class("misc.lifeOnMarioContact", Component)

function lifeOnMarioContact:initialize(actor, args)
    Component.initialize(self, actor, args)
end

function lifeOnMarioContact:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function lifeOnMarioContact:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function lifeOnMarioContact:topCollision(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function lifeOnMarioContact:bottomCollision(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function lifeOnMarioContact:resolve(dir, obj2)
    local collectsCoins = obj2:hasComponent("misc.collectsCoins")
    if collectsCoins then
		obj2.player.lives = obj2.player.lives + 1
    end
end

return lifeOnMarioContact
