local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end

--car

minetest.register_entity("space_vehicles:car", {
	hp_max = 10,
	physical = true,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
 	visual = "cube",
 	visual_size = {x=1, y=1},
	textures = {"space_vehicles_metal.png", "space_vehicles_metal.png", "space_vehicles_wheel.png", "space_vehicles_wheel.png", "space_vehicles_metal_front.png", "space_vehicles_metal.png"},
	spritediv = {x=1, y=1},
	initial_sprite_basepos = {x=0, y=0},	
	is_visible = true,
	makes_footstep_sound = false,
	automatic_rotate = true,
	
	user = nil,
	speed = 0,
	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end
		if self.user == nil then
			self.user = clicker
			if self.user ~= nil then
				self.user:set_attach(self.object, "", {x = 0, y = 11, z = -3}, {x = 0, y = 0, z = 0})
			end
		else
			self.user = nil
			clicker:set_detach()
		end
	end,
	
	on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)
		if not puncher or not puncher:is_player() then
			return
		end
		if puncher == self.driver then
			self.user = nil
			puncher:set_detach()
		end
		if not minetest.setting_getbool("creative_mode") then
			puncher:get_inventory():add_item("main", "space_vehicles:car")
		end
		minetest.after(0.1, function()
			self.object:remove()
		end)
	end,

	on_step = function(self, dtime)
		if self.user then
			local ctrl = self.user:get_player_control()
			local v = 0 
			local yaw = self.object:getyaw()
			
			if ctrl.up then
				v = 0.1 + self.speed
			end
			if ctrl.down then
				v = -0.1 + self.speed
			end
			if ctrl.left then
				yaw = yaw +0.05
			end
			if ctrl.right then
				yaw = yaw -0.05
			end

			self.speed = v 

			self.object:setyaw(yaw)
			self.object:setvelocity(get_velocity(v, yaw, -1))
			--self.object:setacceleration({x=0, y=-8.4, z=0})
		else
			if dtime % 1000 == 0 then
				self.object:setvelocity({math.random(-2, 2), math.random(-2, 2), math.random(-2, 2)})
			end
		end
	end,
})

-- spaceslider

minetest.register_entity("space_vehicles:spaceslider", {
	physical = true,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
 	visual = "cube",
	textures = {"space_vehicles_metal.png", "space_vehicles_wheel.png", "space_vehicles_metal_front.png", "space_vehicles_metal_front.png", "space_vehicles_metal_front.png", "space_vehicles_metal_front.png"},	
	
	user = nil,
	speed = 0,
	jump = 0,
	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end
		if self.user == nil then
			self.user = clicker
			if self.user ~= nil then
				self.user:set_attach(self.object, "", {x = 0, y = 11, z = -3}, {x = 0, y = 0, z = 0})
			end
		else
			self.user = nil
			clicker:set_detach()
		end
	end,

	on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)
		if not puncher or not puncher:is_player() then
			return
		end
		if puncher == self.driver then
			self.user = nil
			puncher:set_detach()
		end
		if not minetest.setting_getbool("creative_mode") then
			puncher:get_inventory():add_item("main", "space_vehicles:spaceslider")
		end
		minetest.after(0.1, function()
			self.object:remove()
		end)
	end,

	on_step = function(self, dtime)
		if self.user then
			local ctrl = self.user:get_player_control()
			local v = 0 
			local yaw = self.object:getyaw()
			
			
			if ctrl.up then
				v = 0.2 + self.speed
			elseif ctrl.down then
				v = -0.2 + self.speed
			elseif self.speed > 2 then
				v = self.speed - 0.1
			elseif self.speed < -2 then
				v = self.speed + 0.1
			end
			if ctrl.left then
				yaw = yaw +0.09
			end
			if ctrl.right then
				yaw = yaw -0.09
			end
			if ctrl.jump then
				self.jump = self.jump + 0.9
			elseif  self.jump > 0 then
				self.jump = self.jump - 1.9
			end

			self.speed = v 

			self.object:setyaw(yaw)
			self.object:setvelocity(get_velocity(v, yaw, -1+self.jump))
			--self.object:setacceleration({x=0, y=-8.4, z=0})

			-- particles
			
			local pos = self.object:getpos() 

			local tex = "heart.png"
			minetest.add_particlespawner({
				amount = 10,
				time = 1,
				minpos = {x=pos.x - 2, y=pos.y - 2, z=pos.z - 2},
				maxpos = {x=pos.x + 2, y=pos.y + 2, z=pos.z + 2},
				minvel = {x=-1, y=-1, z=-1},
				maxvel = {x=1, y=1, z=1},
				minacc = {x=-1, y=-1, z=-1},
				maxacc = {x=1, y=1, z=1},
				minexptime = 1,
				maxexptime = 5,
				minsize = 1,
				maxsize = 2,
				collisiondetection = true,
				vertical = false,
				texture = tex
			})
		else
			if dtime % 1000 == 0 then
				self.object:setvelocity({math.random(-2, 2), math.random(-2, 2), math.random(-2, 2)})
			end
		end
	end,
})

--items

minetest.register_craftitem("space_vehicles:car", {
	description = "Car",
	inventory_image = "[inventorycube{space_vehicles_metal.png{space_vehicles_wheel.png{space_vehicles_metal_front.png",

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.add_entity(pointed_thing.above, "space_vehicles:car")
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})

minetest.register_craftitem("space_vehicles:spaceslider", {
	description = "Spaceslider",
	inventory_image = "[inventorycube{space_vehicles_metal.png{space_vehicles_metal_front.png{space_vehicles_metal_front.png",

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		minetest.add_entity(pointed_thing.above, "space_vehicles:spaceslider")
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})


minetest.register_craft({
	output = "space_vehicles:car",
	recipe = {
		{"basic:stone", "basic:yellow_stone", "basic:stone"},
		{"basic:yellow_stone", "", "basic:glass"},
		{"basic:stone", "basic:yellow_stone", "basic:stone"},
	},
})

minetest.register_craft({
	output = "space_vehicles:spaceslider",
	recipe = {
		{"basic:stone", "basic:glass", "basic:stone"},
		{"basic:glass", "space_vehicles:car", "basic:glass"},
		{"basic:stone", "basic:glass", "basic:stone"},
	},
})




