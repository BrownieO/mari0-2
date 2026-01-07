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
    self.element.title = "debug"
    self.editor.canvas:addChild(self.element)

    self.element:addChild(Gui3.Text:new("state", 0, 0))
	self.element:addChild(Gui3.TextButton:new(0, 0, "star", true, 0, function(button) game.players[1].actor:event("getStar") end))
	self.element:addChild(Gui3.TextButton:new(0, 0, "metal", true, 0, function(button) game.players[1].actor:event("getMetalCap") end))

    self.element:addChild(Gui3.Text:new("power-up", 0, 0))
    self.element:addChild(Gui3.TextButton:new(0, 0, "small", true, 0, function(button) changeTemplate("small") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "fire", true, 0, function(button) changeTemplate("fire") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "hammer", true, 0, function(button) changeTemplate("hammer") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "big", true, 0, function(button) changeTemplate("big") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "raccoon", true, 0, function(button) changeTemplate("raccoon") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "tanooki", true, 0, function(button) changeTemplate("tanooki") end))
    self.element:addChild(Gui3.TextButton:new(0, 0, "frog", true, 0, function(button) changeTemplate("frog") end))
	self.element:addChild(Gui3.TextButton:new(0, 0, "balloon", true, 0, function(button) changeTemplate("balloon") end))

    self.element.autoArrangeChildren = true
    self.element:sizeChanged()
end


return DebugWindow
