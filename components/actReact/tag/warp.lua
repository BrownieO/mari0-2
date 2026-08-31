local Component = require("class.Component")
local warp = class("actReact.tag.warp", Component)

warp.argList = {
    { "level", "string" },
    { "key", "string" },
    { "exitId", "number" },
}

return warp
