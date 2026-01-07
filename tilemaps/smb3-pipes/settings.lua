local tiles = {}

local templates = VAR("tileTemplates")

for i = 1, 3*11*24 do
    tiles[i] = {collision = templates.cube}
end

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
