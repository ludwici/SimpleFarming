local EasyLib = require "easylib:main"
local UsableItem = require "easylib:items/usable_item"

local base_fertilizer = {}
EasyLib:mixin(base_fertilizer, UsableItem)
base_fertilizer.decrease_count = true

function base_fertilizer:get_conditions_for_use(x, y, z, playerid)
    if not EasyLib:get_block_name(x, y, z) == "simplefarming:farmland" then
        return false
    end

    if not self:get_farmland_property() then
        return false
    end

    if not self:get_farmland_block() then
        return false
    end

    return true
end

function base_fertilizer:get_farmland_property()
    return nil
end

function base_fertilizer:get_farmland_block()
    return nil
end

function base_fertilizer:use(x, y, z, playerid)
    local farmland_property = self:get_farmland_property()
    local farmland_block = self:get_farmland_block()
    farmland_block:unpack_states(x, y, z)
    farmland_block.complex.value = farmland_block.property
    if not farmland_block.complex:get_state(farmland_property) then
        farmland_block.complex:set_state(farmland_property)
        farmland_block.property = farmland_block.complex.value
        farmland_block:pack_states()

        block.set(x, y, z, block.index("simplefarming:farmland"), farmland_block.states)
        return true
    end
    return false
end

function on_use_on_block(x, y, z, playerid)
    base_fertilizer:try_use(x, y, z, playerid)
end

return base_fertilizer