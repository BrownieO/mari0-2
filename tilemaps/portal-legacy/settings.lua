local tiles = {}

local templates = VAR("tileTemplates")

tiles[2] = {
	name = "Metal wall medium",
    collision = templates.cube,
    nonPortalable = true
}
tiles[3] = {
	name = "Metal wall small",
    collision = templates.cube,
    nonPortalable = true
}
tiles[4] = {
	name = "Metal wall big top left",
    collision = templates.cube,
    nonPortalable = true
}
tiles[5] = {
	name = "Metal wall big top right",
    collision = templates.cube,
    nonPortalable = true
}
tiles[6] = {
	name = "Metal wall big bottom left",
    collision = templates.cube,
    nonPortalable = true
}
tiles[7] = {
	name = "Metal wall big bottom right",
    collision = templates.cube,
    nonPortalable = true
}
tiles[8] = {
	name = "Concrete wall top",
    collision = templates.cube,
}
tiles[9] = {
	name = "Concrete wall",
    collision = templates.cube,
}
tiles[10] = {
	name = "Doorframe top",
    collision = templates.cube,
    nonPortalable = true
}
tiles[11] = {
	name = "Doorframe bottom",
    collision = templates.cube,
    nonPortalable = true
}
tiles[12] = {
	name = "Elevator",
    collision = templates.cube,
    nonPortalable = true
}
tiles[13] = {
	name = "Elevator",
    collision = templates.cube,
    nonPortalable = true
}
tiles[20] = {
	name = "Elevator",
    collision = templates.cube,
    nonPortalable = true
}
tiles[21] = {
	name = "Elevator",
    collision = templates.cube,
    nonPortalable = true
}
tiles[22] = {
	name = "Concrete wall small",
    collision = templates.cube,
}
tiles[24] = {
	name = "Doorframe left",
    collision = templates.cube,
	nonPortalable = true
}
tiles[25] = {
	name = "Doorframe right",
    collision = templates.cube,
}
tiles[26] = {
	name = "Vactube left",
    collision = templates.cube,
	nonPortalable = true
}
tiles[27] = {
	name = "Vactube right",
    collision = templates.cube,
	nonPortalable = true
}
tiles[35] = {
	name = "Elevator",
    collision = templates.cube,
	nonPortalable = true
}
tiles[36] = {
	name = "Spikes top",
    collision = templates.cube,
	nonPortalable = true
}
tiles[37] = {
	name = "Spikes bottom",
    collision = templates.cube,
	nonPortalable = true
}
tiles[38] = {
	name = "Spikes right",
    collision = templates.cube,
	nonPortalable = true
}
tiles[39] = {
	name = "Spikes left",
    collision = templates.cube,
	nonPortalable = true
}
tiles[40] = {
	name = "Grating",
    collision = templates.cube,
	grating = true
}
tiles[41] = {
	name = "Water",
    collision = templates.cube,
	water = true
}
tiles[42] = {
	name = "Elevator",
    collision = templates.cube,
	nonPortalable = true
}
tiles[57] = {
	name = "Elevator",
    collision = templates.cube,
	nonPortalable = true
}
tiles[58] = {
	name = "Bridge center",
    collision = templates.cube,
    exclusiveCollision = 1,
	grating = true
}
tiles[59] = {
	name = "Bridge right",
    collision = templates.cube,
    exclusiveCollision = 1,
	grating = true
}
tiles[60] = {
	name = "Bridge left",
    collision = templates.cube,
    exclusiveCollision = 1,
	grating = true
}
tiles[62] = {
	name = "Ladder",
	ladder = true
}
tiles[63] = {
	name = "Reflective block",
    collision = templates.cube,
	reflective = true
}
tiles[64] = {
	name = "Elevator",
    collision = templates.cube,
	nonPortalable = true
}
tiles[78] = {
	name = "Vactube in block left",
    collision = templates.cube,
	nonPortalable = true
}
tiles[79] = {
	name = "Vactube in block right",
    collision = templates.cube,
	nonPortalable = true
}
tiles[86] = {
	name = "Vactube in block left",
    collision = templates.cube,
	nonPortalable = true
}
tiles[87] = {
	name = "Vactube in block right",
    collision = templates.cube,
	nonPortalable = true
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
