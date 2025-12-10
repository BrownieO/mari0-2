return {
    width = 12,
    height = 12,

    img = "img/actors/koopa_shell.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 9,

    collisionGroup = 64,
    noncollide = 76,

    ["components"] = {
        ["misc.palettable"] = {
            imgPalette = {
                {252, 188, 176},
                {252, 152,  56},
                {  0,   0,   0},
                { 76, 220,  72},
                {252, 252, 252},
            },
            defaultPalette = {
                {252, 188, 176},
                {252, 152,  56},
                {  0,   0,   0},
                {216,   40,  0},
                {252, 252, 252},
            }
        },

        ["animation.frames"] = {
            frames = {1, 2, 3, 4},
            times = {0.03333333},
            dontAnimateWhenStill = true,
            useFrameWhenStill = 1
        },

        ["movement.truffleShuffle"] = {
            maxSpeed = 236.25,
            startSpeed = 0,
            canStop = true
        },
        ["misc.unrotate"] = {},
        ["misc.kickable"] = {},
        ["misc.hurtsByContact"] = {
            left = true,
            right = true,
            onlyWhenMoving = true
        },
        ["misc.wakesUp"] = {
            onlyWhen = "stopped",
            time = 6.9,
            wiggles = true,
            wiggleAfter = 5.233333,
            wiggleDistance = 1,
            wiggleTime = 0.016666667,
            wiggleFrames = {1, 5},
            wiggleFrameTime = {0.03333333}
        },
        ["misc.transforms"] = {
            on = "wakeUp",
            into = "koopa_red"
        },
		["misc.isHurtByStar"] = {},
		["misc.knockedWhenHurt"] = {}
    }
}