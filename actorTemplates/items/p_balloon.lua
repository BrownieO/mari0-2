local base = extend("items/fire_flower.lua")
base.img = "img/actors/p_balloon.png"
base.components["actReact.tag.powerUp"] = { powerUpType = "balloon" }

return base
