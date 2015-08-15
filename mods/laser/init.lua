--local old_on_use = nil

minetest.register_tool("laser:epee_sword", {
	description = "Laser Sword",
	inventory_image = "laser_epee_laser.png",
	
	--old_on_use = on_use or function() end, 
		
	--on_punch = function(itemstack, user, pointed_thing) 
	--	old_on_use(itemstack, user, pointed_thing) 
		minetest.sound_play("laser_sound", {pos = pointed_thing, gain = 0.5,}),
		--return
	--end, 
	
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=1.0, [2]=0.5, [3]=0.5}, uses=30, maxlevel=3},
			crumbly={times={[1]=1.0, [2]=0.5, [3]=0.5}, uses=30, maxlevel=3},
			snappy={times={[1]=1.0, [2]=0.5, [3]=0.5}, uses=30, maxlevel=3}
		}
	}
})

minetest.register_craft({
	output = 'laser:epee_laser',
	recipe = {
		{'default:glass'},
		{'default:mese'},
		{'default:stick'},
	}
})