return {
    width = 12,
    height = 12,

    img = "characters/smb3_mario/small.png",
    quadWidth = 24,
    quadHeight = 24,
    centerX = 11.5,
    centerY = 14,

    dontAutoQuad = true,
	dontShowOnEditor = true,

    collisionGroup = VAR("collisionCategories").PLAYER,
    collisionMask = VAR("collisionMasks").PLAYER,

    components = {
        ["misc.palettable"] = {
            imgPalette = {
                {255, 204, 197},
                {181,  49,  32},
                {  0,   0,   0}
            },
        },

        ["smb3.animation"] = {
            frames = {
                {
                    type = "8-dir",
                    plusNoGun = true,
                    x = 1,
                    y = 1,
                    names = {
                        "idle",

                        "run",
                        "run",

                        "skid",

                        "jump",

                        "fall",

                        "swim",
                        "swim",

                        "swimUp",
                        "swimUp",
                        "swimUp",
                    },
                },

                {
                    type = "1-dir",
                    plusNoGun = true,
                    x = 1,
                    y = 10,
                    names = {
                        "sprint",
                        "sprint",

                        "fly",

                        "die",

                        "buttSlide",

                        "spin",
                        "spin",
                        "spin",
                        "spin",


                        "holdIdle",

                        "holdRun",
                        "holdRun",

                        "kick",

                        "climb",
                        "climb",
                    }
                }
            }
        },
        ["smb3.movement"] = {},
        ["smb3.jumping"] = {},
        ["smb3.swimming"] = {},
		
        ["misc.unrotate"] = {},
        ["misc.crosshair"] = {},
        ["misc.portalGun"] = {},
        ["misc.stomps"] = {},
        ["misc.kicks"] = {},
        ["misc.isHurtByContact"] = {},
        ["misc.collectsCoins"] = {},
        ["misc.bumpsBlocks"] = {dontBreak = true},
        ["misc.bounceOnBlocks"] = {},
		["misc.collectsPowerUps"] = {},

		["misc.losesLife"] = {on = "getHurt"},
		["smb3.star"] = {},
		["sm64.metal"] = {},
		["smb3.iFrames"] = {},
		["misc.isKilledByLava"] = {},
		["misc.isWarped"] = {},
    }
}