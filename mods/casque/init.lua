-- *** CC0 by @farfadet46 *** --

--[[
minetest.register_on_joinplayer(function(player)
	local idx = player:hud_add({
		hud_elem_type = "image",		
		scale = {x=-100 , y=-100},
		alignment = { x=0, y=0 },
		offset = { x=0, y=0 },
		position =  { x=0.5, y=0.5 },
		text = "casque.png" -- text = image a placer
		})
end)
]]--
local posit = nil

minetest.register_chatcommand("casque",{
	params = "<on_off>",
	desciption = "porter / enlever le casque",
	--privs = {talk = true},
		func = function( player , on_off)
			posit = player:getpos()
			minetest.chat_send_all(posit)
			if on_off == "on" then
				--[[	idx = player:hud_add({
					hud_elem_type = "image",		
					scale = {x=-100 , y=-100},
					alignment = { x=0, y=0 },
					offset = { x=0, y=0 },
					position =  { x=0.5, y=0.5 },
					text = "casque.png" -- text = image a placer
				}) 
				]]--
				minetest.chat_send_all("casque ON ")
			elseif on_off == "off" then
			--	player:hud_remove(idx)
				minetest.chat_send_all("casque OFF ")
			else
				minetest.chat_send_all("Erreur dans la commande casque. seule les valeurs 'on' et 'off' sont autorisee.")
			end
		
		return true
		--[[
		func = function( _ , port)
		minetest.chat_send_all("le joueur a dit : " .. port)
		return true, "Text was sent successfully"
		]]--
	end,
	})
	