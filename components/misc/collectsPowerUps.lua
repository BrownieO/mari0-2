local Component = require "class.Component"
local collectsPowerUps = class("misc.collectsPowerUps", Component)

function collectsPowerUps:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function collectsPowerUps:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function collectsPowerUps:resolve(dir, obj2)
    local powerUpComponent = obj2:hasComponent("misc.powerUp")
    if powerUpComponent then
        --power-up stuff
		print("helth")
    end
end

return collectsPowerUps