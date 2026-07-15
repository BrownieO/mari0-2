class = require("lib.middleclass")
local util = require("util")
local jumping = require("components.smb3.jumping")
local ActorState = require("class.ActorState")
function playSound(...)
    print(...)
end

controls3 = class("Controls3")

function controls3:cmdDown()
    return false
end

local Actor = class("Actor")
Actor.states = {}

function Actor:initialize()
    self.components = {
        jumping = jumping:new(self),
    }
    self.cache = { speed = { 0, 0 } }
    self.speed = { 0, 0 }
end

function Actor:registerState(name, func)
    self.states[name] = func
end

function Actor:switchState(stateName)
    if stateName then
        if self.states[stateName] then
            self.state = ActorState:new(self, stateName, self.states[stateName])
            self.state:checkExit()
        else
            print(
                string.format(
                    'Tried to switch to nonexistent ActorState "%s" on %s.',
                    stateName,
                    self.actorTemplate.name
                )
            )
        end
    end
end

---

function test_jump_air()
    local myActor = Actor:new("myActor")
    myActor.onGround = false
    myActor.cache.onGround = false

    myActor.components.jumping:jump()
    lunatest.assert_equal(myActor.speed[2], 0)
end

function test_jump_ground()
    local myActor = Actor:new("myActor")
    myActor.onGround = true
    myActor.cache.onGround = true

    myActor.components.jumping:jump()
    lunatest.assert_not_equal(myActor.speed[2], 0)
end

function test_jump_velocities()
    local myActor = Actor:new("myActor")

    myActor.onGround = true
    myActor.cache.onGround = true

    myActor.components.jumping:jump()
    lunatest.assert_equal(myActor.speed[2], -hexToPps("0370"))

    myActor.onGround = true
    myActor.cache.onGround = true

    myActor.speed[1] = hexToPps("0100") + hexToPps("0001")
    myActor.components.jumping:jump()
    lunatest.assert_equal(myActor.speed[2], -hexToPps("0390"))

    myActor.speed[1] = hexToPps("0200") + hexToPps("0001")
    myActor.components.jumping:jump()
    lunatest.assert_equal(myActor.speed[2], -hexToPps("03B0"))

    myActor.speed[1] = hexToPps("0300") + hexToPps("0001")
    myActor.components.jumping:jump()
    lunatest.assert_equal(myActor.speed[2], -hexToPps("03F0"))
end
