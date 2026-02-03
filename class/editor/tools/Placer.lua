local Placer = class("Editor.Placer")
local ActorEdit = require("class.ActorEdit")

function Placer:initialize(editor)
    self.editor = editor

    self.level = self.editor.level
    self.penDown = false
    self.tile = actorTemplates["goomba"]
	self.tile.num = actorTemplates.map["goomba"]
end

function Placer:update()
    if self.penDown then
        local x, y = self.level:mouseToCoordinate()
		local pixelX, pixelY = self.level:coordinateToWorld(x + (self.tile.spawnOffsetX or 0) -.5, y + (self.tile.spawnOffsetY or 0))

        if x ~= self.lastX or y ~= self.lastY then
			assert(self.level.ActorEdit, "The actor placer doesn't work on play mode yet. Maybe I should've told you earlier.")
			local newActor = self.level.ActorEdit:new(self.level, pixelX, pixelY, self.tile)
			newActor.spawnX = x
			newActor.spawnY = y

            self.lastX = x
            self.lastY = y
        end
    end
end

function Placer:draw()
	--Actor preview cursor
    local x, y = self.level:mouseToCoordinate()

	love.graphics.setColor(1, 1, 1, 0.5)

	local pixelX, pixelY = self.level:coordinateToWorld(x + (self.tile.spawnOffsetX or 0) - .5, y + (self.tile.spawnOffsetY or 0))
	assert(self.tile.quads, self.tile.name .. " needs quads to be drawn on the editor, but it still got included on the editor table somehow.")
	love.graphics.draw(self.tile.img, self.tile.quads[1], pixelX, pixelY-self.tile.height/2, 0, 1, 1, self.tile.centerX, self.tile.centerY)

	love.graphics.setColor(1, 1, 1)
end

function Placer:mousepressed(x, y, button)
    if button == 1 then
        self.penDown = true

        self.lastX = nil
        self.lastY = nil
    end

    return true
end

function Placer:mousereleased(x, y, button)
    if self.penDown then
        self.penDown = false

        self.editor:mapChanged()
    end
end

return Placer
