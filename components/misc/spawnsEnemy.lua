local Component = require "class.Component"
local Actor = require("class.Actor")
local spawnsEnemy = class("smb3.spawnsEnemy", Component)

spawnsEnemy.argList = {
    {"type", "string", "bowser_fire"},
    {"spawnenemydelay", "number"},
    {"spawnenemyspeedy", "number", 0},
    {"spawnenemyspeedx", "number", 0},
	{"spawnenemyoffsetx", "number", 0},
	{"spawnenemyoffsety", "number", 0},
	{"maxenemycount", "number"},
}

function spawnsEnemy:initialize(actor, args)
    Component.initialize(self, actor, args)
    self.enemyCount = 0
	self.actor.timer = 0
end

function spawnsEnemy:action()
	if not self.maxenemycount or self.enemyCount < self.maxenemycount then
		local enemy = Actor:new(
			self.actor.world,
			self.actor.cache.x+self.spawnenemyoffsetx*self.actor.animationDirection+((0.5*self.actor.animationDirection+0.5)*self.actor.width),
			self.actor.cache.y+self.spawnenemyoffsety,
			actorTemplates[self.type]
		)
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

function spawnsEnemy:update(dt)
	if self.spawnenemydelay then
		print(self.spawnenemydelay)
		self.actor.timer = self.actor.timer + dt
		if self.actor.timer >= self.spawnenemydelay then
			self.actor:event("action")
			self.actor.timer = 0
		end
	end
end

return spawnsEnemy
