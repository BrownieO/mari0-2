return {
    width = 12,
    height = 12,

    img = "img/actors/roto_disc.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,
	static = true,
	resistsStar: true,

    collisionGroup = 1,

    components = {
        ["animation.frames"] = {
            frames = {1, 2, 3, 4, 5, 6, 7, 8, 9 10, 11, 12, 13, 14, 15, 16}
        },
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = true
		},
	}
}