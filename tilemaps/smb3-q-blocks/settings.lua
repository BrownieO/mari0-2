local tiles = {}

local templates = VAR("tileTemplates")

tiles[1] = {
    collision = templates.cube,
}

tiles[2] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "mushroom",
    turnsInto = 1,
}

tiles[3] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "fire_flower",
    turnsInto = 1,
}

tiles[4] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "super_leaf",
    turnsInto = 1,
}

tiles[5] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "starman",
    turnsInto = 1,
}

tiles[6] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "one_up",
    turnsInto = 1,
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
