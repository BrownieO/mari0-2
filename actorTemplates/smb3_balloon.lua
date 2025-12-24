return {
    width = 16,
    height = 16,

    img = "characters/smb3_mario/balloon.png",
    quadWidth = 32,
    quadHeight = 32,
    centerX = 16,
    centerY = 16,

    dontAutoQuad = true,

    collisionGroup = VAR("collisionCategories").PLAYER,
    noncollide = VAR("nonCollideTemplates").PLAYER,

    components = {
        ["misc.palettable"] = {
            imgPalette = {
                {252, 188, 176},
                {216,  40,   0},
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
		["misc.collectsPowerUps"] = {},
		["misc.shrinksWhenHurt"] = {},
		["misc.losesLife"] = {on = "getKilled"},
		["smb3.star"] = {},
		["smb3.iFrames"] = {},
		["misc.isKilledByLava"] = {},
    }
}