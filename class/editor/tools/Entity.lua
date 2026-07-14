local Entity = class("Editor.Entity")

function Entity:initialize(editor)
    self.editor = editor
    self.level = self.editor.level
end

function Entity:mousepressed(x, y, button, istouch, presses)
    if button == 2 then
		if self.dropdown then
			self.editor.canvas:removeChild(self.dropdown)
		end
        local pixelX,pixelY = self.level:cameraToWorld(getWorldMouse())
        local obj2 = self.level.checkCollision(self.level,pixelX,pixelY,"foo",0,true,true)
		if obj2 and obj2.components and obj2.rightClickMenu then
			--create the dropdown
			self.dropdown = Gui3.Box:new(x, y, 168, 168)
			self.dropdown.background = {1,1,1,1}
			self.dropdown.noMouseEvents = false
			self.editor.canvas:addChild(self.dropdown)
			
			--populate it
			for component, args in pairs(obj2.rightClickMenu) do
				for i, arg in ipairs(args) do
					local label = Gui3.Text:new(arg, 0, 2*(i-1)*10)
					self.dropdown:addChild(label)
					local input = Gui3.TextInput:new(0,2*i*10-12, 21, nil, obj2.components[component][arg])
					self.dropdown:addChild(input)
				end
			end
		end
		self.editor.canvas:updateMouseRegions()
		self.editor.canvas:updateRender()
		
        return true
    end
end

function Entity:unSelect()
	if self.dropdown then
		self.editor.canvas:removeChild(self.dropdown)
	end
end

return Entity