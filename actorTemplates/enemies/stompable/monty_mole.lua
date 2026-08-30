return {
    width = 12,
    height = 12,

    img = "img/actors/monty_mole.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 9,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
		--Appearance
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
		["actReact.react.isHurtByStar"] = {},
		["actReact.react.collapsesOnEvents"] = {
			on = {
				"getHurtEnemy",
				"getKilledEnemy",
				"getStomped",
				"getFireballDamage",
				"getStarDamage"
				}
			},
		["actReact.react.sinksOnLava"] = {}
	}
}