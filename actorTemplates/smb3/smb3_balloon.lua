return {
    width = 16,
    height = 16,

    img = "characters/smb3_mario/balloon.png",
    quadWidth = 32,
    quadHeight = 32,
    centerX = 16,
    centerY = 16,

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
		["smb3.eightWay"] = {},
		
		
		
        ["misc.unrotate"] = {},	
        ["misc.crosshair"] = {},
        ["misc.portalGun"] = {},
        ["misc.stomps"] = {},
        ["misc.kicks"] = {},
        ["misc.isHurtByContact"] = {},
        ["misc.collectsCoins"] = {},
        ["misc.bumpsBlocks"] = {},
        ["misc.bounceOnBlocks"] = {},
		["misc.collectsPowerUps"] = {},
		["misc.shrinksWhenHurt"] = {},
		["misc.losesLife"] = {on = "getKilled"},
		["smb3.star"] = {},
		["sm64.metal"] = {},
		["smb3.iFrames"] = {},
		["misc.isKilledByLava"] = {},
		["misc.isWarped"] = {},
    }
}