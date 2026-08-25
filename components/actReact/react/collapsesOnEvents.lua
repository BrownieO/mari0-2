local Component = require "class.Component"
local collapsesOnEvents = class("misc.collapsesOnEvents", Component)

collapsesOnEvents.argList = {
    {"on", "required|table"},
}

function collapsesOnEvents:initialize(actor, args)
    Component.initialize(self, actor, args)
	collapse = function(self)
		playSound("knock")
		self.actor:destroy()
	end
	
	for _, v in ipairs(self.on) do
		self[v] = collapse
	end
end

return collapsesOnEvents