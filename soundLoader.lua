sounds = {}
local echoSmw = {
	type = "echo",
	volume = 0.1,
	delay = 0,
	tapdelay = 0.0675,
	damping = 0.25,
	feedback = 0.85,
	spread = 0
}
local echoBasic = {
	type = "echo",
	volume = 0.5,
	delay = 0,
	tapdelay = 0.1,
	damping = 0,
	feedback = 0.5,
	spread = 0
}

success = love.audio.setEffect("echo", echoBasic)

local toLoad = recursiveEnumerate("sound")

for _, path in ipairs(toLoad) do
	name = path:sub(7) -- remove folder name ("sound/"). lol hardcode
	name = name:gsub("%.[^/\\%.]+$", "") -- remove extension
	sounds[name] = love.audio.newSource(path, "static")
	--sounds[name]:setEffect("echo")
end

local toLoad = recursiveEnumerate("music")

for _, path in ipairs(toLoad) do
	name = path:sub(7) -- remove folder name ("music/"). lol hardcode
	name = name:gsub("%.[^/\\%.]+$", "") -- remove extension
	sounds[name] = love.audio.newSource(path, "stream")
	sounds[name]:setLooping(true)
end