local Component = require "class.Component"
local Actor = require("class.Actor")
local spawnsEnemy = class("smb3.spawnsEnemy", Component)

spawnsEnemy.argList = {
    {"type", "string", "bowser_fire"},
    {"spawnenemydelay", "number", 3},
    {"spawnenemyspeedy", "number", 0},
    {"spawnenemyspeedx", "number", 0},
	{"maxenemycount", "number"},
	{"radius", "number"}
}

function spawnsEnemy:initialize(actor, args)
    Component.initialize(self, actor, args)
    self.enemyCount = 0
	self.actor.timer = 0
end

function spawnsEnemy:action()
	if not self.maxenemycount or self.enemyCount < self.maxenemycount then
		local enemy = Actor:new(self.actor.world, self.actor.cache.x+(self.actor.width/2), self.actor.cache.y+(self.actor.height/2), actorTemplates[self.type])
		enemy.parent = self.actor
		self.enemyCount = self.enemyCount + 1
		enemy.speed[2] = self.spawnenemyspeedy
		enemy.speed[1] = self.actor.animationDirection * self.spawnenemyspeedx
		enemy.animationDirection = self.actor.animationDirection
	end
end

function spawnsEnemy:childDestroyed()
	self.enemyCount = self.enemyCount - 1
end

function spawnsEnemy:inrange(i, a, b, include)
	if a > b then
		b, a = a, b
	end
	
	if include then
		return i >= a and i <= b
	else
		return i > a and i < b
	end
end

function spawnsEnemy:update(dt)
	self.actor.timer = self.actor.timer + dt
    if self.actor.timer >= self.spawnenemydelay then
        self.actor:event("action")
		self.actor.timer = 0
    end
end

return spawnsEnemy
