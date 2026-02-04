local Deleter = class("Editor.Deleter")

function Deleter:initialize(editor)
    self.editor = editor

    self.level = self.editor.level
end

function Deleter:update(dt)
    if self.penDown then
        local pixelX,pixelY = self.level:cameraToWorld(getWorldMouse())
        local obj2 = self.level.checkCollision(self.level,pixelX,pixelY,"foo",0,true,true)
		if obj2 then
			obj2:destroy()
		end
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
