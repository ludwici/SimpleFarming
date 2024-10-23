local EasyLib = require "easylib:main"
local plantable = require "easylib:blocks/plantable"

local carrot_crop = {}

EasyLib:mixin(carrot_crop, plantable)

function carrot_crop:get_max_age()
    return 3
end

function carrot_crop:get_drop_table()
    local tbl = {
        {name="simplefarming:carrot", count=2},
    }
    return tbl
end

function carrot_crop:get_base_block_name()
    return "simplefarming:carrot_stage"
end

function on_random_update(x, y, z)
    carrot_crop:grow_plant(x, y, z)
end

function on_interact(x, y, z, playerid)
    carrot_crop:on_interact(x, y, z, playerid)
end