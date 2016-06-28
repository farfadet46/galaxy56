	minetest.register_node("herb_lumineuse:herb", {
		description = "Herbe lumineuse",
		drawtype = "plantlike",
		waving = 1,
		light_source = 20,
		tiles = {"herb_lumi.png"},
		inventory_image = "herb_lumi.png",
		paramtype = "light",
		walkable = false,
		is_ground_content = true,
		groups = {crumbly=3, fruit = 1},
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 0.1, 0.25},
		},
	})

	
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:stone"}, --stone pour la trouver dans les grotes :/
		sidelen = 16,
		seed = 19822,
		noise_params = {
			offset = -0.015,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 19822,
			octaves = 3,
			persist = 0.6
		},
		--biomes = {"grassland"},
		y_min = -32000,
		y_max = 32000,
		--fill_ratio = 0.02,
		decoration = "herb_lumineuse:herb",
	})


--[[
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.04,
			scale = 0.08,
			spread = {x=100, y=100, z=100},
			seed = 66440,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = -32000,
		y_max = 32000,
		decoration = "default:grass_1",
	})
	
	]]--