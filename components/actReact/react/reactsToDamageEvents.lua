local Component = require("class.Component")
local reactToDamageEvents = class("actReact.react.reactToDamageEvents", Component)

reactToDamageEvents.argList = {
    { "on", "required|table" },
}

function reactToDamageEvents:collapse(dt, actorEvent, obj2)
	if obj2 then
		obj2:event("shotSuccess")
	end
	playSound("knock")
	self.actor:destroy()
end

function reactToDamageEvents:getHurt(dt, actorEvent, obj2)
	if obj2 then
		obj2:event("shotSuccess")
	end
	self.actor:event("getHurtEnemy", nil, self.actor)
end

function reactToDamageEvents:explodeProjectile(dt, actorEvent, obj2)
	obj2:event("shotFailure")
end

function reactToDamageEvents:initialize(actor, args)
    Component.initialize(self, actor, args)
    for i, v in pairs(self.on) do
        self[i] = function(component, dt, actorEvent, obj2)
			self[v](component, dt, actorEvent, obj2)
		end
    end
end

return reactToDamageEvents
