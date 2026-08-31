local base = extend("enemies/shelled/koopa_red.lua")

base.img = "img/actors/koopa_winged.png"
base.icon = "img/icons/koopa_red_winged.png"

base.components["animation.frames"] = {frames = {1, 2, 3, 4}}
base.components["movement.truffleShuffle"] = nil
base.components["movement.flyVertical"] = {}
base.components["actReact.react.transforms"].into = "koopa_red"

return base