local ActorEdit = require("class.ActorEdit")
local LevelEdit = class("LevelEdit", Physics3.World)
local BlockBounce = require("class.BlockBounce")
local Viewport = require("class.Viewport")

function LevelEdit:initialize(path, players)
    self.players = {}
    
    local mapCode = love.filesystem.read(path)
    local data = sandbox.run(mapCode)
	self.currentLevelEdit = data

    self:loadLevel(data)

    self.timeLeft = 400
end

function LevelEdit:loadLevel(data)
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
	if VAR("debug").musicInEditor then
		playMusic(self.music)
	end

    self.spawnList = {}
	self.spawnI = 1

    for _, entity in ipairs(self.data.entities) do
		local actorTemplate = actorTemplates[entity.type]

        if actorTemplate then -- is enemy
			local spawnOffsetX = actorTemplate.spawnOffsetX or 0
			local spawnOffsetY = actorTemplate.spawnOffsetY or 0
			local x, y = self:coordinateToWorld(entity.x+spawnOffsetX+.5-1,entity.y+spawnOffsetY)
			
			ActorEdit:new(self, x, y, actorTemplate)
		end
	end
	
	table.sort(self.spawnList, function(a, b) return a.x<b.x end)

    self.viewports = {}
    table.insert(self.viewports, Viewport:new(self, 0, 0, CAMERAWIDTH, CAMERAHEIGHT, nil))

    self.camera = self.viewports[1].camera
end

function LevelEdit:update(dt)
    prof.push("World")
    prof.pop()

    updateGroup(self.viewports, dt)
end

function LevelEdit:draw()
    for _, viewport in ipairs(self.viewports) do
        viewport.camera:attach()

        Physics3.World.draw(self)

        viewport.camera:detach()
    end
end

function LevelEdit:mousepressed(x, y, button) end

function LevelEdit:cmdpressed(cmds) end

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
