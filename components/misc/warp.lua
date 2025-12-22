local Component = require "class.Component"
local warp = class("misc.warp", Component)

warp.argList = {
    {"level", "required|string"},
	{"key", "string"},
	{"exitId", "number"}
}

return warp
