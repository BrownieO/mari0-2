return {
	startMsg = "english localization working",
	
	mainMenu = {
		onePlayerGame = "1 player game",
		selectMappack = "Select game",
		levelEditor = "Level editor",
		options = "Options"
	},
	
	editor = {
		open = "Open",
		save = "Save",
		saveAs = "Save as",
		_exit = "Exit",
		
		file = "File",
		window = "Window",
		view = "View",
	
		_debug = "Debug",
		layers = "Layers",
		mapOptions = "Map options",
		minimap = "Minimap",
		stamps = "Stamps",
		tiles = "Tiles",
		
		freeCamera = "Free camera",
		drawGrid = "Draw grid",
		hideUi = "Hide UI",
		
		levelName = "Level name:",
		back = "< Back",
	},
	
	state = "state",
	powerUp = "power-up",
	forms = {
		small = "small",
		
		big = "big",
		fire = "fire",
		raccoon = "raccoon",
		frog = "frog",
		tanooki = "tanooki",
		hammer = "hammer",
		balloon = "balloon",

		invincible = "invincible",
		metal = "metal",
	},
	
	assertions = {
		tilemapNonexistent = "Map tried to tell me that it uses the tilemap \"%s\" but we all know that's bullshit because that tilemap's settings.lua doesn't exist.",
		paddingBigger = "StampMap \"%s\" from the TileMap \"%s\" had a padding[%s] bigger than its own size. I hope I don't have to explain how nonsensical that is.",
		tileLoadError = "Couldn't load real tile at x=%s, y=%s for requested lookup \"%s\". This may mean that the map is corrupted.",
		tilemapNotPassed = "The map file has no tilemap with the number %s",
		elementToItself = "You can't add an element to itself. That's stupid.",
		noCrosshair = "Actor tried to fire a portal without having a crosshair.",
		faultyQuad = [[The state "%s" on actorTemplate %s has a faulty quad. (attempted frame was "%s)]]
	}
}