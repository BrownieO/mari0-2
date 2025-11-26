local Component = require "class.Component"
local iFrames = class("smb3.iFrames", Component)

local IFRAMESTIME = 2.528 --FIXME: This value is from Kaizo Mario Maker
local IFRAMESSLOWTIME = 1

local IFRAMETIME = 6/30
local IFRAMETIMETIMESLOW = 3/30

function iFrames:getIFrames()
	if not self.actor.iFramed then
		self.actor.iFramed = true
	end
	
	self.actor.iFramesTimer = 0
end

function iFrames:loseIFrames()
    if self.actor.iFramed then
        self.actor.iFramed = false
        self.actor.iFramesTimer = 0
		self.actor.alpha = 1
    end
end

function iFrames:update(dt, actorEvent)
    if not self.actor.iFramed then
        return
    end

    self.actor.iFramesTimer = self.actor.iFramesTimer + dt

    local frameTime = (self.actor.iFramesTimer >= IFRAMESTIME - IFRAMESSLOWTIME)
        and IFRAMETIMETIMESLOW or IFRAMETIME
	
	local isTransparent = math.fmod(self.actor.iFramesTimer, frameTime) < frameTime/2
	
	if isTransparent then
		self.actor.alpha = 0
	else
		self.actor.alpha = 1
	end

    if self.actor.iFramesTimer >= IFRAMESTIME then
        self:loseIFrames()
    end
end

function iFrames:getHurt()
	if self.actor then
		self:getIFrames()
	end
end

return iFrames