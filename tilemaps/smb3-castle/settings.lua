local tiles = {}

local templates = VAR("tileTemplates")

tiles[64] = {
    img = "lava.png",
    delays = {8/60},
}

tiles[29] = {
	collision = templates.cube
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
