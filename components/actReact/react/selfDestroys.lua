local Component = require "class.Component"
local selfDestroys = class("misc.selfDestroys", Component)

selfDestroys.argList = {
    {"on", "required|string"},
}

function selfDestroys:initialize(actor, args)
    Component.initialize(self, actor, args)

    self[self.on] = function(self)
        self.actor:destroy()
    end
end

return selfDestroys
