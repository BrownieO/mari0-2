return {
	startMsg = "localización al español funcionando",
	
	mainMenu = {
		onePlayerGame = "Juego de 1 jugador",
		selectMappack = "Seleccionar juego",
		levelEditor = "Editor de niveles",
		options = "Opciones"
	},
	
	options = {
		options = "OPCIONES",
		language = "🌐 Idioma"
	},
	
	editor = {
		open = "Abrir",
		save = "Guardar",
		saveAs = "Guardar como",
		play = "Jugar",
		_exit = "Salir",
		
		file = "Archivo",
		window = "Ventana",
		view = "Vista",
	
		_debug = "Depuración",
		layers = "Capas",
		mapOptions = "Opciones del nivel",
		minimap = "Minimapa",
		stamps = "Estampas",
		tiles = "Tiles",
		
		freeCamera = "Cámara libre",
		drawGrid = "Cuadrícula",
		hideUi = "Ocultar interfaz",
		
		levelName = "Nombre:",
		back = "< Volver",
	},
	
	state = "estado",
	powerUp = "power-up",
	forms = {
		small = "pequeño",
		
		big = "grande",
		fire = "fuego",
		raccoon = "mapache",
		frog = "rana",
		tanooki = "tanuki",
		hammer = "martillo",
		balloon = "globo",

		invincible = "invencible",
		metal = "metal",
	},
	
	window = {
		openFile = "Abrir archivo",
		saveFile = "Guardar archivo",
		playtest = "Prueba de juego",
		editor = "Editor",
		saveFirst = "Se deben guardar los cambios antes de continuar.",
		saveChanges = "¿Guardar cambios antes de salir?",
		
		ok = "Aceptar",
		cancel = "Cancelar",
		yes = "Sí",
		no = "No"		
	},
	
	assertions = {
		tilemapNonexistent = "El tileset \"%s\" no existe.",
		paddingBigger = "El estampado \"%s\" del tileset \"%s\" tiene un margen [%s] más grande que su propio tamaño. Mala idea.",
		tileLoadError = "No se pudo cargar el tile en x=%s, y=%s con ID \"%s\". El nivel puede estar corrupto.",
		tilemapNotPassed = "El archivo del nivel no especifica ningún tileset con número %s",
		elementToItself = "No se puede emparentar un elemento consigo mismo.",
		noCrosshair = "Un actor intentó abrir un portal sin tener una retícula.",
		faultyQuad = [[El estado "%s" en actorTemplate %s tiene un cuadro malo. (fotograma "%s")]]
	}
}