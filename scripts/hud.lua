function on_hud_open()
    console.add_command(
        "binfo x:num y:num z:num", "Show block info",
        function (args, kwargs)
            local x, y, z = unpack(args)
            print(x, y, z)
            local blockid = block.get(x, y, z)
            local blockName = block.name(blockid)
            local states = block.get_states(x, y, z)
            local dec = block.decompose_state(states)
            print(blockName, states, dec[1], dec[2], dec[3])
        end
    )
end