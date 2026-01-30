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
		local spawnX, spawnY = self.level:coordinateToWorld(x+.5,y)

        if x ~= self.lastX or y ~= self.lastY then
			assert(self.level.ActorEdit, "The actor placer doesn't work on play mode yet. Maybe I should've told you earlier.")
			self.level.ActorEdit:new(self.level, spawnX, spawnY, self.tile)

            self.lastX = x
            self.lastY = y
        end
    end
end

function Placer:draw()
    local coordX, coordY = self.level:mouseToCoordinate()

	love.graphics.setColor(1, 1, 1, 0.5)

	local worldX, worldY = self.level:coordinateToWorld(coordX-1, coordY-1)
	assert(self.tile.quads, self.tile.name .. " needs quads to be drawn on the editor, but it still got included on the editor table somehow.")
	love.graphics.draw(self.tile.img, self.tile.quads[1], worldX, worldY+1)

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
