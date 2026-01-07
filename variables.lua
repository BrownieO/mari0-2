local t = {
    vsync = 2,
    scale = 1,
    volume = 1,

    canvasExtra = 0,

    gravity = 1125,
    gravityJumping = 225, --gravity while jumping (Only for mario)
    maxYSpeed = math.huge, --258.75

    rotationSpeed = 14, --only a visual effect

    enemyBounceHeight = 28,

    blockBounceTime = 0.2,
    blockBounceHeight = 0.4,
    blockHitForce = 2,

    enemiesSpawnAhead = 2,

    portalSize = 32,
    portalReverseRange = math.pi/4+.001,

    -- Move to smb3mario?
    pMeterTicks = 7,
    pMeterBlinkTime = 8/60,

    -- These are all from the center of the screen and towards the center of the player
    cameraScrollLeftBorder = -85,
    cameraScrollRightBorder = 85,
    cameraScrollUpBorder = -53,
    cameraScrollDownBorder = 25,

    cameraScrollRate = 300,

    minimapType = "realistic", -- realistic, blocky
    blockyMinimapSource = "prominent", -- average, prominent

    tileTemplates = {
        cube = {
            0,  0,
            16,  0,
            16, 16,
            0, 16,
        },

        smallSlopeRight1 = {
            angle = -math.pi/8,
            collision = {
                0,  16,
                16,  8,
                16, 16,
            }
        },

        smallSlopeRight2 = {
            angle = -math.pi/8,
            collision = {
                 0,  8,
                16,  0,
                16, 16,
                 0, 16,
            }
        },

        bigSlopeRight = {
            angle = -math.pi/4,
            collision = {
                 0, 16,
                16,  0,
                16, 16,
            }
        },

        smallSlopeLeft1 = {
            angle = math.pi/8,
            collision = {
                 0,  0,
                16,  8,
                16, 16,
                 0, 16,
            }
        },

        smallSlopeLeft2 = {
            angle = math.pi/8,
            collision = {
                 0,  8,
                16, 16,
                 0, 16,
            }
        },

        bigSlopeLeft = {
            angle = math.pi/4,
            collision = {
                 0,  0,
                16, 16,
                 0, 16,
            }
        },

        bigSlopeLeftUpsideDown = {
            angle = 0,
            collision = {
                 0,  0,
                16, 0,
                 0, 16,
            }
        },

        bigSlopeRightUpsideDown = {
            angle = 0,
            collision = {
                 0,  0,
                16,  0,
                16, 16,
            }
        }
    },

	collisionCategories = {
		ALWAYS_COLLIDE = 1,
		TILE = 2,
		PLAYER = 4,
		ENEMY = 8,
		POWER_UP = 16,
		GIZMO = 32,
		HAZARD = 64,
		SHELL = 128,
	},

    editor = {
        cameraSpeed = 300,
        barSize = 14,
        barAlpha = 0.8,
    }
}

t.collisionMasks = {
	ALWAYS_COLLIDE = 255,
	TILE = 255,
	PLAYER = bit.bor(
		t.collisionCategories.ALWAYS_COLLIDE,
		t.collisionCategories.TILE,
		t.collisionCategories.GIZMO
	),
	ENEMY = bit.bor(
		t.collisionCategories.ALWAYS_COLLIDE,
		t.collisionCategories.TILE,
		t.collisionCategories.ENEMY,
		t.collisionCategories.GIZMO
	),
	POWER_UP = bit.bor(
		t.collisionCategories.ALWAYS_COLLIDE,
		t.collisionCategories.TILE,
		t.collisionCategories.POWER_UP,
		t.collisionCategories.GIZMO
	),
	GIZMO = 127,
	HAZARD = 0,
	SHELL = bit.bor(
		t.collisionCategories.ALWAYS_COLLIDE,
		t.collisionCategories.TILE
	)
}

return t