local Menus = class("Menus")

Menus.windowClasses = {
    mappackSelector = require("class.menu.MappackSelector"),
    mainMenu = require("class.menu.MainMenu"),
}

function Menus:newWindow(windowClass)
	table.insert(self.windows, windowClass:new(self))
end

function Menus:changeWindow(oldWindow, windowClass)
	table.remove(self.windows, 1)
	self.canvas:removeChild(oldWindow)
	self:newWindow(self.windowClasses[windowClass])
end

function Menus:initialize(selectedMenu)
	self.selectedMenu = selectedMenu
end

function Menus:load()
	self.windows = {}

	love.graphics.setBackgroundColor({181/255, 235/255,242/255})
	love.audio.stop()
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
    self.canvas.gui = defaultUI
	self:newWindow(self.windowClasses[self.selectedMenu])
end



function Menus:update(dt)
    prof.push("UI")
    self.canvas:update(dt)
    self.canvas:rootmousemoved(love.mouse.getX()/VAR("scale"), love.mouse.getY()/VAR("scale"))
    prof.pop()
end

function Menus:draw()
    prof.push("UI")

    love.graphics.setColor(1, 1, 1)
    love.graphics.push()
    love.graphics.origin()
    self.canvas:rootDraw()
    love.graphics.pop()

    prof.pop()
end



function Menus:mousepressed(x, y, button)
    if self.canvas:rootmousepressed(x, y, button) then
        return true
    end
end

function Menus:mousereleased(x, y, button)
    if self.canvas:rootmousereleased(x, y, button) then
        return true
    end
end

return Menus