local base = extend("enemies/shelled/koopa_shell.lua")

base.icon = "img/icons/koopa_red_shell.png"

base.components["misc.palettable"].defaultPalette = {
	{255, 204, 197},
	{234, 158,  34},
	{  0,   0,   0},
	{181,  49,  32}
}

base.components["actReact.react.transforms"].into = "koopa_red"

return base