return {
    width = 13,
    height = 18,

    img = "img/actors/piranha_plant.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 24,

    collisionGroup = 0,
    collisionMask = 0,
	static = true,

    components = {
        ["misc.palettable"] = {
            ["imgPalette"] = {
                {181,  49,  32},
                { 92, 228,  48},
                {255, 255, 255},
                {  0,   0,   0}
            }
        },

        ["animation.frames"] = {
            frames = {1, 2}
        },
        ["misc.unrotate"] = {},
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