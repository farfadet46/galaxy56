
local S = mobs.intllib

-- based on the Dirt Monster by PilzAdam

mobs:register_mob("mobs_alien:alien1", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 2,
	damage = 2,
	hp_min = 3,
	hp_max = 70,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "alien.b3d",
	textures = {
		{"mobs_dirt_monster.png"},
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
		--"mobs_dirtmonster.ogg"
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	--[[drops = {
		{name = "default:dirt", chance = 1, min = 3, max = 5},
	},]]
	water_damage = 0,
	lava_damage = 3,
	light_damage = 0,
	fear_height = 4,
	--[[
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},]]--
})

mobs:register_spawn("mobs_alien:alien1", {"default:dirt_with_grass", "ethereal:gray_dirt"}, 7, 0, 7000, 1, 31000, false)

mobs:register_egg("mobs_alien:alien1", S("Dirt Monster"), "default_dirt.png", 1)

-- compatibility
mobs:alias_mob("mobs:alien1", "mobs_alien:alien1")
