local tiles = {}

local templates = VAR("tileTemplates")

tiles[29] = {
	collision = templates.cube
}

tiles[55] = {
	lava = true,
}

tiles[64] = {
    img = "lava.png",
    delays = {8/60},
	lava = true,
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
