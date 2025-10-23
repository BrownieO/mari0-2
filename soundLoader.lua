sounds = {}

local toLoad = recursiveEnumerate("sound")

for _, path in ipairs(toLoad) do
	name = path:sub(7) -- remove folder name ("sound/"). lol hardcode
	name = name:gsub("%.[^/\\%.]+$", "") -- remove extension
	sounds[name] = love.audio.newSource(path, "static")
end