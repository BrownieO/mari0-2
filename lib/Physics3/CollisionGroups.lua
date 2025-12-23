--- Collision groups for Physics3 objects
-- Objects can belong to one collision group and specify which groups they should not collide with

local CollisionGroups = {}

CollisionGroups.templates = VAR("collisionCategories")

function CollisionGroups.shouldCollide(obj1, obj2)
    if not obj1.collisionGroup or not obj2.collisionGroup then
        return true
    end
    
    if obj1.collisionGroup == CollisionGroups.templates.NON_COLLIDE or obj2.collisionGroup == CollisionGroups.templates.NON_COLLIDE then
        return false
    end	
	
    if obj1.noncollide and bit.band(obj1.noncollide, obj2.collisionGroup) ~= 0 then
        return false
    end

    if obj2.noncollide and bit.band(obj2.noncollide, obj1.collisionGroup) ~= 0 then
        return false
    end
    
    return true
end

return CollisionGroups
