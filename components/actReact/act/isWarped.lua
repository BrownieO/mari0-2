local Component = require "class.Component"
local isWarped = class("misc.isWarped", Component)

function isWarped:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function isWarped:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function isWarped:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function isWarped:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function isWarped:resolve(dir, obj2)
    local warpComponent = obj2:hasComponent("misc.warp")
    if warpComponent then
		if not warpComponent["key"] or controls3.cmdDown(warpComponent["key"]) then
			if warpComponent["level"] then
				if warpComponent["exitId"] then
					self.actor.player.exitId = warpComponent["exitId"]
				end
				game:changeLevel(warpComponent["level"])
			end
		end
    end
end

return isWarped