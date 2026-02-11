local Gui3 = ...
Gui3.Text = class("Gui3.Text", Gui3.Element)

Gui3.Text.noMouseEvents = true

function Gui3.Text:initialize(s, x, y)
    self.s = s
    self.text = love.graphics.newText(fontOutlined, s)

    Gui3.Element.initialize(self, x, y, fontOutlined:getWidth(s), fontOutlined:getHeight(s))
end

function Gui3.Text:setString(s)
    if self.s ~= s then
        self.s = s
        self.text:set(self.s)

        self:updateRender()

        if self.w ~= fontOutlined:getWidth(s) then
            self.w = fontOutlined:getWidth(s)
            self:sizeChanged()
        end
    end
end

function Gui3.Text:draw()
    Gui3.Element.draw(self)

    love.graphics.draw(self.text, 0, -1)
end

return Gui3.Text
