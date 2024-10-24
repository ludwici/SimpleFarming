local EasyLib = require "easylib:main"
local base_fertilizer = require "simplefarming:base_fertilizer"

local fertilizer_speed = {}
EasyLib:mixin(fertilizer_speed, base_fertilizer)

function fertilizer_speed:get_farmland_property()
    return farmland_states.GROWTH
end

function fertilizer_speed:get_farmland_block()
    return farmland_block
end

function on_use_on_block(x, y, z, playerid)
    fertilizer_speed:try_use(x, y, z, playerid)
end