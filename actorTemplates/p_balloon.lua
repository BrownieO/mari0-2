return {
    width = 16,
    height = 16,

    img = "img/actors/p_balloon.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,

    collisionGroup = VAR("collisionCategories").POWER_UP,
    noncollide = VAR("nonCollideTemplates").POWER_UP,

    components = {
        ["misc.unrotate"] = {},
		["misc.powerUp"] = {
			powerUpType = "balloon",
		},
    }
}