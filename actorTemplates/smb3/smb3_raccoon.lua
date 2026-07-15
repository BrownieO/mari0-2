local base = extend("smb3/smb3_big.lua")

base.img = "characters/smb3_mario/raccoon.png"

base["smb3.animation"] = {
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
                "run",
                "run",

                "skid",

                "jump",

                "fall",

                "float",
                "float",
                "float",

                "duck",

                "swim",
                "swim",
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
                "sprint",
                "sprint",

                "fly",
                "fly",
                "fly",

                "die",

                "buttSlide",

                "spin",
                "spin",
                "spin",
                "spin",

                "spinAir",
                "spinAir",
                "spinAir",
                "spinAir",

                "holdIdle",

                "holdRun",
                "holdRun",
                "holdRun",
                "holdRun",

                "kick",

                "climb",
                "climb",

                "somerSault",
                "somerSault",
                "somerSault",
                "somerSault",
                "somerSault",
                "somerSault",
                "somerSault",
                "somerSault",

                "shoot",
                "shoot",
                "shoot",

                "shootAir",
                "shootAir",
                "shootAir",
            },
        },
    },
}

base.components["smb3.flying"] = {}
base.components["smb3.floating"] = {}
base.components["smb3.spinning"] = {}

return base
