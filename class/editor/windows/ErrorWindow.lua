local ErrorWindow = class("ErrorWindow")

ErrorWindow.width = 114
ErrorWindow.height = 64
ErrorWindow.x = 200-ErrorWindow.width/2
ErrorWindow.y = 112-ErrorWindow.height/2

function ErrorWindow:initialize(editor, title, content, icon, text1, text2)
    self.editor = editor

	self.width = math.min(400, love.graphics.getFont():getWidth(content))
	self.x = 200-self.width/2
	
    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = false
    self.element.closeable = true
    self.element.scrollable = {true, false}
    self.element.title = title or ""
    self.editor.canvas:addChild(self.element)
    self.element.background = {0.5, 0.5, 0.5}
	
	self.element:addChild(Gui3.Text:new(content, 0, 6))
	
	if icon == "_error" then
		playSound("error")
	elseif icon == "warning" then
		playSound("block")
	elseif icon == "question" then
		playSound("pluck")
	end
	
	if text1 then
		self.element:addChild(Gui3.TextButton:new(8, self.height-8-30, text1, true, 0, function(button) self.element:close() end))
	end
	
	if text2 then
		self.element:addChild(Gui3.TextButton:new(8, self.height-8-20, text2, true, 0, function(button) self.element:close() end))
	end
end

return ErrorWindow
