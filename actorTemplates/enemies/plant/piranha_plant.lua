return {
    width = 13,
    height = 24,

    img = "img/actors/piranha_plant.png",
    icon = "img/icons/piranha_plant.png",
    quadWidth = 16,
    quadHeight = 32,
    centerX = 8,
    centerY = 12,
    spawnOffsetX = 1 / 2,
    spawnOffsetY = -8 / 16,

    static = true,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = 0,

    components = {
        --Appearance
        ["misc.palettable"] = {
            ["imgPalette"] = {
                { 181, 49, 32 },
                { 92, 228, 48 },
                { 255, 255, 255 },
                { 0, 0, 0 },
            },
        },
        ["animation.frames"] = {
            frames = { 1, 2 },
        },

        --Behavior
        ["movement.piston"] = {},

        --Interactions
        ["actReact.act.hurtsByContact"] = {
            left = true,
            right = true,
            bottom = true,
            top = true,
        },
        ["actReact.react.sinksOnLava"] = {},
        ["actReact.react.isHurtByStar"] = {},
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
