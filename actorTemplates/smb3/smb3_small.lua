local base = extend("smb3/smb3_big.lua")

base.height = 12

base.img = "characters/smb3_mario/small.png"
base.quadWidth = 24
base.quadHeight = 24
base.centerX = 11.5
base.centerY = 14

base.components["smb3.animation"] = {
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
            },
        },
    },
}
base.components["smb3.ducking"] = { forbidDucking = true }
base.components["misc.bumpsBlocks"] = { dontBreak = true }
base.components["misc.losesLife"] = { on = "getHurt" }
base.components["misc.shrinksWhenHurt"] = nil

return base
