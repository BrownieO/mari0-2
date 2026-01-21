return {
    width = 11,
    height = 11,

    img = "img/actors/bowser_fire.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,
	resistsStar = true,
	static = true,

    collisionGroup = 0,
    collisionMask = 0,
	
	spawnSound = "fire",

    components = {
        ["animation.frames"] = {
            frames = {1, 2},
			times = {1/15}
        },
		["movement.targetPlayerY"] = {},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = false,
			group = VAR("collisionCategories").PLAYER,
		},
	}
}