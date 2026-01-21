return {
    width = 12,
    height = 12,

    img = "img/actors/koopa.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 25,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        ["misc.palettable"] = {
            imgPalette = {
                {255, 204, 197},
                {234, 158,  34},
                {  0,   0,   0},
                { 92, 228,  48}
            }
        },

        ["animation.frames"] = {
            frames = {1, 2}
        },

        ["movement.truffleShuffle"] = {},
        ["misc.unrotate"] = {},
        ["misc.stompable"] = {},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = false,
			group = VAR("collisionCategories").PLAYER
		},
        ["misc.transforms"] = {
            on = "getStomped",
            into = "koopa_shell"
        },
		["misc.isHurtByStar"] = {},
		["misc.knockedWhenHurt"] = {},
		["misc.isHurtByContact"] = {},
    }
}