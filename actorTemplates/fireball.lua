return {
    width = 8,
    height = 8,

    img = "img/actors/fireball.png",
    quadWidth = 8,
    quadHeight = 8,
    centerX = 4,
    centerY = 4,
	resistsStar = true,

    collisionGroup = VAR("collisionCategories").PLAYER,
    collisionMask = VAR("collisionMasks").PLAYER,

    components = {
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = false,
			group = VAR("collisionCategories").ENEMY,
			kamikaze = true
		},
		["movement.fireball"] = {}
	}
}