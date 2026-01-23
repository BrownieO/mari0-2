local MainMenu = class("MainMenu")

function MainMenu:initialize(parent)
    self.parent = parent
	
	love.graphics.setBackgroundColor({181/255, 235/255, 242/255})
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
	self.parent.canvas:addChild(self.canvas)
	
	self.canvas:addChild(Gui3.TextButton:new(SCREENWIDTH/2-52, SCREENHEIGHT/2, "1 player game", false, 0, function(button) self.parent:changeWindow(self.canvas, "mappackSelector") end))
	self.canvas:addChild(Gui3.TextButton:new(SCREENWIDTH/2-52, SCREENHEIGHT/2+18, "Select game", false, 0, function(button) self.parent:changeWindow(self.canvas, "mappackSelector") end))
	self.canvas:addChild(Gui3.TextButton:new(SCREENWIDTH/2-52, SCREENHEIGHT/2+18*2, "Level editor", false, 0, function(button) self.parent:changeWindow(self.canvas, "mappackSelector") end))
	self.canvas:addChild(Gui3.TextButton:new(SCREENWIDTH/2-52, SCREENHEIGHT/2+18*3, "Options", false, 0, function(button) end))
	self.canvas:addChild(Gui3.Text:new("© 2017-2025 Stabyourself.net", SCREENWIDTH/2-104-8, SCREENHEIGHT/2+18*4+8))
	self.canvas:addChild(Gui3.Image:new("other/logo.png", 109, 16))
end


return MainMenu
