return {
    width = 28,
    height = 26,

    img = "img/actors/pipe.png",
    quadWidth = 28,
    quadHeight = 26,
    centerX = 28/2,
    centerY = 26/2,
	static = true,

    collisionGroup = 1,

    components = {
		["misc.warpOnMarioContact"] = {level = "mappacks/smb3/1-1.lua"}
	}
}