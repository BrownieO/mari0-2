local Component = require "class.Component"
local collapsesOnEvents = class("misc.collapsesOnEvents", Component)

collapsesOnEvents.argList = {
    {"on", "required|table"},
}

function collapsesOnEvents:initialize(actor, args)
    Component.initialize(self, actor, args)
	for _, v in ipairs(self.on) do
		self[v] = function(component, dt, actorEvent, obj2)
			obj2:event("projectileSuccess")
			playSound("knock")
			component.actor:destroy()
		end
	end
end

return collapsesOnEvents