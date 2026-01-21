return {
    width = 48,
    height = 8,

    img = "img/actors/platform_solid.png",
    quadWidth = 48,
    quadHeight = 16,
    centerX = 24,
    centerY = 4,
	
	static = true,

    collisionGroup = VAR("collisionCategories").ALWAYS_COLLIDE,
    collisionMask = VAR("collisionMasks").ALWAYS_COLLIDE,

    components = {
        ["movement.platform"] = {},
		["misc.unrotate"] = {},
    }
}