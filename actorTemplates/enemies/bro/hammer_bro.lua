return {
    width = 12,
    height = 24,

    img = "img/actors/hammer_bro.png",
    icon = "img/icons/hammer_bro.png",
    quadWidth = 16,
    quadHeight = 24,
    centerX = 8,
    centerY = 12,

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        --Appearance
        ["animation.frames"] = {
            frames = { 1, 2 },
        },
        ["misc.unrotate"] = {},

        --Behavior
        ["movement.jump"] = {},

        --Interactions
        ["actReact.tag.stompable"] = {},
        ["actReact.act.hurtsByContact"] = {
            left = true,
            right = true,
            bottom = true,
            top = false,
        },
        ["actReact.react.sinksOnLava"] = {},
        ["actReact.react.isHurtByStar"] = {},
        ["actReact.react.collapsesOnEvents"] = {
            on = {
                "getHurtEnemy",
                "getKilledEnemy",
                "getStomped",
                "getFireballDamage",
                "getStarDamage",
                "getProjectileDamage",
            },
        },
    },
}
