local tiles = {}

local templates = VAR("tileTemplates")

local items = {nil, "mushroom", "fire_flower", "super_leaf", "starman", "one_up", "p_balloon", "tanooki_suit", "mushroom", "coin"}
items[0] = "coin"

-- Used blocks
tiles[1] = {
    collision = templates.cube,
}
tiles[31] = {
    collision = templates.cube,
}

-- Q blocks
for i = 2, 10 do
	tiles[i] = {
	    collision = templates.cube,
		img = "qblock.png",
		delays = {8/60},
		holdsItems = true,
		defaultItem = items[i],
		turnsInto = 1,
	}
end

-- Bricks
for i = 12, 20 do
	tiles[i] = {
	    collision = templates.cube,
		img = "brick.png",
		delays = {8/60},
		holdsItems = true,
		defaultItem = items[i % 10],
		turnsInto = 1,
	}
end

-- Invisible Q blocks
for i = 22, 30 do
	tiles[i] = {
		collision = templates.cube,
		exclusiveCollision = 3,
		invisible = true,
		holdsItems = true,
		defaultItem = items[i % 10],
		turnsInto = 1,
	}
end

-- Underground Q blocks
for i = 32, 40 do
	tiles[i] = {
	    collision = templates.cube,
		img = "qblockug.png",
		delays = {8/60},
		holdsItems = true,
		defaultItem = items[i % 10],
		turnsInto = 31,
	}
end

-- Underground bricks
for i = 42, 50 do
	tiles[i] = {
	    collision = templates.cube,
		img = "brickug.png",
		delays = {8/60},
		holdsItems = true,
		defaultItem = items[i % 10],
		turnsInto = 31,
	}
end

-- Invisible underground Q blocks
for i = 52, 60 do
	tiles[i] = {
		collision = templates.cube,
		exclusiveCollision = 3,
		invisible = true,
		holdsItems = true,
		defaultItem = items[i % 10],
		turnsInto = 31,
	}
end

-- Note blocks
tiles[61] = {
    collision = templates.cube,
	noteblock = true,
	img = "note_block.png",
	delays = {8/60},
}

for i = 62, 70 do
	tiles[i] = {
		collision = templates.cube,
		noteblock = true,
		img = "note_block.png",
		delays = {8/60},
		holdsItems = true,
		defaultItem = items[i % 10],
		turnsInto = 61,
	}
end

tiles[71] = {
    collision = templates.cube,
	noteblock = true,
	noteblockForceY = VAR("enemyBounceHeight")*2
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props