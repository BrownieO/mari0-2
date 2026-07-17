local base = extend("enemies/koopa.lua")

base.icon = "img/icons/koopa_red.png"

base.components["misc.palettable"].defaultPalette = {
	{255, 204, 197},
	{234, 158,  34},
	{  0,   0,   0},
	{181,  49,  32}
}

base.components["movement.truffleShuffle"].turnAroundOnCliff = true

base.components["misc.transforms"].into = "koopa_red_shell"

return base