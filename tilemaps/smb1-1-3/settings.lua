local tiles = {}

local templates = VAR("tileTemplates")

local cubes = {1,2,3,8,9}

for _, v in ipairs(cubes) do
    tiles[v] = {collision = templates.cube}
end

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
