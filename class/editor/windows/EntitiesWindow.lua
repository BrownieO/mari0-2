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
    self.element.title = i18n.t("editor.entities")
    self.editor.canvas:addChild(self.element)

    self:goToMenu()
end

function EntitiesWindow:goToMenu()
	self.tileMap = {}
	for _, v in ipairs(actorTemplates.list) do
		table.insert(self.tileMap, actorTemplates[v])
	end

    self.element:clearChildren()

    self.element.background = self.editor.checkerboardImg

	local idLabel = Gui3.Text:new("0", 60, 1)
	self.element:addChild(idLabel)

    self.tileGrid = Gui3.TileGrid:new(1, 16, self.tileMap,
        function(TileGrid, i)
            TileGrid:setSelected(i)

            self.editor:selectEntity(actorTemplates[actorTemplates.list[i]])
			
			print(i)
			idLabel:setString(tostring(i))
        end
    )

    -- select tile if the tilemap is the same
    if tileMap == self.editor.tools.paint.tile.tileMap then -- select it
        self.tileGrid:setSelected(self.editor.tools.paint.tile.num)
    end

    self.element:addChild(self.tileGrid)
    self.element.autoArrangeChildren = false
    self.element:sizeChanged()
end

return EntitiesWindow
