local SaveWindow = class("SaveWindow")

SaveWindow.x = 14
SaveWindow.y = 14
SaveWindow.width = 300
SaveWindow.height = 80

function SaveWindow:initialize(editor)
    self.editor = editor
    self.level = self.editor.level

    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = true
    self.element.closeable = true
    self.element.scrollable = {true, true}
    self.element.title = i18n.t("editor.saveAs")
    self.editor.canvas:addChild(self.element)

    self.element.background = {0.5, 0.5, 0.5}

	self.element:addChild(Gui3.Text:new(love.filesystem.getSaveDirectory(), 0, 0))
	self.element:addChild(Gui3.Text:new(i18n.t("editor.levelName"), 0, 16))

	self.saveMsg = Gui3.Text:new(" ", 0, 36)
	self.element:addChild(self.saveMsg)

    self.textInput = Gui3.TextInput:new(0, 24, 64, 1)
    self.textInput.onSubmit = function()
        self.saveMsg:setString(self.editor:saveLevel("/mappacks/" .. self.textInput:getValue()))
    end
    self.element:addChild(self.textInput)
end

return SaveWindow
