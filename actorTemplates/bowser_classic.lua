return {
    width = 16,
    height = 32,

    img = "img/actors/bowser_classic.png",
    quadWidth = 32,
    quadHeight = 48,
    centerX = 16,
    centerY = 32,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        ["animation.frames"] = {
            frames = {1, 2}
        },

        ["movement.truffleShuffle"] = {
			dontTurnAnimation = true,
			maxSpeed = 14,
			turnAroundOnCliff = true
		},
        ["misc.unrotate"] = {},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = true
		},
		["misc.isHurtByStar"] = {},
		["misc.isHurtByContact"] = {},
		["misc.knockedWhenHurt"] = {
		},
    }
}