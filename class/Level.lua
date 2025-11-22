local Actor = require("class.Actor")
local Level = class("Level", Physics3.World)
local BlockBounce = require("class.BlockBounce")
local Viewport = require("class.Viewport")

function Level:initialize(path)
    local mapCode = love.filesystem.read(path)
    local data = sandbox.run(mapCode)
	self.currentLevel = data

    self:loadLevel(data)

    self.timeLeft = 400
end

function Level:loadLevel(data)
    self.data = data
	self.currentLevel = data

    Physics3.World.initialize(self)
    Physics3.World.loadLevel(self, self.data)

    self.backgroundColor = self.data.backgroundColor or {156, 252, 240}
    self.backgroundColor[1] = self.backgroundColor[1]/255
    self.backgroundColor[2] = self.backgroundColor[2]/255
    self.backgroundColor[3] = self.backgroundColor[3]/255

    love.graphics.setBackgroundColor(self.backgroundColor)
	
	self.music = self.data.music or nil
	love.audio.stop()
	playMusic(self.music)

    self.spawnLine = 0
    self.spawnI = 1

    self.portalProjectiles = {} -- Portal projectiles, duh.

    self.spawnList = {}
    -- Parse entities
    for _, entity in ipairs(self.data.entities) do
        local actorTemplate = actorTemplates[entity.type]

        if actorTemplate and not VAR("debug").noEnemies then -- is enemy
            -- Extract custom properties
            local customProperties = {}
            for propertyKey, propertyValue in pairs(entity) do
                if propertyKey ~= "type" and propertyKey ~= "x" and propertyKey ~= "y" then
                    customProperties[propertyKey] = propertyValue
                end
            end
            
            table.insert(self.spawnList, {
                actorTemplate = actorTemplate,
                x = entity.x,
                y = entity.y,
                customProperties = customProperties,
            })
        elseif entity.type == "spawn" then
            self.spawnX = entity.x
            self.spawnY = entity.y
        end
    end

    table.sort(self.spawnList, function(a, b) return a.x<b.x end)

    self.actors = {}
	
	if not self.spawnX or not self.spawnY then
		self.spawnX = 2
		self.spawnY = 12
	end
	
    local x, y = self:coordinateToWorld(self.spawnX-.5, self.spawnY)

    for i = 1, #game.players do
        local player = game.players[i]

        local mario = Actor:new(self, x, y, actorTemplates.smb3_small)
        mario.player = player
        player.actor = mario
		mario:loadActorTemplate(actorTemplates["smb3_" .. mario.player.powerUp])

        -- apply settings like character palette and portal colors
        if player.palette then
            mario.palette = player.palette
        end

        table.insert(self.actors, mario)
    end

    self.viewports = {}
    table.insert(self.viewports, Viewport:new(self, 0, 0, CAMERAWIDTH, CAMERAHEIGHT, game.players[1].actor))

    self.camera = self.viewports[1].camera

    self:spawnActors(self.viewports[1].camera.x+CAMERAWIDTH/16+VAR("enemiesSpawnAhead")+2)
end

function Level:update(dt)
    self.timeLeft = math.max(0, self.timeLeft-(60/42)*dt) -- that's 42.86% more second, per second!

    prof.push("Portal Projectiles")
    updateGroup(self.portalProjectiles, dt)
    prof.pop()

    prof.push("Actor Cleanup")
    for i = #self.actors, 1, -1 do
        if self.actors[i].destroyed or self.actors[i].deleteMe then
            table.remove(self.actors, i)
        end
    end
    prof.pop()
    
    prof.push("World")
    Physics3.World.update(self, dt)
    prof.pop()

    updateGroup(self.viewports, dt)

    prof.push("Post Update")
    for _, obj in ipairs(self.objects) do
        if obj.postUpdate then
            obj:postUpdate(dt)
        end
    end
    prof.pop()

    if game.players[1].actor.y > self:getYEnd()*self.tileSize+.5 then
        game.players[1].actor.y = -1
    end

    local newSpawnLine = self.camera.x/self.tileSize+self.camera.w/16+VAR("enemiesSpawnAhead")+2
    if newSpawnLine > self.spawnLine then
        self:spawnActors(newSpawnLine)
    end
end

function Level:draw()
    for _, viewport in ipairs(self.viewports) do
        viewport.camera:attach()

        Physics3.World.draw(self)

        viewport.camera:detach()
    end
end

function Level:drawBehindObjects()
    for _, portalProjectile in ipairs(self.portalProjectiles) do
        portalProjectile:draw()
    end
end

function Level:cmdpressed(cmds)
    if cmds["jump"] then
        game.players[1].actor:event("jump")
    end

    if cmds["run"] then
        game.players[1].actor:event("action")
    end

    if cmds["closePortals"] then
        game.players[1].actor:event("closePortals")
    end

    if cmds["debug.star"] then -- debug
        game.players[1].actor:event("getStar")
    end
end

function Level:mousepressed(x, y, button)
    for _, obj in ipairs(self.objects) do
        obj:event("click", 0, button)
    end
end

function Level:spawnActors(untilX)
    while self.spawnI <= #self.spawnList and untilX > self.spawnList[self.spawnI].x do -- Spawn next enemy
        toSpawn = self.spawnList[self.spawnI]
        local x, y = self:coordinateToWorld(toSpawn.x-.5, toSpawn.y)
        local actor = Actor:new(self, x, y, toSpawn.actorTemplate, toSpawn.customProperties)

        table.insert(self.actors, actor)

        self.spawnI = self.spawnI + 1

        -- Update untilX so enemies spawn in groups
        untilX = untilX + 2
    end

    self.spawnLine = untilX
end

function Level:bumpBlock(cell, actor, dontBreak)
    local tile = cell.tile

    if tile.props.breakable or tile.props.holdsItems then
		-- Collect coins above
		if cell.layer.map[cell.x][cell.y - 1].tile then
			if cell.layer.map[cell.x][cell.y - 1].tile.props.coin then
				self:collectCoin(actor, cell.layer, cell.x, cell.y - 1)
			end
		end
		
		if tile.props.breakable and not dontBreak then
			cell.layer.map[cell.x][cell.y].tile = nil
			return
		end
        -- Make it bounce
        cell.layer:bounceCell(cell.x, cell.y)
		
        if tile.props.turnsInto then
            local turnIntoTile = tile.tileMap.tiles[tile.props.turnsInto]

            cell.layer:setCoordinate(cell.x, cell.y, turnIntoTile)
        end

        -- Check what's inside
        local item = tile.props.defaultItem
        if item == "coin" then
            self:collectCoin(actor)
		elseif item then
			local sprout = Actor:new(self, cell.x*16-8, (cell.y-1)*16, actorTemplates[item])
			table.insert(self.actors, sprout)
        end
    end
end

function Level:collectCoin(actor, layer, x, y)
    if layer then
        layer.map[x][y].tile = nil
    end
	playSound("coin")
    actor.player.coins = actor.player.coins + 1
end

function Level:objVisible(x, y, w, h)
    local lx, ty = self.camera:worldCoords(0, 0)
    local rx, by = self.camera:worldCoords(self.camera.w, self.camera.h)

    return x+w > lx and x < rx and
        y+h > ty and y < by
end

function Level:resize(w, h)
    self.camera.w = w
    self.camera.h = CAMERAHEIGHT
end

return Level
