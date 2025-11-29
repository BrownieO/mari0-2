local OpenWindow = class("OpenWindow")

OpenWindow.x = 14
OpenWindow.y = 14
OpenWindow.width = 8*17+21
OpenWindow.height = 200
OpenWindow.tileWidth = 8
OpenWindow.tileHeight = 2

function OpenWindow:initialize(editor)
    self.editor = editor
    self.depth = self.editor.depth

    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = true
    self.element.closeable = true
    self.element.scrollable = {true, true}
    self.element.title = "open"
    self.editor.canvas:addChild(self.element)

    self:goToMenu()
end

function OpenWindow:goToMenu()
    self.element:clearChildren()

    self.element.background = {0.5, 0.5, 0.5, 1}

    self:createTree("mappacks/")

    self.element.autoArrangeChildren = true
    self.element:sizeChanged()
end

function OpenWindow:createTree(path, depth)
    path = path or "."
    depth = depth or 0

    local files = love.filesystem.getDirectoryItems(path)

    for i, file in ipairs(files) do
        local fullPath = path .. "/" .. file
        local info = love.filesystem.getInfo(fullPath)

        if info and info.type == "directory" then
			self.element:addChild(Gui3.Text:new(file, 0, 0))
            self:createTree(fullPath, depth + 1)
		elseif file ~= "settings.lua" then
			self.element:addChild(Gui3.TextButton:new(0, 0, file, true, 0, function(button) self.editor:loadLevel(fullPath) end))
        end
    end
end

return OpenWindow
