local tiles = {}

local templates = VAR("tileTemplates")

tiles[1] = {
    collision = templates.cube,
    holdsItems = true,
    defaultItem = "wing_cap",
    turnsInto = 0,
}

tiles[2] = {
    collision = templates.cube,
    holdsItems = true,
    defaultItem = "metal_cap",
    turnsInto = 0,
}

tiles[3] = {
    collision = templates.cube,
    holdsItems = true,
    defaultItem = "vanish_cap",
    turnsInto = 0,
}

tiles[4] = {
    collision = templates.cube,
    holdsItems = true,
    defaultItem = "starman",
    turnsInto = 0,
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
    stampMaps = stampMaps
}

return props
