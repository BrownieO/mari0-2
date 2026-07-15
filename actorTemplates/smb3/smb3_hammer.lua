local base = extend("smb3/smb3_big.lua")

base.img = "characters/smb3_mario/hammer.png"

base.components["misc.palettable"].imgPalette = {
	{255, 204, 197},
	{181,  49,  32},
	{  0,   0,   0}
}

base.components["smb3.ducking"] = {forbidButtSliding = true}

return base