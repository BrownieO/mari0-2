local OptionsMenu = class("OptionsMenu")

function OptionsMenu:initialize(parent)
    self.parent = parent
	
	self.canvas = Gui3.Canvas:new(0, 0, SCREENWIDTH, SCREENHEIGHT)
	self.parent.canvas:addChild(self.canvas)
	
	love.graphics.setBackgroundColor({247/255, 216/255, 165/255})

	self.frame = Gui3.Image:new("img/ui/frame.png", 0, 0)
	self.canvas:addChild(self.frame)
	
	self.canvas:addChild(Gui3.Text:new(i18n.t("options.options"), SCREENWIDTH/2-love.graphics.getFont():getWidth(i18n.t("options.options"))/2, 38))

	self.language = Gui3.Dropdown:new(82, 84, i18n.t("options.language"), self.canvas)
	for i, v in pairs(i18n.getLocales()) do
		self.language.box:addChild(Gui3.TextButton:new(0, 10*(i-1), v, false, nil, function(button) i18n.setLocale(v) self.parent:changeWindow(self.canvas, "optionsMenu") end))
	end
	self.canvas:addChild(self.language)
	self.language:autoSize()
	
	self.resetMappacks = Gui3.TextButton:new(82, 84+18, i18n.t("options.resetMappacks"), false, 0, function()	
		for _, file in ipairs(VAR("includedMappacks")) do
			recursivelyDelete(file)
		end
	end)
	self.canvas:addChild(self.resetMappacks)
end

return OptionsMenu