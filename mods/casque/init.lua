-- *** CC0 by @farfadet46 *** --
-- ok le 13 août 2015

casque = {}
local casque_actif = true

minetest.register_on_joinplayer(function(player)
	porte_casque(player)
end)

minetest.register_chatcommand("casque",{
	desciption = "porter / enlever le casque",
		func = function( name , param)
		local player = minetest.get_player_by_name(name)
		
-- Si le joueur veut porter son casque
			if param == "on" then 
				if casque_actif == true then
					minetest.chat_send_player(name,"Vous portez deja votre casque")
					return
				elseif casque_actif == false then
					minetest.chat_send_player(name,"Vous avez mis votre casque")
					
					porte_casque(player)
					
					casque_actif = true
					return
				end
				
-- Sinon si le joueur veut enlever son casque
			elseif param == "off" then
				if casque_actif == true then --on porte le casque
					minetest.chat_send_player(name,"Vous avez enlevé votre casque")
					player:hud_remove(casque[player:get_player_name()])
					casque_actif = false
					return
				elseif casque_actif == false then --on ne porte pas le casque
					minetest.chat_send_player(name,"Vous ne portez pas encore votre casque")
					return
				end
				
-- Sinon si erreur dans la commande
			else
				minetest.chat_send_player(name,"Veauillez utiliser la commande '/casque' suivie de 'on' ou 'off' pour porter/enlever votre casque.")
				return
			end
		
		return true
	end,
	})
	
function porte_casque(player)
	casque[player:get_player_name()] = player:hud_add({
		hud_elem_type = "image",
		name="casque",
		scale = {x=100 , y=-100},
		alignment = { x=0, y=0 },
		offset = { x=0, y=0 },
		position =  { x=0.5, y=0.5 },
		text = "casque.png" -- text = image a placer
		})
end
	