local Component = require "class.Component"
local palettable = class("misc.palettable", Component)

palettable.argList = {
    {"imgPalette", "required|palette"},
    {"defaultPalette", "palette", function(self) return self.imgPalette end},
}

function palettable:initialize(actor, args)
    Component.initialize(self, actor, args)

    self.actor.imgPalette = self.imgPalette
    
    -- If defaultPalette is not specified, use imgPalette as default
    self.actor.defaultPalette = self.defaultPalette or self.imgPalette

    -- Switch to the defaultPalette if it's different from the imgPalette
    if self.actor.defaultPalette ~= self.actor.imgPalette then
        self.actor.palette = self.actor.defaultPalette
    else
        self.actor.palette = self.actor.imgPalette
    end
end

return palettable
