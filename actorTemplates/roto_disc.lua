return {
    width = 6,
    height = 1,

    img = "img/actors/roto_disc.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,
	static = true,
	resistsStar = true,
	noTileCollision = true,

    collisionGroup = 1,

    components = {
        ["animation.frames"] = {
            frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
			times = {2/60}
        },
		["movement.circle"] = {},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = true
		},
	}
}