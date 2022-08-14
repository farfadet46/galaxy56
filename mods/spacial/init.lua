spacial = {}
--position du vaisseau en globale pour que tous les mod puissent y acceder
ShipPosition = {x = 10000, y = 400, z = 10000}

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local mts = modpath .. "/ship.mts"

minetest.register_on_joinplayer(function(player)
--créer le cheap 'ship' ;)
	--minetest.place_schematic(pos, schematic, rotation, replacements, force_placement)
	minetest.place_schematic(ShipPosition, mts, 0, 0, true)
end)

dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/casque.lua")
dofile(modpath .. "/vaisseau.lua")
dofile(modpath .. "/laser.lua")
-- we can get air node and can't kill monster so desactivated for now.


if minetest.setting_getbool("log_mods") then
	minetest.log("action", S("[spacial] loaded."))
end
