local Mappacks = class("Mappacks")

function Mappacks:initialize()
end

function Mappacks:load()
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
    self.canvas.gui = defaultUI
	
	self.frame = Gui3.Image:new("img/ui/mappacks_frame.png", 0, 0)
	self.canvas:addChild(self.frame)
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