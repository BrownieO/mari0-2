local Component = require "class.Component"
local using = class("source.using", Component)

local USE_RANGE = 16

function using:use()
	xcenter = self.actor.x + 6 + math.cos(self.actor.aimingAngle)*USE_RANGE
	ycenter = self.actor.y + 6 + math.sin(self.actor.aimingAngle)*USE_RANGE

	if self.actor.pickup then return end
	
	for _, obj2 in ipairs(self.actor.world.actors) do
		if self.actor ~= obj2 then
			if obj2:hasComponent("actReact.tag.useable") then
				if intersectRectangles(xcenter - USE_RANGE/2, ycenter - USE_RANGE/2, USE_RANGE, USE_RANGE, obj2.x, obj2.y, obj2.width, obj2.height) then
					obj2:event("used", dt, self.actor)
				end
			end
		end
	end
end

-- function using:draw()
    -- love.graphics.rectangle("fill", xcenter - USE_RANGE/2, ycenter - USE_RANGE/2, USE_RANGE, USE_RANGE)
-- end

return using
