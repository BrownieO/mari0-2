local tiles = {}

local templates = VAR("tileTemplates")

--Overworld
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


-- Underground
tiles[9] = {
	name = "Empty block",
    collision = templates.cube
}

tiles[10] = {
	name = "Hard block",
    collision = templates.cube
}

tiles[11] = {
	name = "Brick block",
    collision = templates.cube,
    img = "brick_underground.png",
    delays = {8/60},
    holdsItems = true,
	breakable = true,
    turnsInto = 9
}

tiles[12] = {
	name = "Question block",
    collision = templates.cube,
    img = "q_block_underground.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 9
}

tiles[13] = {
	name = "Coin",
    img = "coin_underground.png",
    delays = {8/60},
    coin = true
}

tiles[14] = {
	name = "Hidden block",
	collision = templates.cube,
	exclusiveCollision = 3,
	invisible = true,
	holdsItems = true,
	defaultItem = "coin",
	turnsInto = 9
}

tiles[15] = {
	name = "P coin",
    img = "p_coin_underground.png",
    delays = {8/60},
    coin = true
}

tiles[16] = {
	name = "Bouncy hard block",
    collision = templates.cube,
	noteblock = true
}


-- Snow
tiles[17] = {
	name = "Empty block",
    collision = templates.cube
}

tiles[18] = {
	name = "Hard block",
    collision = templates.cube
}

tiles[19] = {
	name = "Brick block",
    collision = templates.cube,
    img = "brick_snow.png",
    delays = {8/60},
    holdsItems = true,
	breakable = true,
    turnsInto = 17
}

tiles[20] = {
	name = "Question block",
    collision = templates.cube,
    img = "q_block_snow.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 17
}

tiles[21] = {
	name = "Coin",
    img = "coin_snow.png",
    delays = {8/60},
    coin = true
}

tiles[22] = {
	name = "Hidden block",
	collision = templates.cube,
	exclusiveCollision = 3,
	invisible = true,
	holdsItems = true,
	defaultItem = "coin",
	turnsInto = 17
}

tiles[23] = {
	name = "P coin",
    img = "p_coin.png",
    delays = {8/60},
    coin = true
}

tiles[24] = {
	name = "Bouncy hard block",
    collision = templates.cube,
	noteblock = true
}


-- Ghost house
tiles[25] = {
	name = "Empty block",
    collision = templates.cube
}

tiles[26] = {
	name = "Hard block",
    collision = templates.cube
}

tiles[27] = {
	name = "Brick block",
    collision = templates.cube,
    img = "brick_ghosts.png",
    delays = {8/60},
    holdsItems = true,
	breakable = true,
    turnsInto = 17
}

tiles[28] = {
	name = "Question block",
    collision = templates.cube,
    img = "q_block_ghosts.png",
    delays = {8/60},
    holdsItems = true,
    defaultItem = "coin",
    turnsInto = 17
}

tiles[29] = {
	name = "Coin",
    img = "coin_ghosts.png",
    delays = {8/60},
    coin = true
}

tiles[30] = {
	name = "Hidden block",
	collision = templates.cube,
	exclusiveCollision = 3,
	invisible = true,
	holdsItems = true,
	defaultItem = "coin",
	turnsInto = 17
}

tiles[31] = {
	name = "P coin",
    img = "p_coin_ghosts.png",
    delays = {8/60},
    coin = true
}

tiles[32] = {
	name = "Bouncy hard block",
    collision = templates.cube,
	noteblock = true
}


-- Note blocks (overworld)
tiles[33] = {
	name = "Note block",
    collision = templates.cube,
	noteblock = true,
	img = "note_block.png",
	delays = {8/60},
}

tiles[34] = {
	name = "Red note block",
    collision = templates.cube,
	noteblock = true,
	img = "red_note_block.png",
	delays = {8/60},
	noteblockForceY = 8*16
}

tiles[35] = {
	name = "Music block",
    collision = templates.cube,
	noteblock = true,
	img = "music_block.png",
	delays = {8/60},
}

tiles[36] = {
	name = "Yellow note block",
    collision = templates.cube,
	noteblock = true,
	img = "yellow_note_block.png",
	delays = {8/60},
	noteblockForceY = VAR("enemyBounceHeight")*2
}

-- Note blocks (underground)
tiles[37] = {
	name = "Note block",
    collision = templates.cube,
	noteblock = true,
	img = "note_block_underground.png",
	delays = {8/60},
}

tiles[38] = {
	name = "Red note block",
    collision = templates.cube,
	noteblock = true,
	img = "red_note_block_underground.png",
	delays = {8/60},
	noteblockForceY = 8*16
}

tiles[39] = {
	name = "Music block",
    collision = templates.cube,
	noteblock = true,
	img = "music_block_underground.png",
	delays = {8/60},
}

tiles[40] = {
	name = "Yellow note block",
    collision = templates.cube,
	noteblock = true,
	img = "yellow_note_block_underground.png",
	delays = {8/60},
	noteblockForceY = VAR("enemyBounceHeight")*2
}

-- Note blocks (ghost house)
tiles[41] = {
	name = "Note block",
    collision = templates.cube,
	noteblock = true,
	img = "note_block_ghosts.png",
	delays = {8/60},
}

tiles[42] = {
	name = "Red note block",
    collision = templates.cube,
	noteblock = true,
	img = "red_note_block_ghosts.png",
	delays = {8/60},
	noteblockForceY = 8*16
}

tiles[43] = {
	name = "Music block",
    collision = templates.cube,
	noteblock = true,
	img = "music_block_ghosts.png",
	delays = {8/60},
}

tiles[44] = {
	name = "Yellow note block",
    collision = templates.cube,
	noteblock = true,
	img = "yellow_note_block_underground.png",
	delays = {8/60},
	noteblockForceY = VAR("enemyBounceHeight")*2
}

--Other tiles
tiles[45] = {
	name = "Mario Bros floor",
    collision = templates.cube,
	holdsItems = true
}

tiles[46] = {
	name = "Spike trap",
    collision = templates.cube,
	spikeLeft = true,
	spikeTop = true,
	spikeRight = true,
	spikeBottom = true,	
}

tiles[47] = {
	name = "Spike trap",
    collision = templates.cube,
	spikeLeft = true,
	spikeTop = true,
	spikeRight = true,
	spikeBottom = true,	
}

tiles[48] = {
	name = "Spike trap",
    collision = templates.cube,
	spikeLeft = true,
	spikeTop = true,
	spikeRight = true,
	spikeBottom = true,	
}

tiles[49] = {
	name = "Ice block",
    collision = templates.cube,
	ice = true,
}

tiles[50] = {
	name = "Ice block",
    collision = templates.cube,
	ice = true,
}

tiles[51] = {
	name = "Meltable ice block",
    collision = templates.cube,
	ice = true,
	meltable = true,
}

tiles[52] = {
	name = "Meltable ice block",
    collision = templates.cube,
	ice = true,
	meltable = true,
}

tiles[53] = {
	name = "Cloud",
    collision = templates.cube,
    exclusiveCollision = 1,
}

tiles[54] = {
	name = "Cloud",
    collision = templates.cube,
    exclusiveCollision = 1,
}

tiles[55] = {
	name = "Cloud",
    collision = templates.cube,
    exclusiveCollision = 1,
}

tiles[56] = {
	name = "Cloud",
    collision = templates.cube,
    exclusiveCollision = 1,
}


local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
