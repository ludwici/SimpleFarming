local EasyLib = require "easylib:main"
local plantable = require "easylib:blocks/plantable"

local wheat_block = {}

EasyLib:mixin(wheat_block, plantable)

function wheat_block:get_max_age()
    return 7
end

function wheat_block:get_drop_table()
    local tbl = {
        {name="simplefarming:wheat_seed", count=2},
        {name="simplefarming:wheat"}
    }
    return tbl
end

function wheat_block:get_base_block_name()
    return "simplefarming:wheat_stage"
end

function on_random_update(x, y, z)
    wheat_block:grow_plant(x, y, z)
end

function on_interact(x, y, z, playerid)
    wheat_block:on_interact(x, y, z, playerid)
end