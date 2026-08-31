local Component = require("class.Component")
local powerUp = class("actReact.tag.powerUp", Component)

powerUp.argList = {
    { "powerUpType", "string" },
    { "whitelist", "table", {} },
    { "blacklist", "table", { "mega" } },
    { "powerUpEvent", "string" },
}

return powerUp
