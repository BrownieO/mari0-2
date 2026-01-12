return {
    width = 16,
    height = 32,

    img = "img/actors/bowser_classic.png",
    quadWidth = 32,
    quadHeight = 48,
    centerX = 16,
    centerY = 32,
	
	gravity = VAR("gravityJumping"),

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        ["animation.frames"] = {
            frames = {1, 2}
        },

        ["movement.truffleShuffle"] = {
			dontTurnAnimation = true,
			maxSpeed = 14,
			turnAroundOnCliff = true
		},
		["movement.jump"] = {jumpforce = getRequiredSpeed(2*16, VAR("gravityJumping"))},
        ["misc.unrotate"] = {},
		["misc.hurtsByContact"] = {
			left = true,
			right = true,
			bottom = true,
			top = true,
			group = VAR("collisionCategories").PLAYER
		},
		["misc.isHurtByStar"] = {},
		["misc.isHurtByContact"] = {},
		["misc.enemyHealth"] = {health = 5},
		["misc.spawnsEnemy"] = {
		spawnenemyspeedx = 4.69*16,
		spawnenemyoffsety = 8,
		},
    }
}