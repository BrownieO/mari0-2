local Component = require "class.Component"
local star = class("smb3.star", Component)

local STARTIME = 7.45
local STARFRAMESLOWTIME = 1

local STARFRAMETIME = 1/60
local STARFRAMETIMESLOW = 4/60

local STARPALETTES = {
    convertPalette({
        {252, 252, 252},
        {  0,   0,   0},
        {216,  40,   0},
    }),
    convertPalette({
        {252, 252, 252},
        {  0,   0,   0},
        { 76, 220,  72},
    }),
    convertPalette({
        {252, 188, 176},
        {  0,   0,   0},
        {252, 152,  56},
    })
}

function star:getStar()
    if not self.actor.starred then
        self.active = true
        self.actor.starred = true
        self.actor.somerSaultFrame = 2
        self.actor.somerSaultFrameTimer = 0

        love.audio.stop()
        playMusic("starman")
    end

    self.actor.starTimer = 0
end

function star:loseStar()
    if self.actor.starred then
        self.active = false
        self.actor.starred = false
        self.actor.starTimer = 0
        self.actor.palette = self.actor.defaultPalette

        love.audio.stop()
        playMusic(game.level.music)
    end
end

function star:update(dt, actorEvent)
    if not self.actor.starred then
        return
    end

    self.actor.starTimer = self.actor.starTimer + dt

    local frameTime = (self.actor.starTimer >= STARTIME - STARFRAMESLOWTIME)
        and STARFRAMETIMESLOW or STARFRAMETIME

    local totalCycleTime = (#STARPALETTES + 1) * frameTime
    local cyclePos = math.fmod(self.actor.starTimer, totalCycleTime)
    local paletteIndex = math.floor(cyclePos / frameTime) + 1

    if paletteIndex > #STARPALETTES then
        self.actor.palette = self.actor.defaultPalette
    else
        self.actor.palette = STARPALETTES[paletteIndex]
    end

    if self.actor.starTimer >= STARTIME then
        self:loseStar()
    end
end

function star:jump()
    if self.active and self.actor.onGround then
        self.actor.somerSaultFrame = 2
        self.actor.somerSaultFrameTimer = 0
    end
end

return star