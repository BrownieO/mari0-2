return {
    width = 12,
    height = 12,

    img = "img/actors/koopa_winged.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 22,
	static = true,

    collisionGroup = 0,
    collisionMask = 0,

    components = {
        ["misc.palettable"] = {
            imgPalette = {
                {255, 204, 197},
                {234, 158,  34},
                {  0,   0,   0},
                { 92, 228,  48}
            },
            defaultPalette = {
                {255, 204, 197},
                {234, 158,  34},
                {  0,   0,   0},
                {181,  49,  32}
            },
        },

        ["animation.frames"] = {
			frames = {1, 2, 3, 4}
        },
		["movement.flyVertical"] = {},
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
            into = "koopa_red"
        },
		["misc.isHurtByStar"] = {},
		["misc.knockedWhenHurt"] = {},
		["misc.isHurtByContact"] = {},
    }
}