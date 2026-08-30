local Component = require "class.Component"
local eventsOnContact = class("actReact.act.eventsOnContact", Component)

eventsOnContact.argList = {
    {"events", "required|table"},
    {"left", "boolean", false},
    {"right", "boolean", false},
    {"top", "boolean", false},
    {"bottom", "boolean", false},
}

return eventsOnContact
