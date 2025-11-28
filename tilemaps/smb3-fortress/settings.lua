local tiles = {}

local templates = VAR("tileTemplates")

local cubes = {1,2,4,5,7,8,10,11,14,15,17,20,23,26,29,30,32,35,38,41,46,47,49,50,52,53,55,56,58,59,60}

for _, v in ipairs(cubes) do
    tiles[v] = {collision = templates.cube}
end

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
}

return props
