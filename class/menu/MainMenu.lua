local MainMenu = class("MainMenu")

function MainMenu:initialize(parent)
    self.parent = parent
	
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
	self.parent.canvas:addChild(self.canvas)
	
	local textStrings = {
		i18n.t("mainMenu.onePlayerGame"),
		i18n.t("mainMenu.selectMappack"),
		i18n.t("mainMenu.levelEditor"),
		i18n.t("mainMenu.options"),
	}
	
	local functions = {
		function() newGame(selectedMappackPath, false) end,
		function() self.parent:changeWindow(self.canvas, "mappackSelector") end,
		function() newGame(selectedMappackPath, true) end,
		function() end
	}
	
	local copyright = "© 2017-2025 Stabyourself.net"
	local logo = "other/logo.png"
		
	for i, text in pairs(textStrings) do
		local element = Gui3.TextButton:new(
			SCREENWIDTH/2-love.graphics.getFont():getWidth(text)/2,
			SCREENHEIGHT/2+18*(i-1),
			text,
			false, -- Outline
			0, -- Padding
			functions[i]
			)
		element.color.background = {0,0,0,0}
		self.canvas:addChild(element)
	end
	
	self.canvas:addChild(Gui3.Text:new(copyright, SCREENWIDTH/2-love.graphics.getFont():getWidth(copyright)/2, SCREENHEIGHT/2+18*4+8))
	self.canvas:addChild(Gui3.Image:new(logo, SCREENWIDTH/2-185/2, 16))
end


return MainMenu
