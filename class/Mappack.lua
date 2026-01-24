local Level = require "class.Level"
local LevelEdit = require "class.LevelEdit"
local Mappack = class("Mappack")

function Mappack:initialize(name)
    self.name = name
    self.path = "mappacks/" .. name .. "/"

    self:loadSettings("settings.lua")
end

function Mappack:loadSettings(settingsPath)
    local settingsCode = love.filesystem.read(self.path .. settingsPath)
    self.settings = sandbox.run(settingsCode)
end

function Mappack:startLevel(players)
    return Level:new(self.path .. self.settings.main, players)
end

function Mappack:startLevelEdit(players)
    return LevelEdit:new(self.path .. self.settings.main, players)
end

return Mappack
