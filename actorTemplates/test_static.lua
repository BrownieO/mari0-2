return {
    width = 16,
    height = 16,

    img = "img/actors/p_balloon.png",
    quadWidth = 16,
    quadHeight = 16,
    centerX = 8,
    centerY = 8,
	static = true,

    collisionGroup = VAR("collisionCategories").ALWAYS_COLLIDE,
    collisionMask = VAR("collisionMasks").ALWAYS_COLLIDE,

    components = {
    }
}