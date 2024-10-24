local EasyLib = require "easylib:main"
local Properties = require "easylib:blocks/properties"
local complex_property = require "easylib:complex_properties"

farmland_block = {
    complex = complex_property:new()
}

EasyLib:mixin(farmland_block, Properties)

farmland_states = {
    NONE = 0,
    GROWTH = 1,
    HARVEST = 2,
    HYDRATED = 3,
    DURABILITY = 4
}

-- local complex = complex_property:new()

-- function on_interact(x, y, z, playerid)
--     farmland_block:unpack_states(x, y, z)
--     complex.value = farmland_block.property

--     print("isGrowth:", complex:get_state(farmland_states.GROWTH))
--     print("isHarvert:", complex:get_state(farmland_states.HARVEST))
--     print("isDura:", complex:get_state(farmland_states.DURABILITY))
--     print("hydrated lvl:", complex:get_value(farmland_states.HYDRATED))
--     print(complex.value)
-- end