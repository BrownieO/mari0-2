return {
    width = 12,
    height = 12,

    img = "img/actors/koopa_shell.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 9,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    ["components"] = {
        --Appearance
        ["misc.palettable"] = {
            imgPalette = {
                { 255, 204, 197 },
                { 234, 158, 34 },
                { 0, 0, 0 },
                { 92, 228, 48 },
            },
        },
        ["animation.frames"] = {
            frames = { 1, 2, 3, 4 },
            times = { 1 / 30 },
            dontAnimateWhenStill = true,
            useFrameWhenStill = 1,
        },
        ["misc.unrotate"] = {},

        --Behavior
        ["movement.truffleShuffle"] = {
            maxSpeed = 236.25,
            startSpeed = 0,
            canStop = true,
        },

        --Interactions
        ["actReact.act.hurtsByContact"] = {
            left = true,
            right = true,
            onlyWhenMoving = true,
        },
        ["actReact.act.projectileDamage"] = { onlyWhenMoving = true },
        ["actReact.act.wakesUp"] = {
            onlyWhen = "stopped",
            time = 6.9,
            wiggles = true,
            wiggleAfter = 5 + 7 / 30,
            wiggleDistance = 1,
            wiggleTime = 1 / 60,
            wiggleFrames = { 1, 5 },
            wiggleFrameTime = { 1 / 30 },
        },
        ["actReact.tag.kickable"] = {},
        ["actReact.react.sinksOnLava"] = {},
        ["actReact.react.isHurtByStar"] = {},
        ["actReact.react.transforms"] = {
            on = "wakeUp",
            into = "koopa",
        },
        ["actReact.react.changeCollisionGroup"] = {
            on = "kicked",
            group = VAR("collisionCategories").SHELL,
            collisionMask = VAR("collisionMasks").SHELL,
            off = "unkicked",
        },
        ["actReact.react.collapsesOnEvents"] = {
            on = {
                "getHurtEnemy",
                "getKilledEnemy",
                "getFireballDamage",
                "getStarDamage",
                "getProjectileDamage",
            },
        },
    },
}
