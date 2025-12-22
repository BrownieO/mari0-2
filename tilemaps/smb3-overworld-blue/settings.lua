local tiles = {}

local templates = VAR("tileTemplates")

--collisions
local cubes = {91, 94, 97, 100, 103}

for _, v in ipairs(cubes) do
    tiles[v] = {collision = templates.cube}
end

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
