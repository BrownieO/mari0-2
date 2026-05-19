local EntitiesWindow = class("EntitiesWindow")

EntitiesWindow.x = 14
EntitiesWindow.y = 14
EntitiesWindow.width = 8*17+21
EntitiesWindow.height = 200
EntitiesWindow.tileWidth = 8
EntitiesWindow.tileHeight = 2

function EntitiesWindow:initialize(editor)
    self.editor = editor
    self.level = self.editor.level

    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = true
    self.element.closeable = true
    self.element.scrollable = {true, true}
    self.element.title = i18n.t("editor.tiles")
    self.editor.canvas:addChild(self.element)

    self:goToMenu()
end

function EntitiesWindow:goToMenu()
    self.element:clearChildren()

    self.element.background = self.editor.checkerboardImg

	local idLabel = Gui3.Text:new("0", 60, 1)
	self.element:addChild(idLabel)

    self.element.autoArrangeChildren = false
    self.element:sizeChanged()
end

return EntitiesWindow
