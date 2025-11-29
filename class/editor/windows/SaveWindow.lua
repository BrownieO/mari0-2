local SaveWindow = class("SaveWindow")

SaveWindow.x = 14
SaveWindow.y = 14
SaveWindow.width = 200
SaveWindow.height = 120

function SaveWindow:initialize(editor)
    self.editor = editor
    self.level = self.editor.level

    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = true
    self.element.closeable = true
    self.element.scrollable = {true, true}
    self.element.title = "save as"
    self.editor.canvas:addChild(self.element)

    self.element.background = {0.5, 0.5, 0.5}

	self.element:addChild(Gui3.Text:new(love.filesystem.getSaveDirectory(), 0, 0))
	self.element:addChild(Gui3.Text:new("level name:", 0, 16))
	
    self.textInput = Gui3.TextInput:new(0, 24, 64, 1)
    self.textInput.onSubmit = function()
        self.editor:saveLevel(self.textInput:getValue())
    end
    self.element:addChild(self.textInput)
	
	self.saveMsg = Gui3.Text:new(" ", 0, 32)
	self.element:addChild(self.saveMsg)
end

return SaveWindow
