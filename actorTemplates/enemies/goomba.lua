return {
    width = 12,
    height = 12,

    img = "img/actors/goomba.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 9,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        ["misc.palettable"] = {
            ["imgPalette"] = {
                {255, 204, 197},
                {234, 158,  34},
                {  0,   0,   0}
            }
        },

        ["animation.mirror"] = {},
        ["movement.truffleShuffle"] = {
            dontTurnAnimation = true,
            maxSpeed = 32,
        },
        ["misc.unrotate"] = {},
        ["misc.stompable"] = {dies = true},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = false,
			group = VAR("collisionCategories").PLAYER
		},
		["misc.isHurtByStar"] = {},
		["misc.knockedWhenHurt"] = {},
        ["misc.isHurtByContact"] = {},
	}
}