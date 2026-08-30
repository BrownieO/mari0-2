local Component = require "class.Component"
local getEventsByContact = class("actReact.react.getEventsByContact", Component)

function getEventsByContact:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function getEventsByContact:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function getEventsByContact:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function getEventsByContact:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function getEventsByContact:resolve(dir, obj2)
    local component = obj2:hasComponent("actReact.act.eventsOnContact")
    if component then
		if component[dir] then
			for _, v in ipairs(component["events"]) do
				self.actor:event(v, dt)
			end
		end
	end
end

return getEventsByContact