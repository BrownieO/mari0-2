local DebugWindow = class("DebugWindow")

DebugWindow.x = 14
DebugWindow.y = 14
DebugWindow.width = 8*17+21
DebugWindow.height = 200


local function changeTemplate(powerUp)
    game.players[1].actor:loadActorTemplate(actorTemplates["smb3_" .. powerUp])
	game.players[1].powerUp = powerUp
end

function DebugWindow:initialize(editor)
    self.editor = editor
    self.level = self.editor.level

    self.element = Gui3.Box:new(self.x, self.y, self.width, self.height)
    self.element:setDraggable(true)
    self.element.resizeable = true
    self.element.closeable = true
    self.element.background = {0.5, 0.5, 0.5, 1}
    self.element.scrollable = {true, true}
    self.element.title = "Debug"
    self.editor.canvas:addChild(self.element)

    self.element:addChild(Gui3.Text:new("State", 0, 0))
	self.element:addChild(Gui3.TextButton:new(0, 0, "Star", true, 0, function(button) game.players[1].actor:event("getStar") end))
	self.element:addChild(Gui3.TextButton:new(0, 0, "Metal", true, 0, function(button) game.players[1].actor:event("getMetalCap") end))

    self.element:addChild(Gui3.Text:new("Power-up", 0, 0))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Small", true, 0, function(button) changeTemplate("small") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Fire", true, 0, function(button) changeTemplate("fire") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Hammer", true, 0, function(button) changeTemplate("hammer") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Big", true, 0, function(button) changeTemplate("big") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Raccoon", true, 0, function(button) changeTemplate("raccoon") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Tanooki", true, 0, function(button) changeTemplate("tanooki") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "Frog", true, 0, function(button) changeTemplate("frog") end))
	self.element:addChild(Gui3.TextButton:new(0, 0, "Balloon", true, 0, function(button) changeTemplate("balloon") end))

    self.element.autoArrangeChildren = true
    self.element:sizeChanged()
end


return DebugWindow
