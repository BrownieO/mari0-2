local Component = require "class.Component"
local iFrames = class("smb3.iFrames", Component)

local IFRAMESTIME = 2.528 --FIXME: This value is from Kaizo Mario Maker

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
    end
end

function iFrames:update(dt, actorEvent)
    if not self.actor.iFramed then
        return
    end

    self.actor.iFramesTimer = self.actor.iFramesTimer + dt

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