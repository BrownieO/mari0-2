local Gui3 = ...
Gui3.TextInput = class("Gui3.TextInput", Gui3.Element)

Gui3.TextInput.padding = 2
Gui3.TextInput.blinkInterval = 0.5
Gui3.TextInput.charHeight = 8
Gui3.TextInput.charWidth = 8

function Gui3.TextInput:initialize(x, y, charW, lines)
    charW = charW or 16
    lines = lines or 1
    
    self.charW = charW
    self.lines = lines
    self.maxLength = 0
    
    self.value = ""
    self.text = love.graphics.newText(fontOutlined, "")
    
    self.cursorPos = 1
    self.focus = false
    self.blinkTimer = 0
    self.cursorVisible = true
    self.offset = 0
    
    local w = self.charW * Gui3.TextInput.charWidth + self.padding * 2
    local h = self.lines * Gui3.TextInput.charHeight + self.padding * 2
    
    Gui3.Element.initialize(self, x, y, w, h)
end

function Gui3.TextInput:updateDisplay()
    if self.lines == 1 then
        self.text:set(string.sub(self.value, self.offset + 1, self.offset + self.charW))
    else
        local lines = {}
        local idx = 1
        for i = 1, self.lines do
            lines[i] = string.sub(self.value, idx, idx + self.charW - 1)
            idx = idx + self.charW
        end
        self.text:set(table.concat(lines, "\n"))
    end
end

function Gui3.TextInput:updateOffset()
    if self.lines == 1 then
        if self.cursorPos > self.offset + self.charW then
            self.offset = self.cursorPos - self.charW
        elseif self.cursorPos <= self.offset then
            self.offset = math.max(0, self.cursorPos - 1)
        end
    end
end

function Gui3.TextInput:resetBlink()
    self.cursorVisible = true
    self.blinkTimer = 0
end

function Gui3.TextInput:draw()
    local borderColor = self.focus and 1 or 0.7
    love.graphics.setColor(borderColor, borderColor, borderColor)
    love.graphics.rectangle("line", 0.5, 0.5, self.w - 1, self.h - 1)
    
    love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.rectangle("fill", 1, 1, self.w - 2, self.h - 2)
    
    love.graphics.setColor(1, 1, 1)
    self:updateDisplay()
    love.graphics.draw(self.text, self.padding + 1, self.padding + 1)
    
    if self.focus and self.cursorVisible then
        if self.lines == 1 then
            local cursorX = (self.cursorPos - self.offset - 1) * Gui3.TextInput.charWidth + self.padding + 1
            love.graphics.rectangle("fill", cursorX, self.padding + 1, 1, Gui3.TextInput.charHeight)
        else
            local line = math.floor((self.cursorPos - 1) / self.charW) + 1
            local col = (self.cursorPos - 1) % self.charW
            
            if line <= self.lines then
                local cursorX = col * Gui3.TextInput.charWidth + self.padding + 1
                local cursorY = (line - 1) * Gui3.TextInput.charHeight + self.padding + 1
                love.graphics.rectangle("fill", cursorX, cursorY, 1, Gui3.TextInput.charHeight)
            end
        end
    end
    
    Gui3.Element.draw(self)
end

function Gui3.TextInput:update(dt)
    if self.focus then
        self.blinkTimer = self.blinkTimer + dt
        if self.blinkTimer >= Gui3.TextInput.blinkInterval then
            self.cursorVisible = not self.cursorVisible
            self.blinkTimer = 0
            self:updateRender()
        end
    end
end

function Gui3.TextInput:mousepressed(x, y, button)
    if button == 1 then
        self.focus = true
        self:updateRender()
    end
    
    Gui3.Element.mousepressed(self, x, y, button)
end

function Gui3.TextInput:textinput(text)
    if self.focus and (self.maxLength == 0 or #self.value < self.maxLength) then
        self.value = self.value:sub(1, self.cursorPos - 1) .. text .. self.value:sub(self.cursorPos)
        self.cursorPos = self.cursorPos + #text
        self:updateOffset()
        self:updateRender()
        
        if self.onChange then
            self:onChange()
        end
    end
end

function Gui3.TextInput:keypressed(key)
    if not self.focus then
        return
    end
    
    if key == "backspace" then
        if self.cursorPos > 1 then
            self.value = self.value:sub(1, self.cursorPos - 2) .. self.value:sub(self.cursorPos)
            self.cursorPos = self.cursorPos - 1
            self:updateOffset()
            self:updateRender()
            
            if self.onChange then
                self:onChange()
            end
        end
    elseif key == "delete" then
        if self.cursorPos <= #self.value then
            self.value = self.value:sub(1, self.cursorPos - 1) .. self.value:sub(self.cursorPos + 1)
            self:updateRender()
            
            if self.onChange then
                self:onChange()
            end
        end
    elseif key == "left" then
        if self.cursorPos > 1 then
            self.cursorPos = self.cursorPos - 1
            self:resetBlink()
            self:updateOffset()
            self:updateRender()
        end
    elseif key == "right" then
        if self.cursorPos < #self.value + 1 then
            self.cursorPos = self.cursorPos + 1
            self:resetBlink()
            self:updateOffset()
            self:updateRender()
        end
    elseif key == "home" then
        self.cursorPos = 1
        self.offset = 0
        self:resetBlink()
        self:updateRender()
    elseif key == "end" then
        self.cursorPos = #self.value + 1
        if self.lines == 1 then
            self.offset = math.max(0, #self.value - self.charW + 1)
        end
        self:resetBlink()
        self:updateRender()
    elseif key == "return" or key == "enter" or key == "kpenter" then
        if self.onSubmit then
            self:onSubmit()
        end
        self.focus = false
        self:updateRender()
    elseif key == "escape" then
        self.focus = false
        self:updateRender()
    end
    
    return true
end

function Gui3.TextInput:setValue(value)
    self.value = tostring(value or "")
    self.cursorPos = #self.value + 1
    self.offset = 0
    self:updateRender()
end

function Gui3.TextInput:getValue()
    return self.value
end

function Gui3.TextInput:clear()
    self.value = ""
    self.cursorPos = 1
    self.offset = 0
    self:updateRender()
end

function Gui3.TextInput:blur()
    self.focus = false
    self:updateRender()
end

return Gui3.TextInput
