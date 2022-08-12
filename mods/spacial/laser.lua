-- (c)2015 @farfadet46
-- Minetest mod : laser

--ne fonctionne pas :/

--[[
local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	return 0
end
]]--

minetest.register_tool( ":", {

--	description = "Foreuse laser",
	inventory_image = "laser.png",
	wield_image = "laser.png",
	wield_scale = {x=1/16, y=12, z=1/4},
	
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=300, maxlevel=3},
			crumbly={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=300, maxlevel=3},
			snappy={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=300, maxlevel=3}
		}
	},
	
	--don't drop this item (need to find an idea to put it as a hand tool :)
	on_drop = function(itemstack, dropper, pos)
		return
	end,

	on_use = function(itemstack, user, pointed_thing)
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		--don't get air node
		if pos == nil then
			return
		else
		local node = minetest.get_node(pos)
			if node.name then
				local inv = user:get_inventory()
				if inv then
					inv:add_item("main", node.name)
					minetest.remove_node(pos)
					minetest.sound_play("laz")
				end
			end
		end
	end,

})
