local Component = require "class.Component"
local powerUp = class("misc.powerUp", Component)

powerUp.argList = {
    {"powerUpType", "string", "mushroom"},
	{"whitelist", "table", {"small"}},
	{"blacklist", "table", {"mega"}}
}

return powerUp
