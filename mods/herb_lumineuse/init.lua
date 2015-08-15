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
		--place_on = {"default:stone"}, --stone pour la trouver dans les grottes :/
		sidelen = 8,
		y_min = -31000,
		y_max = 31000,
		--fill_ratio = 0.02,
		decoration = "herb_lumi:herb",
	})


