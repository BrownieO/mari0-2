local base = extend("enemies/shelled/koopa_shell.lua")

base.img = "img/actors/enemies/beetle_shell.png"
base.icon = nil

base.components["misc.palettable"].imgPalette = {
    { 255, 204, 197 },
    { 234, 158, 34 },
    { 0, 0, 0 },
}

base.components["actReact.react.transforms"].into = "beetle"
base.components["actReact.react.collapsesOnEvents"] = nil
base.components["actReact.react.reactsToDamageEvents"] = {}
base.components["actReact.react.reactsToDamageEvents"].on = {
	getHurtEnemy = "collapse",
	getKilledEnemy = "collapse",
	getFireballDamage = "explodeProjectile",
	getStarDamage = "collapse",
	getProjectileDamage = "collapse"
}

return base
