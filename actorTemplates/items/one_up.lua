return {
    width = 16,
    height = 16,

    img = "img/actors/one_up.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,

    collisionGroup = VAR("collisionCategories").POWER_UP,
    collisionMask = VAR("collisionMasks").POWER_UP,

    components = {
        ["misc.unrotate"] = {},
		["misc.lifeOnMarioContact"] = {},
		["misc.removeOnMarioContact"] = {},
        ["movement.truffleShuffle"] = {
            dontTurnAnimation = true,
            maxSpeed = 32,
			startSpeed = -32,
        },
    }
}