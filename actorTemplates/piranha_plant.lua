return {
    width = 13,
    height = 21,

    img = "img/actors/piranha_plant.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 11.5,
	spawnOffsetX = 1/2,
	spawnOffsetY = -10/16,
	
	static = true,

    collisionGroup = 0,
    collisionMask = 0,

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
		["movement.piston"] = {},
        ["misc.unrotate"] = {},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = true,
			group = VAR("collisionCategories").PLAYER
		},
		["misc.isHurtByStar"] = {},
		["misc.knockedWhenHurt"] = {},
        ["misc.isHurtByContact"] = {},
	}
}