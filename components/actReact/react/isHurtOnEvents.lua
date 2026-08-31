local Component = require("class.Component")
local isHurtOnEvents = class("actReact.react.isHurtOnEvents", Component)

isHurtOnEvents.argList = {
    { "on", "required|table" },
}

function isHurtOnEvents:initialize(actor, args)
    Component.initialize(self, actor, args)
    for _, v in ipairs(self.on) do
        self[v] = function(component, dt, actorEvent, obj2)
            if obj2 then
                obj2:event("shotSuccess") --TODO: fix jank
            end
            self.actor:event("getHurtEnemy", nil, self.actor)
        end
    end
end

return isHurtOnEvents
