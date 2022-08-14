-- *** CC0 by @farfadet46 *** --

local mod_name = minetest.get_current_modname()

minetest.register_craftitem(mod_name .. ":citronox", {
	description = "Citronox",
	inventory_image = "citronox.png",
	groups = {charge=1},
})

-- fruit for charge the laser beam
--**********************
--fruit level 1 : orange
-- give 25 charge
minetest.register_node(mod_name .. ":orange_fruit", {
	description = "Orange fruit",
	paramtype = "light",
	paramtype2 = "facedir",
 	tiles = {
		"orange_fruit_top.png", "orange_fruit_bottom.png",
		"orange_fruit_side.png", "orange_fruit_side.png",
		"orange_fruit_side.png", "orange_fruit_side.png"
	},
	groups = {snappy=3, flammable=2},
 sounds = default.node_sound_stone_defaults(),

 drawtype = "nodebox",
 node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.125, 0.0625}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875}, -- NodeBox2
		}
	}
 --[[
 on_dig = function(pos, node, player)
	 if player and not minetest.is_protected(pos, player:get_player_name()) then
   max_items = 5,
   items = {mod_name .. ":citronox"},
   ]]--
})


--**********************
--fruit level 1 : red
minetest.register_node(mod_name .. ":red_fruit", {
	description = "Red fruit",
	paramtype = "light",
	paramtype2 = "facedir",
 	tiles = {
		"red_fruit_top.png", "red_fruit_bottom.png",
		"red_fruit_side.png", "red_fruit_side.png",
		"red_fruit_side.png", "red_fruit_side.png"
	},
	groups = {snappy=3},
 sounds = default.node_sound_stone_defaults(),

 drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.125, 0.0625}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875}, -- NodeBox2
		}
	}
})


--**********************
--fruit level 1 : blue
minetest.register_node(mod_name .. ":blue_fruit", {
	description = "Blue fruit",
	paramtype = "light",
	paramtype2 = "facedir",
 	tiles = {
		"blue_fruit_top.png", "blue_fruit_bottom.png",
		"blue_fruit_side.png", "blue_fruit_side.png",
		"blue_fruit_side.png", "blue_fruit_side.png"
	},
	groups = {snappy=3},
 sounds = default.node_sound_stone_defaults(),

 drawtype = "nodebox",
 node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.125, 0.0625}, -- NodeBox1
			{-0.1875, -0.5, -0.1875, 0.1875, 0, 0.1875}, -- NodeBox2
		}
	}
})