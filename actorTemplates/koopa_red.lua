return {
    width = 12,
    height = 12,

    img = "img/actors/koopa.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 25,

    components = {
        ["misc.palettable"] = {
            imgPalette = {
                {252, 188, 176},
                {252, 152,  56},
                {  0,   0,   0},
                { 76, 220,  72},
            },
            defaultPalette = {
                {252, 188, 176},
                {252, 152,  56},
                {  0,   0,   0},
                {216,   40,  0},
            },
        },

        ["animation.frames"] = {
			frames = {1, 2}
        },

        ["movement.truffleShuffle"] = {
            turnAroundOnCliff = true
        },
        ["misc.unrotate"] = {},
        ["misc.stompable"] = {},
        ["misc.transforms"] = {
            on = "getStomped",
            into = "koopa_red_shell"
        }
    }
}