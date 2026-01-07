local Component = require "class.Component"
local metal = class("smb3.metal", Component)

local METALTIME = 19

local METALPALETTES = {
    convertPalette({
        {173, 173, 173},
        {102,  102, 102},
        {  0,   0,   0},
    }),
}

function metal:getMetalCap()
    if not self.metalActive then
        self.metalActive = true
        self.actor.metal = true

        love.audio.stop()
        playMusic("metal-mario")
    end

    self.actor.metalTimer = 0
end

function metal:loseMetalCap()
    if self.actor.metal then
        self.metalActive = false
        self.actor.metal = false
        self.actor.metalTimer = 0
        self.actor.palette = self.actor.defaultPalette

        love.audio.stop()
        playMusic(game.level.music)
    end
end

function metal:update(dt, actorEvent)
    if not self.actor.metal then
        return
    end

    self.actor.metalTimer = self.actor.metalTimer + dt
	
	if not self.starred then
		self.actor.palette = METALPALETTES[1]	
	end

    if self.actor.metalTimer >= METALTIME then
        self:loseMetalCap()
    end
end

return metal
