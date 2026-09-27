local Component = require("class.Component")
local pedestalButton = class("actReact.act.pedestalButton", Component)

pedestalButton.argList = {
    {"delay", "number", 1.1},
    {"preventFastReset", "boolean", false},
}

function pedestalButton:initialize(actor, args)
	Component.initialize(self, actor, args)
	self.actor.timer = self.delay
	self.on = false
	self.actor.quad = self.actor.quads[1]
end

function pedestalButton:used()
	if self.preventFastReset and self.actor.timer < self.delay then return end
	self.actor.timer = 0
	self.on = true
	self.actor.quad = self.actor.quads[2]
	playSound("pedestal_button_down", 0.3)
end

function pedestalButton:update(dt)
	if self.actor.timer < self.delay then
		self.actor.timer = self.actor.timer + dt
	elseif self.on then
		self.actor.quad = self.actor.quads[1]
		playSound("pedestal_button_up", 0.3)
		self.on = false
	end
end

return pedestalButton
