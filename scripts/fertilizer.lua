local EasyLib = require "easylib:main"
local fertilizer = require "easylib:items/fertilizer"
local plantable = require "easylib:blocks/plantable"

local base_fertilizer = {}
EasyLib:mixin(base_fertilizer, fertilizer)

function base_fertilizer:get_plant_family()
    return {
        "simplefarming:wheat_stage",
        "simplefarming:carrot_stage",
    }
end

function base_fertilizer:get_conditions_for_use(x, y, z, playerid)
    local accept = base_fertilizer:apply(x, y, z, playerid)
    return accept
end

function base_fertilizer:use(x, y, z, playerid)
    plantable:grow_plant(x, y, z, self.blockName)
end

function on_use_on_block(x, y, z, playerid)
    base_fertilizer:try_use(x, y, z, playerid)
end