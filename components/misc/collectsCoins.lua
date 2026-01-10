local Component = require "class.Component"
local collectsCoins = class("misc.collectsCoins", Component)

function collectsCoins:update(actor, args)
    for mX = 0, 1 do
        for mY= 0, 1 do
            self:checkPos(self.actor.x + (self.actor.width-1)*mX, self.actor.y + (self.actor.height-1)*mY)
        end
    end
end

function collectsCoins:checkPos(x, y)
    local coordX, coordY = self.actor.world:worldToCoordinate(x, y)

    for _, layer in ipairs(self.actor.world.layers) do
        if layer:inMap(coordX, coordY) then
            local tile = layer:getTile(coordX, coordY)

            if tile and tile.props.coin then
                self.actor.world:collectCoin(self.actor, layer, coordX, coordY)
            end
        end
    end
end

function collectsCoins:rightContact(dt, actorEvent, obj2)
    self:resolve("left", obj2)
end

function collectsCoins:leftContact(dt, actorEvent, obj2)
    self:resolve("right", obj2)
end

function collectsCoins:topContact(dt, actorEvent, obj2)
    self:resolve("bottom", obj2)
end

function collectsCoins:bottomContact(dt, actorEvent, obj2)
    self:resolve("top", obj2)
end

function collectsCoins:resolve(dir, obj2)
	if obj2.coin then
		obj2:destroy()
		self.actor.world:collectCoin(self.actor)
	end
end

return collectsCoins
