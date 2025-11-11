local Tracer = class("Physics3.Tracer") -- The cavalry is here

function Tracer:initialize(physObj, x, y, vector)
    self.physObj = physObj
    self.x = x
    self.y = y
    self.vector = vector
    self.vectorNormalized = self.vector:normalized()
    self.len = self.vector:len()
    self.tracedLength = 0

    self:cacheCoordinates()
end

function Tracer:cacheCoordinates()
    self.coordinateCache = {}

    for i = 1, self.len do
        local x = self.x + self.vectorNormalized.x * i
        local y = self.y + self.vectorNormalized.y * i

        self.coordinateCache[i] = {x, y}
    end
end

function Tracer:trace(ignoreGroups)
    -- Extra safety: if the physics object was destroyed, don't trace
    if not self.physObj.world then
        self.tracedLength = 0
        return
    end

    local i = 1

    while i <= self.len do
        local x = self.coordinateCache[i][1] + self.physObj.x
        local y = self.coordinateCache[i][2] + self.physObj.y

        local xRounded, yRounded

        if self.vector.y < 0 then -- don't ask me why
            yRounded = math.ceil(y)
        else
            yRounded = math.floor(y)
        end

        if self.vector.x < 0 then
            xRounded = math.ceil(x)
        else
            xRounded = math.floor(x)
        end

        local col
        if ignoreGroups then
            col = self.physObj.world:checkCollisionIgnoreGroups(xRounded, yRounded, self.physObj, self.vectorNormalized)
        else
            col = self.physObj.world:checkCollision(xRounded, yRounded, self.physObj, self.vectorNormalized)
        end

        if col then
            if ignoreGroups then
                -- Skip non-PhysObj collisions when doing contact checks (tiles, etc.)
                if not (col.class and col.class:isSubclassOf(Physics3.PhysObj)) then
                    i = i + 1 -- continue scanning for a PhysObj
                    goto continue
                end
                -- Record tracedLength for debug consistency with old tracer behavior
                self.tracedLength = i
            else
                self.tracedLength = i
            end
            return xRounded, yRounded, col
        end

        ::continue::
        i = i + 1
    end
    if not ignoreGroups then
        self.tracedLength = self.len
    end
end

function Tracer:traceIgnoreGroups()
    -- Wrapper kept for backwards compatibility
    return self:trace(true)
end

function Tracer:debugDraw()
    local angle = self.vector:angleTo()

    local x = self.x
    local y = self.y

    x = x + self.physObj.x
    y = y + self.physObj.y

    x = math.floor(x)
    y = math.floor(y)

    love.graphics.push()
    love.graphics.translate(x + .5, y + .5)
    love.graphics.rotate(angle)

    love.graphics.rectangle("fill", -.5, -.5, self.len, 1)
    if VAR("debug").tracerDebug then
        local r, g, b, a = love.graphics.getColor()

        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("fill", -.5, -.5, self.tracedLength, 1)

        love.graphics.setColor(r, g, b, a)
    end

    love.graphics.pop()
end

return Tracer