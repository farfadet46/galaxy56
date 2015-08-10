
-- *** CC0 by @farfadet46 *** --



minetest.register_node("bloc:UG", {
	description = "Unité de gestion",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bloc_UG.png"},
	inventory_image = "bloc_UG.png",
	wield_image = "bloc_UG.png",
	groups = {snappy=3},
	sounds = default.node_sound_wood_defaults(),
	
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local formspec = "size[7,3]"
		formspec = formspec.."label[0.1,0.4;Unité de gestion: ]"
		formspec = formspec.."label[0.1,0.8;Merci de ne rien mofifier la dedans ! ]"
		formspec = formspec.."image[3,0.2;3,3;bloc_image_UG.png]"
		formspec= formspec.."button_exit[6,2.5;1,0.5;BtnQuit;Quitter]"
		
		minetest.show_formspec(player:get_player_name(), "bloc:MonUG", formspec)
	end

})
