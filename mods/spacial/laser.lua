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
	range = 8,
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
    if node.name ~= "air" then
     local inv = user:get_inventory()
     if inv then
      inv:add_item("main", node.name)
      minetest.remove_node(pos)
      minetest.sound_play("laz")
     end
    end
			end
		end
	end,

})


--[[ creative hand exemple : --
if minetest.setting_getbool("creative_mode") then
	local digtime = 0.5
	minetest.register_item(":", {
		type = "none",
		wield_image = "wieldhand.png",
		wield_scale = {x=1,y=1,z=2.5},
		range = 10,
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				cracky = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				snappy = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				choppy = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
				oddly_breakable_by_hand = {times={[1]=digtime, [2]=digtime, [3]=digtime}, uses=0, maxlevel=3},
			},
			damage_groups = {fleshy = 10},
		}
	})
	
	minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
		return true
	end)
 ]]--