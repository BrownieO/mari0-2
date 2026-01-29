return {
    width = 8,
    height = 8,

    img = "img/actors/fireball.png",
    quadWidth = 8,
    quadHeight = 8,
    centerX = 4,
    centerY = 4,
	resistsStar = true,
	dontShowOnEditor = true,

    collisionGroup = VAR("collisionCategories").PLAYER,
    collisionMask = VAR("collisionMasks").PLAYER,

    components = {
        ["animation.frames"] = {
            frames = {1, 2, 3, 4},
			times = {1/30}
        },
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = true,
			group = VAR("collisionCategories").ENEMY,
			kamikaze = true
		},
		["movement.fireball"] = {}
	}
}