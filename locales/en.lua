return {
    startMsg = "English localization working",

    mainMenu = {
        onePlayerGame = "1 player game",
        selectMappack = "Select mappack",
        levelEditor = "Level editor",
        options = "Options",
    },

    options = {
        options = "OPTIONS",
        language = "🌐 Language",
        resetMappacks = "Reset included mappacks",
    },

    editor = {
        open = "Open",
        save = "Save",
        saveAs = "Save as",
        play = "Play",
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
        entities = "Entities",

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

    window = {
        openFile = "Open file",
        saveFile = "Save file",
        playtest = "Playtest",
        editor = "Editor",
        saveFirst = "Save the changes first!",
        saveChanges = "Save changes before quitting?",

        ok = "OK",
        cancel = "Cancel",
        yes = "Yes",
        no = "No",
    },

    assertions = {
        -- Level
        tilemapNonexistent = 'The tilemap "%s" requested by the level doesn\'t exist. Someone should add the missing tileset or update the level file on a text editor.',
        tileLoadError = 'Couldn\'t load real tile at x=%s, y=%s for requested lookup "%s". Someone should fix the level file on a text editor.',
        tilemapNotPassed = "A map file references a tileset numbered %s but doesn't mention its name. Someone should fix the level file on a text editor.",

        -- Tileset
        paddingBigger = 'StampMap "%s" from the TileMap "%s" had a padding [%s] bigger than its own size. Someone should fix the tileset file.',

        -- Gui3
        elementToItself = "We made a mistake when programming the user interface. Please copy this error report and send it to us.",

        -- Components
        faultyQuad = [[The state "%s" of actor %s contains a mistake (attempted frame was "%s"). Please copy this error report and send it to us.]],
        noCrosshair = "A character fired a portal without having a crosshair. Please copy this error report and send it to us.",
    },
}
