local Component = require "class.Component"
local piston = class("movement.piston", Component)

piston.argList = {
	{"pistonDistX", "number", 0},
	{"pistonDistY", "number", -32},
	{"pistonSpeedX", "number", 0},
	{"pistonSpeedY", "number", 2.3*16},
	{"pistonExtendTime", "number", 2},
	{"pistonRetractTime", "number", 1.8},
	{"dontPistonNearPlayer", "boolean", true},
	{"dontPistonDist", "number", 3*16},
	{"inactiveOnRetracted", "boolean", true},
}

function piston:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.actor.y = self.actor.y - self.pistonDistY
	self.startx = self.actor.x
	self.starty = self.actor.y
	self.pistontimer = 0
	self.pistonstate = "retracting"
end

function piston:inrange(i, a, b, include)
	if a > b then
		b, a = a, b
	end
	
	if include then
		return i >= a and i <= b
	else
		return i > a and i < b
	end
end

function piston:update(dt)
	self.pistontimer = self.pistontimer + dt
	
	if self.pistonstate == "extending" then		
		--move X
		if self.actor.x > self.startx + self.pistonDistX then
			self.actor.x = self.actor.x - self.pistonSpeedX*dt
			if self.actor.x < self.startx + self.pistonDistX then
				self.actor.x = self.startx + self.pistonDistX
			end
		elseif self.actor.x < self.startx + self.pistonDistX then
			self.actor.x = self.actor.x + self.pistonSpeedX*dt
			if self.actor.x > self.startx + self.pistonDistX then
				self.actor.x = self.startx + self.pistonDistX
			end
		end
		
		--move Y
		if self.actor.y > self.starty + self.pistonDistY then
			self.actor.y = self.actor.y - self.pistonSpeedY*dt
			if self.actor.y < self.starty + self.pistonDistY then
				self.actor.y = self.starty + self.pistonDistY
			end
		elseif self.actor.y < self.starty + self.pistonDistY then
			self.actor.y = self.actor.y + self.pistonSpeedY*dt
			if self.actor.y > self.starty + self.pistonDistY then
				self.actor.y = self.starty + self.pistonDistY
			end
		end
		
		if self.actor.x == self.startx + self.pistonDistX and self.actor.y == self.starty + self.pistonDistY and not self.spawnallow then
			self.spawnallow = true
			self.spawnenemytimer = self.spawnenemydelay
		end
		
		if self.pistontimer > self.pistonExtendTime then
			self.pistontimer = 0
			self.spawnallow = false
			self.pistonstate = "retracting"
		end
		
		
	else --retracting			
		--move X
		if self.actor.x > self.startx then
			self.actor.x = self.actor.x - self.pistonSpeedX*dt
			if self.actor.x < self.startx then
				self.actor.x = self.startx
			end
		elseif self.actor.x < self.startx then
			self.actor.x = self.actor.x + self.pistonSpeedX*dt
			if self.actor.x > self.startx then
				self.actor.x = self.startx
			end
		end
		
		--move Y
		if self.actor.y > self.starty then
			self.actor.y = self.actor.y - self.pistonSpeedY*dt
			if self.actor.y < self.starty then
				self.actor.y = self.starty
			end
		elseif self.actor.y < self.starty then
			self.actor.y = self.actor.y + self.pistonSpeedY*dt
			if self.actor.y > self.starty then
				self.actor.y = self.starty
			end
		end
		
		if self.inactiveOnRetracted and self.actor.x == self.startx and self.actor.y == self.starty then
			self.active = false
		end
		
		if self.pistontimer > self.pistonRetractTime then
			local playernear = false
			for i = 1, #game.players do
				local v = game.players[i]
				if self:inrange(
				v.actor.x + v.actor.width/2,
				self.actor.cache.x + self.actor.width/2 - (self.dontPistonDist),
				self.actor.cache.x + self.actor.width/2 + (self.dontPistonDist)
				) then
					playernear = true
					break
				end
			end
			
			if not self.dontPistonNearPlayer or not playernear then
				self.pistontimer = 0
				self.pistonstate = "extending"
				self.active = true
			end
		end
	end
end

return piston