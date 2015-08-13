galaxy_spikes = {}

galaxy_spikes.register_spike = function(color)
	minetest.register_node("galaxy_spikes:spike_"..color, {
		description = color.." Spike",
		drawtype = "plantlike",
		tiles = {"spike.png^[colorize:"..color..":100"},
		inventory_image = "spike.png^[colorize:"..color..":100",
		paramtype = "light",
		walkable = false,
		--damage_per_second = 4, -- no damage, just deco.
		groups = {crumbly=3, fruit = 1},
	})

	
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"group:stone","group:dirt","default:dirt_with_grass"},
		sidelen = 8,
		y_min = -31000,
		y_max = 31000,
		--fill_ratio = 0.02,
		decoration = "galaxy_spikes:spike_"..color,
	})
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"group:sand"},
		sidelen = 80,
		y_min = -31000,
		y_max = 31000,
		decoration = "galaxy_spikes:spike_yellow",
	})	
end

galaxy_spikes.register_spike("red")
--galaxy_spikes.register_spike("green")
--galaxy_spikes.register_spike("blue")
galaxy_spikes.register_spike("olive")
galaxy_spikes.register_spike("yellow")
galaxy_spikes.register_spike("black")
--galaxy_spikes.register_spike("purple")
