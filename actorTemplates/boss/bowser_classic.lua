return {
    width = 16,
    height = 32,

    img = "img/actors/bowser_classic.png",
    icon = "img/icons/bowser_classic.png",
    quadWidth = 32,
    quadHeight = 48,
    centerX = 16,
    centerY = 32,

    gravity = VAR("gravityJumping"),

    collisionGroup = VAR("collisionCategories").ENEMY,
    collisionMask = VAR("collisionMasks").ENEMY,

    components = {
        --Apperance
        ["animation.frames"] = {
            frames = { 1, 2 },
        },
        ["misc.unrotate"] = {},

        --Behavior
        ["movement.truffleShuffle"] = {
            dontTurnAnimation = true,
            maxSpeed = 14,
            turnAroundOnCliff = true,
        },
        ["movement.jump"] = { jumpForce = getRequiredSpeed(2 * 16, VAR("gravityJumping")) },
        ["actReact.react.spawnsEnemy"] = {
            spawnenemydelay = 3,
            spawnenemyspeedx = 4.69 * 16,
            spawnenemyoffsety = 8,
        },

        --Interactions
        ["actReact.act.hurtsByContact"] = {
            left = true,
            right = true,
            bottom = true,
            top = true,
        },
        ["actReact.react.sinksOnLava"] = {},
        ["actReact.react.isHurtByStar"] = {},
        ["misc.enemyHealth"] = { health = 5 },
        ["actReact.react.isHurtOnEvents"] = {
            on = {
                "getProjectileDamage",
                "getFireballDamage",
            },
        },
        ["actReact.react.collapsesOnEvents"] = {
            on = {
                "getKilledEnemy",
                "getStarDamage",
            },
        },
    },
}
