local base = extend("items/fire_flower.lua")
base.img = "img/actors/hammer_suit.png"
base.components["actReact.tag.powerUp"] = { powerUpType = "hammer" }

return base
