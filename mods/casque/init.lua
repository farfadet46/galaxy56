local idx = nil

minetest.register_on_joinplayer(function(player)
	idx = player:hud_add({
		hud_elem_type = "image",		
		scale = {x=-100 , y=-100},
		alignment = { x=0, y=0 },
		offset = { x=0, y=0 },
		position =  { x=0.5, y=0.5 },
		text = "casque.png"
	})
end)

minetest.register_chatcommand("casque",{
	params = "<port>",
	desciption = "porter / enlever le casque",
	--privs = {talk = true},
		func = function( _ , port)
			if port == "on" then
				player:hud_remove(idx)
		--[[	elseif port == "off" then
				player:hud_add(idx)
			else
				minetest.chat_send_all("erreur dans la commande casque. seule les valeurs 1 et 0 sont autorisée.") ]]--
			end
		
		return true, "done"
		--[[
		func = function( _ , port)
		minetest.chat_send_all("le joueur a dit : " .. port)
		return true, "Text was sent successfully"
		]]--
	end,
	})
	