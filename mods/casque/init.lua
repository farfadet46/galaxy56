-- *** CC0 by @farfadet46 *** --
-- ok le 13 août 2015

casque = {}
local casque_actif = true

minetest.register_on_joinplayer(function(player)
	-- toujours porte le casque au début de la partie
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
					porte_casque(player)
					minetest.chat_send_player(name,"Vous avez mis votre casque")
					casque_actif = true
					return
				end
				
-- Sinon si le joueur veut enlever son casque
			elseif param == "off" then
				if casque_actif == true then --on porte le casque
					enleve_casque(player)
					minetest.chat_send_player(name,"Vous avez enlevé votre casque")
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
		text = "casque.png" -- text = nom de l'image.
		})
		minetest.sound_play("casque_respire")
	casque_actif = true
end
	
function enleve_casque(player)
	local numParticles =  100
	local playerPos = player:getpos()
	
	player:hud_remove(casque[player:get_player_name()])
		
	for i=1, numParticles, 1 do
		minetest.add_particle({
			pos = {x=playerPos["x"]+math.random(-1,1)*math.random()/2,y=playerPos["y"]+1.5,z=playerPos["z"]+math.random(-1,1)*math.random()/2},
			--pos = {x=0, y=0, z=0},
			--vel = {x=0, y=5, z=0},
			vel = {x=math.random(-5,5), y=math.random(-5,5), z=math.random(-5,5)},
			acc = {x=0, y=-13, z=0},
			expirationtime = math.random(),
			size = math.random()+0.5,
			collisiondetection = false,
			vertical = false,
			texture = "bubble.png",
		})
	end
	-- petit son qui rajoute du réalisme.
	minetest.sound_play("casque_sound")
	casque_actif = fasle
end

unified_inventory.register_button("casque", {
	type = "image",
	image = "btn_casque.png",
	tooltip = "Porter-Enlever le casque",
	action = function(player)
		if casque_actif == true then
			enleve_casque(player)
		else
			porte_casque(player)
		end
	end,
})