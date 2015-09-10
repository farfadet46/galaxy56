-- *** CC0 by @farfadet46 *** --
-- créer un bouton de TP au vaisseau

unified_inventory.register_button("vaisseau", {
	type = "image",
	image = "TPVaisseau.png",
	tooltip = "Se téléporter au vaisseau",
	action = function(player)
		local name = player:get_player_name()
		minetest.chat_send_player(name, "vous ne disposez pas de la technologie de TP, revenez dans 256 années.")
	end,
	
})

--[[

connected_players_string = 'Players online: '
 
        for _,player in ipairs(minetest.get_connected_players()) do
            connected_players_string  =  connected_players_string .. 
                                         player:get_player_name() .. 
                                         ' '
        end
 
        minetest.chat_send_player(name, connected_players_string)
 
        return true
		
		
		
		
		
		

-- rayon visuel de TP --
minetest.register_node("vaisseau:rayon", {
	description = "Rayon de tp",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rayon.png"},
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
]]--