-- ^ctrl !alt +shift (the order is important when stacking)
return {
    ["escape"] = {"quit", "editor.select.clear"},

	-- Face buttons
    ["a"] = "left",
    ["d"] = "right",
    ["s"] = "down",
    ["w"] = "up",
    ["space"] = {"jump"},--, "editor.tool.entity"},
    ["lshift"] = {"run", "editor.line", "editor.select.add"},
    ["rshift"] = {"run", "editor.line", "editor.select.add"},
    ["r"] = {"closePortals"},
	["e"] = {"use"},

    ["delete"] = "editor.delete",
    ["^z"] = "editor.undo",
    ["^y"] = "editor.redo",

    ["^c"] = "editor.copy",
    ["^x"] = "editor.cut",
    ["^v"] = "editor.paste",

    ["^s"] = "editor.save",
    ["^+s"] = "editor.saveAs",
    ["^o"] = "editor.load",

    ["lctrl"] = {"editor.select.subtract", "editor.pipette", "editor.mouseWheelScale"},
    ["rctrl"] = {"editor.select.subtract", "editor.pipette"},
    ["lalt"] = "editor.wand.global",
    ["ralt"] = "editor.wand.global",

    ["return"] = "editor.select.unFloat",

    ["1"] = "editor.tool.erase",
    ["2"] = "editor.tool.move",
    ["3"] = "editor.tool.select",
    ["4"] = "editor.tool.wand",
    ["5"] = "editor.tool.fill",
    ["6"] = "editor.tool.stamp",
	["7"] = "editor.tool.paint",

    ["up"] = "editor.up",
    ["right"] = "editor.right",
    ["down"] = "editor.down",
    ["left"] = "editor.left",

    ["p"] = "debug.star",

    ["pause"] = "debug.pausePlay",
    ["+3"] = "debug.frameAdvance"
}
