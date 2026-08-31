local Component = require("class.Component")
local knockedWhenHurt = class("actReact.react.knockedWhenHurt", Component)

function knockedWhenHurt:getHurt()
    playSound("knock")
    self.actor:destroy()
end

return knockedWhenHurt
