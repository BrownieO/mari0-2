local base = extend("items/fire_flower.lua")
base.img = "img/actors/lucky_star.png"
base.components["actReact.tag.powerUp"] = {}
base.components["actReact.react.broadcastEvent"] = {
    on = "destroy",
    fire = { "getKilledEnemy" },
}

return base
