local Component = require "class.Component"
local collectsPowerUps = class("misc.collectsPowerUps", Component)

function collectsPowerUps:rightCollision(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function collectsPowerUps:leftCollision(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function collectsPowerUps:topCollision(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function collectsPowerUps:bottomCollision(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function collectsPowerUps:resolve(dir, obj2)
	local isWhitelisted = true
    local powerUpComponent = obj2:hasComponent("misc.powerUp")
	
    if powerUpComponent then
		if powerUpComponent["whitelist"] then
			if next(powerUpComponent["whitelist"]) then
				isWhitelisted = false
				for _, whitelisted in ipairs(powerUpComponent["whitelist"]) do
					if self.actor.player.powerUp == whitelisted then
						isWhitelisted = true
					end
				end
			end
		end
	
		if isWhitelisted then
			if powerUpComponent["blacklist"] then
				if next(powerUpComponent["blacklist"]) then
					isWhitelisted = false
					for _, blacklisted in ipairs(powerUpComponent["blacklist"]) do
						if self.actor.player.powerUp == blacklisted then
							return
						end
					end
				end
			end
		
			if powerUpComponent["powerUpType"] then
				if actorTemplates[ "smb3_" .. powerUpComponent["powerUpType"] ] then
					self.actor:loadActorTemplate(actorTemplates["smb3_" .. powerUpComponent["powerUpType"]])
					self.actor.player.powerUp = powerUpComponent["powerUpType"]
				end
			end
		end
		playSound("mushroom-eat")
		obj2:destroy()
    end
end

return collectsPowerUps