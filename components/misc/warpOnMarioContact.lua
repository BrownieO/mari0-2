local Component = require "class.Component"
local removeOnMarioContact = class("misc.removeOnMarioContact", Component)

removeOnMarioContact.argList = {
    {"level", "required|string"},
}

function removeOnMarioContact:initialize(actor, args)
    Component.initialize(self, actor, args)
end

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
    local collectsCoins = obj2:hasComponent("misc.collectsCoins")
    if collectsCoins then
		game:changeLevel(self.level)
    end
end

return removeOnMarioContact
