--most simple entity ever
return {
    width = 16,
    height = 16,

    img = "img/actors/coin.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,

	static = true,

    collisionGroup = 0,
    collisionMask = 0,
	
	coin = true,

    components = {
        ["animation.frames"] = {
            frames = {1, 2, 3, 4}
        },
    }
}