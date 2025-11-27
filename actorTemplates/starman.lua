return {
    width = 16,
    height = 16,

    img = "img/actors/starman.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,

    collisionGroup = 16,
    noncollide = 4,

    components = {
        ["misc.unrotate"] = {},
		["misc.powerUp"] = {
			powerUpEvent = "getStar",
		},
    }
}