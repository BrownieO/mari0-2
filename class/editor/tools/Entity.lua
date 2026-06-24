local Entity = class("Editor.Entity")

function Entity:initialize(editor)
    self.editor = editor
    self.level = self.editor.level
end

function Entity:mousepressed(x, y, button, istouch, presses)
	if self.dropdown then
		self.editor.canvas:removeChild(self.dropdown)
	end
    if button == 2 then
        local pixelX,pixelY = self.level:cameraToWorld(getWorldMouse())
        local obj2 = self.level.checkCollision(self.level,pixelX,pixelY,"foo",0,true,true)
		if obj2 and obj2.components and obj2.rightClickMenu then
			self.dropdown = Gui3.Box:new(x, y, 50, 100)
			self.dropdown.background = {1,1,1,1}
			self.editor.canvas:addChild(self.dropdown)
		end
    end
	self.editor.canvas:updateRender()
    return true
end

return Entity