local templates = VAR("tileTemplates")

local tiles = {
	{},
    {
        name = "ground",
        collision = templates.cube
    },
    
    {
        name = "hilltop",
    },
    
    {
        name = "bushleft",
    },
    
    {
        name = "bushcenter",
    },
    
    {
        name = "bushright",
    },
    
    {
        name = "brickBlock",
        collision = templates.cube,
        breakable = true,
		turnsInto = 113
    },
    
    {
        name = "coinBlock",
		collision = templates.cube,
		img = "coinblock.png",
		delays = {8/60},
		holdsItems = true,
		defaultItem = "coin", -- ?
		turnsInto = 113
    },
    
    {
        name = "unused",
        invisible = true
    },
    
    {
        name = "chain",
        bowserbridge = true
    },
    
    {
        name = "bowserbridge",
        collision = templates.cube,
        bowserbridge = true
    },
    
    {
        name = "fence"
    },
    
    {
        name = "fencewhite"
    },
    
    {
        name = "whitepipetopleft",
        collision = templates.cube
    },
    
    {
        name = "whitepipetopright",
        collision = templates.cube
    },
    
    {
        name = "greenpipetopleft",
        collision = templates.cube
    },
    
    {
        name = "greenpipetopright",
        collision = templates.cube
    },
    
    {
        name = "redpipetopleft",
        collision = templates.cube
    },
    
    {
        name = "redpipetopright",
        collision = templates.cube
    },
    
    {
        name = "mushroomleft",
        collision = templates.cube
    },
    
    {
        name = "mushroomcenter",
        collision = templates.cube
    },
    
    {
        name = "mushroomright",
        collision = templates.cube
    },
    
    
    
    
    
    
    
    
    
    
    
    {
        name = "castlemiddle",
    },
    
    {
        name = "hillleft",
    },
    
    {
        name = "hillcenter",
    },
    
    {
        name = "hillright",
    },
    
    {
        name = "hillcenteralt1",
    },
    
    {
        name = "hillcenteralt2",
    },
    
    {
        name = "castleground",
        collision = templates.cube
    },
    
    {
        name = "redcloudtopleft",
    },
    
    {
        name = "redcloudtop",
    },
    
    {
        name = "redcloudtopright",
    },
    
    {
        name = "bluecloudtopleft",
    },
    
    {
        name = "bluecloudtop",
    },
    
    {
        name = "bluecloudtopright",
    },
    
    {
        name = "whitepipebottomleft",
        collision = templates.cube
    },
    
    {
        name = "whitepipebottomright",
        collision = templates.cube
    },
    
    {
        name = "greenpipebottomleft",
        collision = templates.cube
    },
    
    {
        name = "greenpipebottomright",
        collision = templates.cube
    },
    
    {
        name = "redpipebottomleft",
        collision = templates.cube
    },
    
    {
        name = "redpipebottomright",
        collision = templates.cube
    },
    
    {
        name = "cannontop",
        collision = templates.cube
    },
    
    {
        name = "mushroomcenter"
    },
    
    {
        name = "treetop"
    },








    {
        name = "castletopalt",
    },
    
    {
        name = "castledoortop",
    },
    
    {
        name = "castlemiddle",
    },
    
    {
        name = "redflagtop"
    },
    
    {
        name = "brickblockunderground",
        collision = templates.cube,
        breakable = true,
		turnsInto = 113
    },
    
    {
        name = "groundunderground",
        collision = templates.cube
    },
    
    {
        name = "whitecastletopalt",
    },
    
    {
        name = "redcloudbottomleft",
    },
    
    {
        name = "redcloudbottom",
    },
    
    {
        name = "redcloudbottomright",
    },
    
    {
        name = "bluecloudbottomleft",
    },
    
    {
        name = "bluecloudbottom",
    },
    
    {
        name = "bluecloudbottomright",
    },
    
    {
        name = "greenpipelefttopleft",
        collision = templates.cube
    },
    
    {
        name = "greenpipelefttopright",
        collision = templates.cube
    },
    
    {
        name = "greenpipemiddletop",
        collision = templates.cube
    },
    
    {
        name = "underwaterpipetop",
        collision = templates.cube
    },
    
    {
        name = "whitepipetopleft",
        collision = templates.cube
    },

    {
        name = "whitepipetopright",
        collision = templates.cube
    },

    {
        name = "cannonbottom",
        collision = templates.cube
    },
    
    {
        name = "mushroombottom"
    },
    
    {
        name = "treebottom"
    },












    
    {
        name = "castleleft",
    },

    {
        name = "castledoorbottom",
    },

    {
        name = "castleright",
    },

    {
        name = "treeplatformleft",
        collision = templates.cube
    },
    
    {
        name = "treeplatformmiddle",
        collision = templates.cube
    },
    
    {
        name = "treeplatformright",
        collision = templates.cube
    },

    {
        name = "whitecastletop",
    },

    {
        name = "whitecastledoortop",
    },

    {
        name = "whitecastlemiddle",
    },

    {
        name = "underwaterplant",
        collision = templates.cube
    },

    {
        name = "whitetreetop"
    },

    {
        name = "hardblock",
        collision = templates.cube
    },

    {
        name = "cloudplatform",
        collision = templates.cube
    },

    {
        name = "greenpipeleftbottomleft",
        collision = templates.cube
    },

    {
        name = "greenpipeleftbottomright",
        collision = templates.cube
    },

    {
        name = "greenpipemiddlebottom",
        collision = templates.cube
    },

    {
        name = "underwaterpipebottom",
        collision = templates.cube
    },

    {
        name = "whitepipebottomleft",
        collision = templates.cube
    },

    {
        name = "whitepipebottomright",
        collision = templates.cube
    },

    {
        name = "fence"
    },

    {
        name = "smalltreetop"
    },

    {
        name = "treetrunk"
    },













    
    {
        name = "whitetreeplatformleft",
        collision = templates.cube
    },
    
    {
        name = "whitetreeplatformmiddle",
        collision = templates.cube
    },
    
    {
        name = "whitetreeplatformright",
        collision = templates.cube
    },
    
    {
        name = "whiteground",
        collision = templates.cube
    },
    
    {
        name = "treeplatformtrunk"
    },
    
    {
        name = "whitetreeplatformtrunk"
    },
    
    {
        name = "whitecastleleft"
    },
    
    {
        name = "whitecastlemiddle"
    },
    
    {
        name = "whitecastleright"
    },
    
    {
        name = "underwaterground"
    },
    
    {
        name = "whitetreebottom"
    },
    
    {
        name = "greenflagtop"
    },
    
    {
        name = "whiteflagtop"
    },
    
    {
        name = "anotherflagtop"
    },
    
    {
        name = "greenflagpole"
    },
    
    {
        name = "whiteflagpole"
    },
    
    {
        name = "anotherflagpole"
    },
    
    {
        name = "water"
    },
    
    {
        name = "lava"
    },
    
    {
        name = "differentwater?"
    },
    
    {
        name = "whitesmalltree"
    },
    
    {
        name = "bridge",
        collision = templates.cube
    },
    














    {
        name = "undergroundhardblock",
        collision = templates.cube
    },
    
    {
        name = "unused"
    },
    
    {
        name = "coinblockempty",
        collision = templates.cube
    },
    
    {
        name = "unused"
    },
    
    {
        name = "invisibleCoinBlock",
		collision = templates.cube,
		invisible = true,
		holdsItems = true,
		defaultItem = "coin",
		turnsInto = 113
    },
    
    {
        name = "unused"
    },
    
    {
        name = "unused"
    },
    
    {
        name = "unused"
    },
    
    {
        name = "cannonlong",
        collision = templates.cube
    },
    
    {
        name = "lavamiddle"
    },
    
    {
        name = "skyvisible"
    },
    
    {
        name = "whitebrickblock",
        collision = templates.cube,
		breakable = true,
		turnsInto = 113
    },
    
    {
        name = "morewatermiddle"
    },
    
    {
        name = "redpipebottomleft",
        collision = templates.cube
    },
    
    {
        name = "redpipebottomright",
        collision = templates.cube
    },
    
    {
        name = "redpipetopleft",
        collision = templates.cube
    },
    
    {
        name = "redpipetopright",
        collision = templates.cube
    },
    
    {
        name = "underwaterblock",
        collision = templates.cube
    },
    
    {
        name = "anothergoddamnflagpole"
    },
    
    {
        name = "unused"
    },
    
    {
        name = "unused"
    },
    
    {
        name = "unused"
    }
}

local props = {
    tileSize = 16,
    tileMap = "tiles.png",
    tiles = tiles
}

return props
