return {
    width = 12,
    height = 24,

    img = "img/actors/hammer_bro.png",
    quadWidth = 16,
    quadHeight = 24,
    centerX = 8,
    centerY = 12,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        ["animation.frames"] = {
            frames = {1, 2}
        },
		["movement.jump"] = {},
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