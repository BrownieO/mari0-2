--- Underground tileset
local tiles = {}

local templates = VAR("tileTemplates")

for i=1,56 do
    tiles[i] = {collision = templates.cube}
end

local stampMaps = {}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles,
    stampMaps = stampMaps
}

return props