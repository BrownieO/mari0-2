return {
    width = 12,
    height = 12,

    img = "img/actors/cube.png",
    quadWidth = 12,
    quadHeight = 12,
    centerX = 6,
    centerY = 6,

    collisionGroup = VAR("collisionCategories").ALWAYS_COLLIDE,
    collisionMask = VAR("collisionMasks").ALWAYS_COLLIDE,

    components = {
        ["misc.unrotate"] = {},
		["actReact.act.stomps"] = {},
		["actReact.tag.useable"] = {},
		["actReact.react.grabbable"] = {},
	}
}
