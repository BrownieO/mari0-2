local Component = require "class.Component"
local jump = class("movement.jump", Component)

jump.argList = {
    {"jumpTime", "number", 3},
    {"jumpForce", "number", getRequiredSpeed(5*16)},
    {"jumpforceDown", "number", 2*16},
}

function jump:initialize(actor, args)
    Component.initialize(self, actor, args)
	self.jumpTimer = 0
end

function jump:update(dt)
	self.jumpTimer = self.jumpTimer + dt
	if self.jumpTimer > self.jumpTime then
		self.jumpTimer = self.jumpTimer - self.jumpTime
		--decide whether up or down
		local dir = "up"
		-- if self.y+self.height-0.01 > (mapheight-(self.jumponlyupdistfrombottom or 4)) then
			-- dir = "up"
		-- elseif self.actor.y < 6 then
			-- dir = "down"
		-- else
			-- if math.random(2) == 1 then
				-- dir = "up"
			-- else
				-- dir = "down"
			-- end
		-- end
		
		if dir == "up" then
			self.actor.speed[2] = -self.jumpForce
			--self.mask[2] = true
			self.jumping = "up"
			--self.falling = true
		else
			self.actor.speed[2] = -self.jumpForceDown
			--self.mask[2] = true
			self.jumping = "down"
			self.jumpingy = self.y
			--self.falling = true
		end
	end
	
	if self.jumping then
		if self.jumping == "up" then
			if self.actor.cache.speed[2] > 0 then
				self.jumping = false
				--self.mask[2] = false
			end
		elseif self.jumping == "down" then
			if self.actor.y > self.jumpingy + self.actor.height+1.1 then
				self.jumping = false
				--self.mask[2] = false
			end
		end
	end
end

return jump