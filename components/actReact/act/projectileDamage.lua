local Component = require("class.Component")
local projectileDamage = class("actReact.act.projectileDamage", Component)

projectileDamage.argList = {
    { "onlyWhenMoving", "boolean", true },
}

function projectileDamage:rightContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end
function projectileDamage:leftContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end
function projectileDamage:topContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end
function projectileDamage:bottomContact(dt, actorEvent, obj2)
    self:resolve(obj2)
end

function projectileDamage:resolve(obj2)
    local targetComponent = obj2:hasComponent("actReact.react.collapsesOnEvents")
    if targetComponent then
        if not self.onlyWhenMoving or self.actor.cache.speed[1] ~= 0 then
            obj2:event("getProjectileDamage")
        end
    end
end

return projectileDamage
