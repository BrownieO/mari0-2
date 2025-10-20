local Component = require "class.Component"
local isHurtByContact = class("misc.isHurtByContact", Component)

function isHurtByContact:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end


function isHurtByContact:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function isHurtByContact:resolve(dir, obj2)
    local hurtsByContactComponent = obj2:hasComponent("misc.hurtsByContact")
    if hurtsByContactComponent and hurtsByContactComponent[dir] then
        if not hurtsByContactComponent.onlyWhenMoving or obj2.cache.speed[1] ~= 0 then
            -- hurt stuff
            print("oof")
			if self.actor.player.powerUp == "small" then
				love.window.showMessageBox("f", "You died!", "info", true)
			else
				self.actor:loadActorTemplate(actorTemplates["smb3_small"])
				self.actor.player.powerUp = "small"
			end
			
        end
    end
end

return isHurtByContact