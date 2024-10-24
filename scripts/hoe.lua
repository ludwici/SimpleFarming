local plantable = {
    "base:dirt", "base:grass_block"
}

function on_use_on_block(x, y, z, playerid)
    local blockid = block.get(x, y, z)
    local blockName = block.name(blockid)
    local accept = false
    for _, value in ipairs(plantable) do
        if value == blockName then
            accept = true
            break
        end
    end

    local above = block.get(x, y + 1, z)
    if above ~= 0 then
        return
    end

    if not accept then
        return
    end

    block.place(x, y, z, block.index("simplefarming:farmland"), 0)
end