local EasyLib = require "easylib:main"
local base_fertilizer = require "simplefarming:base_fertilizer"

local fertilizer_harvest = {}
EasyLib:mixin(fertilizer_harvest, base_fertilizer)

function fertilizer_harvest:get_farmland_property()
    return farmland_states.HARVEST
end

function fertilizer_harvest:get_farmland_block()
    return farmland_block
end

function on_use_on_block(x, y, z, playerid)
    fertilizer_harvest:try_use(x, y, z, playerid)
end