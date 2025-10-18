local Component = require "class.Component"
local removeOnMarioContact = class("misc.removeOnMarioContact", Component)

function removeOnMarioContact:initialize(actor, args)
    Component.initialize(self, actor, args)
end

function removeOnMarioContact:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function removeOnMarioContact:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function removeOnMarioContact:topCollision(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function removeOnMarioContact:topCollision(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function removeOnMarioContact:resolve(dir, obj2)
    local collectsCoins = obj2:hasComponent("misc.collectsCoins")
    if collectsCoins then
            self.actor:destroy()
    end
end

return removeOnMarioContact