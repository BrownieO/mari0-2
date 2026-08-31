local base = extend("items/fire_flower.lua")
base.img = "img/actors/metal_cap.png"
base.components["actReact.tag.powerUp"] = { powerUpEvent = "getMetalCap" }

return base
