return {
    width = 16,
    height = 16,

    img = "img/actors/metal_cap.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,

    collisionGroup = VAR("collisionCategories").POWER_UP,
    collisionMask = VAR("collisionMasks").POWER_UP,

    components = {
        ["misc.unrotate"] = {},
		["misc.powerUp"] = {
			powerUpEvent = "getMetalCap",
		},
    }
}