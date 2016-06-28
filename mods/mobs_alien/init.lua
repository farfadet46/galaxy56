
local path = minetest.get_modpath("mobs_alien")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
mobs.intllib = S

-- Monsters

dofile(path .. "/alien.lua") -- farfadet46

print ("[MOD] Mobs Redo 'Monsters' loaded")
