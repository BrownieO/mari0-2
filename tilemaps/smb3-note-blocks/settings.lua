local tiles = {}

local templates = VAR("tileTemplates")

-- Note blocks
tiles[1] = templates.bigSlopeRight
tiles[1].noteblock = true
tiles[1].noteblockForceX = -VAR("enemyBounceHeight")

tiles[2] = templates.bigSlopeLeft
tiles[2].noteblock = true
tiles[2].noteblockForceX = VAR("enemyBounceHeight")

tiles[7] = templates.bigSlopeRightUpsideDown
tiles[7].noteblock = true

tiles[8] = templates.bigSlopeLeftUpsideDown
tiles[8].noteblock = true

tiles[37] = {
    collision = templates.cube,
	noteblock = true,
	noteblockForceY = 0,
	noteblockForceX = -VAR("enemyBounceHeight")*2
}

tiles[38] = {
    collision = templates.cube,
	noteblock = true,
	noteblockForceY = 0,
	noteblockForceX = VAR("enemyBounceHeight")*2
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props