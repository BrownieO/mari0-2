local MappackSelector = class("MappackSelector")

function MappackSelector:readMappacks(path)
    path = path or "."

    local files = love.filesystem.getDirectoryItems(path)

    for i, file in ipairs(files) do
        local fullPath = path .. file .. "/settings.lua"
		
		local mappackCode, errorMsg = love.filesystem.read(fullPath)
		if mappackCode then
			local data = sandbox.run(mappackCode)
			table.insert(MappackSelector.mappacks, data)
			table.insert(MappackSelector.paths, path .. file)
			table.insert(MappackSelector.folders, file)
		end
    end
end

function MappackSelector:populateSelector(mappacks, element)
	for i, mappack in ipairs(mappacks) do
		local icon = MappackSelector.paths[i] .. "/" .. mappack.icon
		
		local button = Gui3.ImageButton:new(0, (i-1)*64, icon, false, false, function()
			selectedMappackPath = MappackSelector.folders[i]
		end)
		element:addChild(button)
	end
end

function MappackSelector:initialize(parent)
    self.parent = parent
	love.graphics.setBackgroundColor({0, 0, 0})
	
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
	self.parent.canvas:addChild(self.canvas)
	
	self.frame = Gui3.Image:new("img/ui/mappacks_frame.png", 0, 0)
	self.canvas:addChild(self.frame)
	
	self.element = Gui3.Box:new(20, 16, 206, 192)
	self.element.scrollable = {false, true}
	self.element.autoArrangeChildren = true
	self.canvas:addChild(self.element)
	
	MappackSelector.mappacks = {}
	MappackSelector.paths = {}
	MappackSelector.folders = {}
	
	MappackSelector:readMappacks("mappacks/")
	MappackSelector:populateSelector(MappackSelector.mappacks, self.element)
end


return MappackSelector
