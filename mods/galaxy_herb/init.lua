galaxy_herb = {}

galaxy_herb.register_spike = function(color)
	minetest.register_node("galaxy_herb:spike_"..color, {
		description = color.." Spike",
		drawtype = "plantlike",
		tiles = {"spike.png^[colorize:"..color..":100"},
		inventory_image = "spike.png^[colorize:"..color..":100",
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		--damage_per_second = 4, -- no damage, just deco.
		groups = {crumbly=3, fruit = 1},
		selection_box = {
			type = "fixed",
			--fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			fixed = {-0.3, -0.5, -0.3, 0.3, -0.1, 0.3},
		},
	})

  minetest.register_decoration({
		deco_type = "simple",
		place_on = {"group:stone","group:dirt","default:dirt_with_grass"},
		sidelen = 16,
		y_min = -31000,
		y_max = 31000,
		fill_ratio = 0.02,
		decoration = "galaxy_herb:spike_"..color,
  --rotation = "random", -- Rotation is used for tree not for "plantlike" drawtype
	})
 end
 
 galaxy_herb.register_herb = function(color)
	minetest.register_node("galaxy_herb:herb_"..color, {
		description = color.." herb",
		drawtype = "plantlike",
		tiles = {"herb.png^[colorize:"..color..":100"},
		inventory_image = "herb.png^[colorize:"..color..":100",
		paramtype = "light",
		walkable = true,
		buildable_to = true,
		--damage_per_second = 4, -- no damage, just deco.
		groups = {crumbly=3},
		selection_box = {
			type = "fixed",
			--fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
			fixed = {-0.3, -0.5, -0.3, 0.3, -0.1, 0.3},
		},
	})
  
	minetest.register_decoration({
		deco_type = "simple",
		--place_on = {"default:dirt_with_grass"},
		sidelen = 32,
  --[[
		noise_params = {
			offset = -0.015,
			scale = 0.03,
			spread = {x=100, y=100, z=100},
			seed = 436,
			octaves = 3,
			persist = 0.6
		},
  ]]--
		biomes = {"grassland"},
		y_min = -32000,
		y_max = 32000,
		decoration = "galaxy_spikes:herb".. color,
	})
 
 end
 

--galaxy_herb.register_spike("red")
-- galaxy_herb.register_spike("green")
-- galaxy_herb.register_spike("blue")
-- galaxy_herb.register_spike("olive")
-- galaxy_herb.register_spike("brown")
-- galaxy_herb.register_spike("black")
-- galaxy_herb.register_spike("purple")

galaxy_herb.register_herb("red")
galaxy_herb.register_herb("green")
galaxy_herb.register_herb("blue")
galaxy_herb.register_herb("olive")
galaxy_herb.register_herb("brown")
galaxy_herb.register_herb("black")
galaxy_herb.register_herb("purple")
galaxy_herb.register_herb("white")
