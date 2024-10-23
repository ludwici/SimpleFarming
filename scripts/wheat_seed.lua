local EasyLib = require "easylib:main"
local usable_item = require "easylib:items/usable_item"

local wheat_seed = {}
EasyLib:mixin(wheat_seed, usable_item)

wheat_seed.decrease_count = true

function wheat_seed:get_conditions_for_use(x, y, z, playerid)
    if EasyLib:has_block_above(x, y, z) then
        return false
    end

    local blockid = block.get(x, y, z)
    local blockName = block.name(blockid)

    if blockName ~= "simplefarming:farmland" then
        return false
    end

    return true
end

function wheat_seed:use(x, y, z, playerid)
    block.place(x, y + 1, z, block.index("simplefarming:wheat_stage0"), 0)
end

function on_use_on_block(x, y, z, playerid)
    wheat_seed:try_use(x, y, z, playerid)
end