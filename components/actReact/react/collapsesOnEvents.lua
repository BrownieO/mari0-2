local Component = require("class.Component")
local collapsesOnEvents = class("misc.collapsesOnEvents", Component)

collapsesOnEvents.argList = {
    { "on", "required|table" },
}

function collapsesOnEvents:initialize(actor, args)
    Component.initialize(self, actor, args)
    for _, v in ipairs(self.on) do
        self[v] = function(component, dt, actorEvent, obj2)
            if obj2 then
                obj2:event("shotSuccess") --TODO: fix jank
            end
            playSound("knock")
            component.actor:destroy()
        end
    end
end

return collapsesOnEvents
