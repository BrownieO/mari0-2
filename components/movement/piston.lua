local Component = require "class.Component"
local piston = class("movement.piston", Component)

piston.argList = {
	{"pistondistx", "number", 0},
	{"pistondisty", "number", -32},
	{"pistonspeedx", "number", 0},
	{"pistonspeedy", "number", 2.3*16},
	{"pistonextendtime", "number", 2},
	{"pistonretracttime", "number", 1.8},
	{"dontpistonnearplayer", "boolean", true},
	{"dontpistondist", "number", 3},
	{"inactiveonretracted", "boolean", true},
}

function piston:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.actor.y = self.actor.y - self.pistondisty
	self.startx = self.actor.x
	self.starty = self.actor.y
	self.pistontimer = 0
	self.pistonstate = "extending"
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
		if self.actor.x > self.startx + self.pistondistx then
			self.actor.x = self.actor.x - self.pistonspeedx*dt
			if self.actor.x < self.startx + self.pistondistx then
				self.actor.x = self.startx + self.pistondistx
			end
		elseif self.actor.x < self.startx + self.pistondistx then
			self.actor.x = self.actor.x + self.pistonspeedx*dt
			if self.actor.x > self.startx + self.pistondistx then
				self.actor.x = self.startx + self.pistondistx
			end
		end
		
		--move Y
		if self.actor.y > self.starty + self.pistondisty then
			self.actor.y = self.actor.y - self.pistonspeedy*dt
			if self.actor.y < self.starty + self.pistondisty then
				self.actor.y = self.starty + self.pistondisty
			end
		elseif self.actor.y < self.starty + self.pistondisty then
			self.actor.y = self.actor.y + self.pistonspeedy*dt
			if self.actor.y > self.starty + self.pistondisty then
				self.actor.y = self.starty + self.pistondisty
			end
		end
		
		if self.actor.x == self.startx + self.pistondistx and self.actor.y == self.starty + self.pistondisty and not self.spawnallow then
			self.spawnallow = true
			self.spawnenemytimer = self.spawnenemydelay
		end
		
		if self.pistontimer > self.pistonextendtime then
			self.pistontimer = 0
			self.spawnallow = false
			self.pistonstate = "retracting"
		end
		
		
	else --retracting			
		--move X
		if self.actor.x > self.startx then
			self.actor.x = self.actor.x - self.pistonspeedx*dt
			if self.actor.x < self.startx then
				self.actor.x = self.startx
			end
		elseif self.actor.x < self.startx then
			self.actor.x = self.actor.x + self.pistonspeedx*dt
			if self.actor.x > self.startx then
				self.actor.x = self.startx
			end
		end
		
		--move Y
		if self.actor.y > self.starty then
			self.actor.y = self.actor.y - self.pistonspeedy*dt
			if self.actor.y < self.starty then
				self.actor.y = self.starty
			end
		elseif self.actor.y < self.starty then
			self.actor.y = self.actor.y + self.pistonspeedy*dt
			if self.actor.y > self.starty then
				self.actor.y = self.starty
			end
		end
		
		if self.inactiveonretracted and self.actor.x == self.startx and self.actor.y == self.starty then
			self.active = false
		end
		
		if self.pistontimer > self.pistonretracttime then
			local playernear = false
			for i = 1, #game.players do
				local v = game.players[i]
				if self:inrange(
				v.actor.x+v.actor.width/2,
				self.actor.x+self.actor.width/2-(self.dontpistondist or 3),
				self.actor.cache.x+self.actor.width/2+(self.dontpistondist or 3),
				false) then
					playernear = true
					break
				end
			end
			
			if not self.dontpistonnearplayer or not playernear then
				self.pistontimer = 0
				self.pistonstate = "extending"
				self.active = true
			end
		end
	end
end

return piston