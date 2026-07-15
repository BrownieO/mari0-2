local base = extend("smb3/smb3_big.lua")

base.components["misc.palettable"].defaultPalette = {
    { 255, 204, 197 },
    { 234, 158, 34 },
    { 181, 49, 32 },
}

base.components["misc.spawnsEnemy"] = {
    type = "fireball",
    spawnenemyspeedx = 15 * 16,
    spawnenemyoffsety = 12,
    maxenemycount = 2,
}

return base
