return {
    width = 16,
    height = 16,

    img = "img/actors/chest_small.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,
	
    collisionGroup = 16,
    collisionMask = 4,
	
    components = {
        ["animation.frames"] = {
            frames = {1}
        },
        ["misc.unrotate"] = {},
		["debug.winOnContact"] = {},
    }
}