local Component = require "class.Component"
local collectsPowerUps = class("misc.collectsPowerUps", Component)

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
	local powerUpComponent = obj2:hasComponent("misc.powerUp")
	if not powerUpComponent then return	end

	local currentPowerUp = self.actor.player.powerUp
	local isWhitelisted = true

	if powerUpComponent["whitelist"] and next(powerUpComponent["whitelist"]) then
		isWhitelisted = false
		for _, whitelisted in ipairs(powerUpComponent["whitelist"]) do
			if currentPowerUp == whitelisted then
				isWhitelisted = true
				break
			end
		end
	end

	if isWhitelisted and powerUpComponent["blacklist"] and next(powerUpComponent["blacklist"]) then
		for _, blacklisted in ipairs(powerUpComponent["blacklist"]) do
			if currentPowerUp == blacklisted then
				isWhitelisted = false
				break
			end
		end
	end

	if isWhitelisted and powerUpComponent["powerUpType"] then
		local templateKey = "smb3_" .. powerUpComponent["powerUpType"]
		if actorTemplates[templateKey] then
			self.actor:loadActorTemplate(actorTemplates[templateKey])
			self.actor.player.powerUp = powerUpComponent["powerUpType"]
		end
	end
	playSound("mushroom-eat")
	obj2:destroy()
end

return collectsPowerUps