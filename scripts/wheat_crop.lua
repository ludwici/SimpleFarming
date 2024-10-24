local EasyLib = require "easylib:main"
local plantable = require "easylib:blocks/plantable"

local wheat_crop = {}

EasyLib:mixin(wheat_crop, plantable)

function wheat_crop:get_max_age()
    return 7
end

function wheat_crop:get_drop_table()
    local age = self:get_age()
    local tbl = {}
    if (age == self:get_max_age()) then
        table.insert(tbl, {name="simplefarming:wheat_seed", count=2})
        table.insert(tbl, {name="simplefarming:wheat"})
    end

    return tbl
end

function wheat_crop:get_base_block_name()
    return "simplefarming:wheat_stage"
end

function wheat_crop:has_harvest(x, y, z, playerid)
    local age = self:get_age()
    return age == self:get_max_age()
end

function on_placed(x, y, z, playerid)
    wheat_crop:unpack_states(x, y, z)
end

function on_random_update(x, y, z)
    wheat_crop:grow_plant(x, y, z)
end

function on_broken(x, y, z, playerid)
    wheat_crop:on_broken(x, y, z, playerid)
end