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

tiles[7] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "p_balloon",
    turnsInto = 1,
}

tiles[8] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "tanooki_suit",
    turnsInto = 1,
}

tiles[9] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "mushroom",
    turnsInto = 1,
}

tiles[10] = {
    collision = templates.cube,
    img = "qblock.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 1,
}

tiles[31] = {
    collision = templates.cube,
}

tiles[32] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "mushroom",
    turnsInto = 31,
}

tiles[33] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "fire_flower",
    turnsInto = 31,
}

tiles[34] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "super_leaf",
    turnsInto = 31,
}

tiles[35] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "starman",
    turnsInto = 31,
}

tiles[36] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "one_up",
    turnsInto = 31,
}

tiles[37] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "p_balloon",
    turnsInto = 31,
}

tiles[38] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "tanooki_suit",
    turnsInto = 31,
}

tiles[39] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "mushroom",
    turnsInto = 31,
}

tiles[40] = {
    collision = templates.cube,
    img = "qblockug.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 31,
}

tiles[60] = {
	collision = templates.cube,
	exclusiveCollision = 3,
	invisible = true,
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 31,
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
