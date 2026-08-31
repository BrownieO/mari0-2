local Component = require("class.Component")
local collectsPowerUps = class("actReact.act.collectsPowerUps", Component)

function collectsPowerUps:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function collectsPowerUps:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function collectsPowerUps:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function collectsPowerUps:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function collectsPowerUps:resolve(dir, obj2)
    local powerUpComponent = obj2:hasComponent("actReact.tag.powerUp")
    if not powerUpComponent then
        return
    end

    local currentPowerUp = self.actor.player.powerUp
    local allowed = true

    if powerUpComponent["whitelist"] and next(powerUpComponent["whitelist"]) then
        allowed = false
        for _, whitelisted in ipairs(powerUpComponent["whitelist"]) do
            if currentPowerUp == whitelisted then
                allowed = true
                break
            end
        end
    end

    if allowed and powerUpComponent["blacklist"] and next(powerUpComponent["blacklist"]) then
        for _, blacklisted in ipairs(powerUpComponent["blacklist"]) do
            if currentPowerUp == blacklisted then
                allowed = false
                break
            end
        end
    end

    if allowed then
        if powerUpComponent["powerUpType"] then
            local templateKey = "smb3_" .. powerUpComponent["powerUpType"]
            if actorTemplates[templateKey] then
                self.actor:loadActorTemplate(actorTemplates[templateKey])
                self.actor.player.powerUp = powerUpComponent["powerUpType"]
            end
        end
        if powerUpComponent["powerUpEvent"] then
            self.actor:event(powerUpComponent["powerUpEvent"])
        end
    end
    playSound("mushroom_eat")
    obj2:destroy()
end

return collectsPowerUps
