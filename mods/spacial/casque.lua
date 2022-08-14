-- *** CC0 by @farfadet46 *** --
-- ok le 13 août 2015

casque = {}
local casque_actif = true

minetest.register_on_joinplayer(function(player)
	-- toujours porte le casque au début de la partie
	-- on verra +tard pour sauver cette valeur.
	porte_casque(player)
end)

function porte_casque(player)
	casque[player:get_player_name()] = player:hud_add({
		hud_elem_type = "image",
		name="casque",
		scale = {x=-100 , y=-100},
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
	local playerPos = player:get_pos()
	
	player:hud_remove(casque[player:get_player_name()])
		
	for i=1, numParticles, 1 do
		minetest.add_particle({
			pos = {x=playerPos["x"]+math.random(-1,1)*math.random()/2,y=playerPos["y"]+1.5,z=playerPos["z"]+math.random(-1,1)*math.random()/2},
			--pos = {x=0, y=0, z=0},
			--vel = {x=0, y=5, z=0},
			velocity = {x=math.random(-5,5), y=math.random(-5,5), z=math.random(-5,5)},
			acceleration = {x=0, y=-13, z=0},
			expirationtime = math.random(),
			size = math.random()+0.5,
			collisiondetection = false,
			vertical = false,
			texture = "bubble.png",
		})
	end
	-- petit son qui rajoute du réalisme.
	minetest.sound_play("casque_sound")
	casque_actif = false
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
