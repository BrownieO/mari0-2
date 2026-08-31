local base = extend("items/fire_flower.lua")
base.img = "img/actors/starman.png"
base.components["actReact.tag.powerUp"] = { powerUpEvent = "getStar" }

return base
