	minetest.register_node("herb_lumineuse:herb", {
		description = "Herbe lumineuse",
		drawtype = "plantlike",
		light_source = 20,
		tiles = {"herb_lumi.png"},
		inventory_image = "herb_lumi.png",
		paramtype = "light",
		walkable = false,
		groups = {crumbly=3, fruit = 1},
	})

	
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:stone"}, --stone pour la trouver dans les grottes :/
		sidelen = 8,
		y_min = -31000,
		y_max = 31000,
		--fill_ratio = 0.02,
		decoration = "herb_lumi:herb",
	})


