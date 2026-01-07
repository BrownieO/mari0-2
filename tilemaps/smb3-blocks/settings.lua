local tiles = {}

local templates = VAR("tileTemplates")

tiles[1] = {
	name = "Empty block",
    collision = templates.cube
}

tiles[2] = {
	name = "Hard block",
    collision = templates.cube
}

tiles[3] = {
	name = "Brick block",
    collision = templates.cube,
    img = "brick.png",
    delays = {8/60},
    holdsItems = true,
	breakable = true,
    turnsInto = 1
}

tiles[4] = {
	name = "Question block",
    collision = templates.cube,
    img = "q_block.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 1
}

tiles[5] = {
	name = "Coin",
    img = "coin.png",
    delays = {8/60},
    coin = true
}

tiles[6] = {
	name = "Hidden block",
	collision = templates.cube,
	exclusiveCollision = 3,
	invisible = true,
	holdsItems = true,
	defaultItem = "coin",
	turnsInto = 1
}

tiles[7] = {
	name = "P coin",
    img = "p_coin.png",
    delays = {8/60},
    coin = true
}

tiles[8] = {
	name = "Bouncy hard block",
    collision = templates.cube,
	noteblock = true
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
