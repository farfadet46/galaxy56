local mod_name = minetest.get_current_modname()
--local
--le vaisseau est créer au premier spawn du joueur par le fichier init.lua
--il spawne en position 1000,400,1000
--le joueurs doit etre spawn dedans :
local ship_pos_in = {x=10006, y=401, z=10009}
local position_sol = {}

function loadtp(name)
	local file, err = io.open(spacial.tp_pos, "r")
	if file then
		local data = minetest.deserialize(file:read("*all"))
		file:close()
		if data then
			position_sol = data
			print (position_sol)
			return
		end
	else
		print("no file")
	end
end

function savetp(name)
	local input, err = io.open(spacial.tp_pos, "w")
	if input then
		input:write(minetest.serialize(spacial.tp_pos[name]))
		input:close()
		minetest.log("info", "saved " .. spacial.tp_pos..name)
	else
		minetest.log("error", "open(" .. minercantile.path_wallet..name .. ", 'w') failed: " .. err)
	end

	--unload wallet if player offline
	local connected = false
	for _, player in pairs(minetest.get_connected_players()) do
		local player_name = player:get_player_name()
		if player_name and player_name ~= "" and player_name == name then
			connected = true
			break
		end
	end
	if not connected then
		spacial.tp_pos[name] = nil
	end
end

minetest.register_tool(mod_name ..":tp", {
	description = "teleporteur",
	inventory_image = "vaisseau_tp.png",
	wield_image = "vaisseau_tp.png",
	
	--Petit hack : si jeté, ne rien faire = ne pas jeter ;)
	on_drop = function(itemstack, dropper, pos)
		return
	end,
	
	--click gauche: Go vers le vaisseau
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing == nil then
			--local player = minetest.get_player_by_name(user:getname())
			--position dans le vaisseau
			position_sol = user:getpos()
			player_name = minetest.get_player_by_name(user)
			--savetp(player_name)
			print(position_sol)
			--player_name = user:get_player_name()
			--minetest.get_player_by_name(user.name)
			
			user:setpos(ship_pos_in)
			print("fait")
			--minetest.chat_send_player(player_name, "Teleported to the ship!")
		end
	end,
	--click droit: Go vers le sol
	on_place = function(pos, node, player, itemstack, pointed_thing)
		print(player)
		--local player_name = player.get_player_by_name(player)
		--print(player_name)
		
		--player:setpos(position_sol)
		--minetest.chat_send_player(player_name, "Teleported to the ground!")
		print("ok")
		return
	end,
})


--attribution d'une commande pour ce TP au vaisseau spacial
minetest.register_chatcommand("ship", {
    description = "Teleport you into your Ship",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        if player == nil then
            -- just a check to prevent the server crashing
            return false
        end
		--A FAIRE: 
		--recup position player
		--enreg cette valeur
		
		--Tp a la position dans le vaisseau
		player:setpos(ship_pos_in )
		minetest.chat_send_player(name, "Teleported to the ship!")
    end,
})