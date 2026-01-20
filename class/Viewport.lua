local Camera = require "lib.Camera"

local Viewport = class("Viewport")

function Viewport:initialize(level, x, y, w, h, target)
    self.level = level
    self.camera = Camera.new(0, 0, w, h, x, y, 1, 0, Camera.smooth.linear(VAR("cameraScrollRate")))
    self.target = target

    if self.target then
        self.camera:lookAt(self.target.x, self.target.y)
    end
end

function Viewport:draw()

end

function Viewport:update(dt)
    if self.target then
        -- Horizontal
        local pX = self.target.x + self.target.width/2
        local pXr = pX - self.camera.x

        local targetX = self.camera.x
        if pXr > RIGHTSCROLLBORDER then
            targetX = pX - RIGHTSCROLLBORDER
        elseif pXr < LEFTSCROLLBORDER then
            targetX = pX - LEFTSCROLLBORDER
        end

        -- Vertical
        local pY = self.target.y + self.target.height/2
        local pYr = pY - self.camera.y

        local targetY = self.camera.y
        if pYr > DOWNSCROLLBORDER then
            targetY = pY - DOWNSCROLLBORDER
        end

        -- Only scroll up in flight mode
        if self.target.flying or self.camera.y < self.level:getYEnd()*16-CAMERAHEIGHT or true then -- Always enabled for now
            if pYr < UPSCROLLBORDER then
                targetY = pY - UPSCROLLBORDER
            end
        end

        -- Clamp to level boundaries
        targetX = math.min(targetX, self.level:getXEnd()*16-self.camera.w/2)
        targetX = math.max(targetX, (self.level:getXStart()-1)*16+self.camera.w/2)

        targetY = math.min(targetY, self.level:getYEnd()*16-self.camera.h/2)
        targetY = math.max(targetY, (self.level:getYStart()-1)*16+self.camera.h/2)

        self.camera:lockPosition(targetX, targetY)
    end
end

return Viewport
