local PortalProjectile = require "class.PortalProjectile"
local Component = require "class.Component"
local portalGun = class("misc.portalGun", Component)

portalGun.defaultColors = {
    Color3.fromHSV(207/360, 0.84, 0.96),
    Color3.fromHSV(31/360, 1, 0.98),
}

function portalGun:initialize(actor, args)
    Component.initialize(self, actor, args)

    self.actor.hasPortalGun = true
	
	if self.actor.player then
		self.portals = self.actor.player.portals
	end
end

function portalGun:playerAssigned()
	self.portals = self.actor.player.portals
end

function portalGun:closePortals()
	if #self.portals > 0 then
		playSound("portal_fizzle", 0.8)
	end
    for i = 1, 2 do
        if self.portals[i] then
            self.portals[i].deleteMe = true
            self.portals[i] = nil
        end
    end
end

function portalGun:click(dt, actorEvent, button)
    if button == 1 or button == 2 then
        local hasCrosshair = self.actor:hasComponent("misc.crosshair")

        assert(hasCrosshair, "Actor tried to fire a portal without having a crosshair.")

        local crosshair = hasCrosshair.crosshair

        if crosshair.target.valid then
            local color = self.actor.player and self.actor.player.portalColors and self.actor.player.portalColors[button] or self.defaultColors[button]

            local portal = self.actor.world:attemptPortal(
                crosshair.target.layer,
                crosshair.target.tileX,
                crosshair.target.tileY,
                crosshair.target.blockSide,
                crosshair.target.worldX,
                crosshair.target.worldY,
                color,
                self.portals[button])
			
            if portal then
                if self.portals[button] then
                    self.portals[button].deleteMe = true
                end

                self.portals[button] = portal

                if self.portals[1] and self.portals[2] then
                    self.portals[1]:connectTo(self.portals[2])
                    self.portals[2]:connectTo(self.portals[1])

                    self.portals[button].timer = self.portals[button].connectsTo.timer
                end
				
				if button == 1 then
					playSound("portalgun_shoot_blue", 0.5)
					playSound("portal_open1", 0.5)
				elseif button == 2 then
					playSound("portalgun_shoot_orange", 0.5)
					playSound("portal_open2", 0.5)
				end
            else
				playSound("portal_invalid_surface", 0.8)
			end

            -- Create projectile
            table.insert(self.actor.world.portalProjectiles, PortalProjectile:new(
                self.actor.world,
                crosshair.origin.x,
                crosshair.origin.y,
                crosshair.target.worldX,
                crosshair.target.worldY,
                color
            ))

            -- Animate crosshair if it wants to
            crosshair:shoot(color)
        end
    end
end

return portalGun