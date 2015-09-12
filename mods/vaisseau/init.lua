-- *** CC0 by @farfadet46 *** --
-- créer un bouton de TP au vaisseau

-- rayon visuel de TP --
minetest.register_node("vaisseau:rayon", {
	description = "Rayon de tp",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rayon.png","rayon.png","rayon.png","rayon.png","",""},
	--groups = {cracky=2},
	drawtype = "glasslike",
	is_ground_content = false,
	light_source = 10,
	sunlight_propagates = true,
	walkable = false,
	use_texture_alpha = true,
	post_effect_color = {a = 128, r= 252, g= 255, b= 204},
})

--bloc de TP
minetest.register_node("vaisseau:Bloc_TP", {
	description = "Bloc de tp",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"Bloc_TP.png"},
	drawtype = "node",
	is_ground_content = true,
	walkable = true,
	--groups = {cracky=2},
})

unified_inventory.register_button("vaisseau", {
	type = "image",
	image = "TPVaisseau.png",
	tooltip = "Se téléporter au vaisseau",
	action = function(player)
		local name = player:get_player_name()
		local player_pos = player:getpos()
		--local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		player_pos.y = player_pos.y -1
		minetest.set_node( player_pos , {name="vaisseau:Bloc_TP"})
		
		for i = 1, 500 do
			player_pos.y = player_pos.y+1
			minetest.set_node( player_pos , {name="vaisseau:rayon"})
		end
		
		--debug : 
		--minetest.chat_send_player(name, "vous ne disposez pas de la technologie de TP, revenez dans 256 années.")
	end,
	
})
