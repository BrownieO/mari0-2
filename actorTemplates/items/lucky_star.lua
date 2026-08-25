local base = extend("items/fire_flower.lua")
base.img = "img/actors/lucky_star.png"
base.components["actReact.tag.powerUp"] = {}
base.components["misc.broadcastEvent"] = {
			on = "destroy",
			fire = {"getHurt", "getKilled"},
			collisionBlacklist = VAR("collisionCategories").PLAYER
}

return base