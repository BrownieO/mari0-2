local Component = require "class.Component"
local powerUp = class("misc.powerUp", Component)

powerUp.argList = {
    {"powerUpType", "string", "fire"},
	{"whitelist", "table", {}},
	{"blacklist", "table", {"mega"}}
}

return powerUp
