local base = extend("items/fire_flower.lua")
base.img = "img/actors/mushroom.png"
base.components["actReact.tag.powerUp"] = {
    powerUpType = "big",
    whitelist = { "small" },
}
base.components["movement.truffleShuffle"] = {
    dontTurnAnimation = true,
    maxSpeed = 57.6,
    startSpeed = -57.6,
}
return base
