local Deleter = class("Editor.Deleter")

function Deleter:initialize(editor)
    self.editor = editor

    self.level = self.editor.level
end

function Deleter:draw()
    local mouseX, mouseY = getWorldMouse()
    local coordX, coordY = self.level:cameraToCoordinate(mouseX, mouseY)
    local worldX, worldY = self.level:coordinateToWorld(coordX-1, coordY-1)

    Gui3.drawBox(self.editor.selectImg, self.editor.selectQuad, worldX, worldY, 16, 16)
end

function Deleter:update(dt)
    if self.penDown then
        local x, y = self.level:cameraToCoordinate(getWorldMouse())
        print(self.level.checkCollision(self.level,x,y,"foo",0,true))
    end
end

function Deleter:mousepressed(x, y, button)
    if button == 1 then
        self.penDown = true
    end

    return true
end

function Deleter:mousereleased(x, y, button)
    if self.penDown then
        self.editor:mapChanged()
        self.penDown = false
    end
end

return Deleter
