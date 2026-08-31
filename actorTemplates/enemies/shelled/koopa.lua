return {
    width = 12,
    height = 12,

    img = "img/actors/koopa.png",
	icon = "img/icons/koopa.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 25,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
		--Appearance
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
        ["misc.unrotate"] = {},
		
		--Behavior
        ["movement.truffleShuffle"] = {},

		--Interactions
		["actReact.act.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = false,
		},
		["actReact.tag.stompable"] = {},
		["actReact.react.sinksOnLava"] = {},
		["actReact.react.isHurtByStar"] = {},
        ["actReact.react.transforms"] = {
            on = "getStomped",
            into = "koopa_shell"
        },
		["actReact.react.collapsesOnEvents"] = {
			on = {
				"getHurtEnemy",
				"getKilledEnemy",
				"getFireballDamage",
				"getStarDamage",
				"getProjectileDamage"
				}
			}
    }
}