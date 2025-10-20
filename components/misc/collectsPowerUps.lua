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
    if powerUpComponent and powerUpComponent["powerUpType"] then
		if actorTemplates[ "smb3_" .. powerUpComponent["powerUpType"] ] then
			self.actor:loadActorTemplate(actorTemplates["smb3_" .. powerUpComponent["powerUpType"]])
		end
    end
end

return collectsPowerUps