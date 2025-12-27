return {
    width = 16,
    height = 26,

    img = "img/actors/pipe.png",
    quadWidth = 16,
    quadHeight = 26,
    centerX = 16/2,
    centerY = 26/2,
	static = true,
	
    collisionGroup = 0,
    collisionMask = 0,

    components = {
		["misc.warp"] = {
			key = "down"
		}
	}
}