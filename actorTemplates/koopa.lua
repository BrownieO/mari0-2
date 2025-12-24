return {
    width = 12,
    height = 12,

    img = "img/actors/koopa.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 25,

    collisionGroup = VAR("collisionCategories").ENEMY,
    noncollide = VAR("nonCollideTemplates").ENEMY,

    components = {
        ["misc.palettable"] = {
            imgPalette = {
                {252, 188, 176},
                {252, 152,  56},
                {  0,   0,   0},
                { 76, 220,  72}
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