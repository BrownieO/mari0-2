local Component = require "class.Component"
local defeatEffects = class("misc.defeatEffects", Component)

defeatEffects.argList = {
    {"mappings", "table"},
}

function defeatEffects:initialize(actor, args)
	Component.initialize(self, actor, args)

    for effect, triggers in pairs(self.mappings) do
        for _, trigger in ipairs(triggers) do
            self[trigger] = function(self, dt)
				self.actor:event(effect, dt)
                -- if type(self[effect]) == "function" then
                    -- self[effect](self, dt)
				-- end
            end
        end
    end
end

function defeatEffects:squashEffect()
	playSound("stomp")
	self.actor:destroy()
end

function defeatEffects:collapseEffect()
	playSound("knock")
	self.actor:destroy()
end

return defeatEffects