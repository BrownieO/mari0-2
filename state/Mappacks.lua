local Mappacks = class("Mappacks")

function Mappacks:initialize()
end

Mappacks.mappacks = {}

function Mappacks:readMappacks(path)
    path = path or "."

    local files = love.filesystem.getDirectoryItems(path)

    for i, file in ipairs(files) do
        local fullPath = path .. file .. "/settings.lua"
		
		local mappackCode, errorMsg = love.filesystem.read(fullPath)
		if mappackCode then
			local data = sandbox.run(mappackCode)
			table.insert(Mappacks.mappacks, data)
		end
    end
end

function Mappacks:populateSelector(mappacks, element)
	for i, mappack in ipairs(mappacks) do
		print(mappack.name)
		local button = Gui3.ImageButton:new(0, 0, "img/ui/default_icon.png", false, false, function() end)
		element:addChild(button)
	end
end

function Mappacks:load()
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
    self.canvas.gui = defaultUI
	
	self.frame = Gui3.Image:new("img/ui/mappacks_frame.png", 0, 0)
	self.canvas:addChild(self.frame)
	
	self.element = Gui3.Box:new(20, 16, 206, 192)
	self.element.scrollable = {true, true}
	self.element.autoArrangeChildren = true
	self.canvas:addChild(self.element)
	
	Mappacks:readMappacks("mappacks/")
	Mappacks:populateSelector(Mappacks.mappacks, self.element)
end

function Mappacks:update(dt)
    prof.push("UI")
    self.canvas:update(dt)
    prof.pop()
end

function Mappacks:draw()
    prof.push("UI")

    love.graphics.setColor(1, 1, 1)
    love.graphics.push()
    love.graphics.origin()
    self.canvas:rootDraw()
    love.graphics.pop()

    prof.pop()
end

return Mappacks