local ErrorWindow = class("ErrorWindow")

ErrorWindow.width = 114
ErrorWindow.height = 52
ErrorWindow.x = 200-ErrorWindow.width/2
ErrorWindow.y = 112-ErrorWindow.height/2


function ErrorWindow:initialize(editor, title, content, icon)
    self.editor = editor

	self.width = math.min(400, love.graphics.getFont():getWidth(content))
	self.x = 200-self.width/2
	
    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = false
    self.element.closeable = true
    self.element.scrollable = {false, false}
    self.element.title = title or ""
    self.editor.canvas:addChild(self.element)
    self.element.background = {0.5, 0.5, 0.5}
	
	self.element:addChild(Gui3.Text:new(content, 0, 6))
	
	if icon == "_error" then
		playSound("error")
	elseif icon == "question" then
		playSound("question")
	end
end

return ErrorWindow
