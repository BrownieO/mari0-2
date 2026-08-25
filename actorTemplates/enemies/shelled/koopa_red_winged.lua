return {
    width = 12,
    height = 12,

    img = "img/actors/koopa_winged.png",
    icon = "img/icons/koopa_red_winged.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 22,
	static = true,

    collisionGroup = VAR("collisionCategories").ENEMY,
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
        ["actReact.tag.stompable"] = {},
		["actReact.act.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = false,
			group = VAR("collisionCategories").PLAYER
		},
        ["actReact.react.transforms"] = {
            on = "getStomped",
            into = "koopa_red"
        },
		["actReact.react.isHurtByStar"] = {},
		["actReact.react.knockedWhenHurt"] = {},
		["actReact.react.isHurtByContact"] = {},
    }
}