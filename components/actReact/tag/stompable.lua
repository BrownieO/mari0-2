local Component = require("class.Component")
local stompable = class("actReact.tag.stompable", Component)

stompable.argList = {
    { "level", "number", 1 },
    { "dies", "boolean", false },
}

function stompable:getStomped()
    playSound("stomp")
    if self.dies then
        self.actor:destroy()
    end
end

return stompable
