local Actor = require("class.Actor")
local LevelEdit = class("LevelEdit", Physics3.World)
local BlockBounce = require("class.BlockBounce")
local Viewport = require("class.Viewport")

function LevelEdit:initialize(path, players)
    self.players = {}
    
    local mapCode = love.filesystem.read(path)
    local data = sandbox.run(mapCode)
	self.currentLevelEdit = data

    self:loadLevelEdit(data)

    self.timeLeft = 400
end

function LevelEdit:loadLevelEdit(data)
    self.data = data
	self.currentLevelEdit = data

    Physics3.World.initialize(self)
    Physics3.World.loadLevel(self, self.data)

    self.backgroundColor = {
        (self.data.backgroundColor and self.data.backgroundColor[1] or 181)/255,
        (self.data.backgroundColor and self.data.backgroundColor[2] or 235)/255,
        (self.data.backgroundColor and self.data.backgroundColor[3] or 242)/255
    }

    love.graphics.setBackgroundColor(self.backgroundColor)
	
	self.background = self.data.background or nil
	self.wrapX = self.data.wrapX or false	
	self.wrapY = self.data.wrapY or false	
	self.music = self.data.music or nil
	love.audio.stop()
	playMusic(self.music)

    self.spawnLine = 0
    self.spawnI = 1

    self.portalProjectiles = {} -- Portal projectiles, duh.

    self.spawnList = {}
	self.exitList = {}
	self.entitiesInBlocks = {}

    self.viewports = {}
    if #self.players > 0 then
        table.insert(self.viewports, Viewport:new(self, 0, 0, CAMERAWIDTH, CAMERAHEIGHT, self.players[1].actor))
    else
        table.insert(self.viewports, Viewport:new(self, 0, 0, CAMERAWIDTH, CAMERAHEIGHT, nil))
    end

    self.camera = self.viewports[1].camera
end

function LevelEdit:update(dt)
    self.timeLeft = math.max(0, self.timeLeft-(60/42)*dt) -- that's 42.86% more second, per second!
    
    prof.push("World")
    Physics3.World.update(self, dt)
    prof.pop()

    updateGroup(self.viewports, dt)

    prof.push("Post Update")
    for _, obj in ipairs(self.objects) do
        if obj.postUpdate then
            obj:postUpdate(dt)
        end
    end
    prof.pop()

	--LevelEdit boundary/border wrap-around
    if #self.players > 0 and self.players[1].actor.y > self:getYEnd()*self.tileSize+.5 then
		if self.wrapY then
			self.players[1].actor.y = -1
		else
			self.players[1].actor:event("getKilled")
			self.players[1].actor:event("getHurt")
		end
    end
	
    if self.wrapX and #self.players > 0 and self.players[1].actor.x > self:getXEnd()*self.tileSize then
		self.players[1].actor.x = -1
    end
end

function LevelEdit:draw()
    for _, viewport in ipairs(self.viewports) do
        viewport.camera:attach()

        Physics3.World.draw(self)

        viewport.camera:detach()
    end
end

function LevelEdit:drawBehindObjects()
    for _, portalProjectile in ipairs(self.portalProjectiles) do
        portalProjectile:draw()
    end
end

function LevelEdit:cmdpressed(cmds)
    if #self.players == 0 then return end
end

function LevelEdit:mousepressed(x, y, button)
    for _, obj in ipairs(self.objects) do
        obj:event("click", 0, button)
    end
end

function LevelEdit:objVisible(x, y, w, h)
    local lx, ty = self.camera:worldCoords(0, 0)
    local rx, by = self.camera:worldCoords(self.camera.w, self.camera.h)

    return x+w > lx and x < rx and
        y+h > ty and y < by
end

function LevelEdit:resize(w, h)
    self.camera.w = w
    self.camera.h = CAMERAHEIGHT
end

return LevelEdit
