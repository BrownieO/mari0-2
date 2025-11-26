return {
    width = 16,
    height = 16,

    img = "img/actors/p_balloon.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,

    collisionGroup = 16,
    noncollide = 4,

    components = {
        ["misc.unrotate"] = {},
		["misc.powerUp"] = {
			powerUpType = "balloon",
		},
    }
}