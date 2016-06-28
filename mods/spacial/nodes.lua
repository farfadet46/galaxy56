
-- *** CC0 by @farfadet46 *** --

local mod_name = minetest.get_current_modname()

minetest.register_node(mod_name .. ":UG", {
	description = "Unité de gestion",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bloc_UG.png"},
	inventory_image = "bloc_UG.png",
	wield_image = "bloc_UG.png",
	groups = {snappy=3},
	--sounds = default.node_sound_wood_defaults(),
	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local formspec = "size[7,3]"
		formspec = formspec.."label[0.1,0.4;Unité de gestion: ]"
		formspec = formspec.."label[0.1,0.8;Merci de ne rien mofifier la dedans ! ]"
		formspec = formspec.."image[3,0.2;3,3;bloc_image_UG.png]"
		formspec= formspec.."button_exit[6,2.5;1,0.5;BtnQuit;Quitter]"
		
		minetest.show_formspec(player:get_player_name(), mod_name .. ":MonUG", formspec)
	end

})

-- node de décoration de la navette
minetest.register_node(mod_name .. ":bloc_commande1", {
	description = "Bloc de commande 1",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {{name="bloc_commande1.png", animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2}},"bloc_commande_cote.png",},
	inventory_image = "bloc_commande1.png",
	groups = {snappy=3},
})
minetest.register_node(mod_name .. ":bloc_commande2", {
	description = "Bloc de commande 2",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bloc_commande2.png","bloc_commande_cote.png",},
	inventory_image = "bloc_commande1.png",
	groups = {snappy=3},
})
minetest.register_node(mod_name .. ":bloc_commande3", {
	description = "Bloc de commande 3",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bloc_commande3.png","bloc_commande_cote.png",},
	inventory_image = "bloc_commande1.png",
	groups = {snappy=3},
})