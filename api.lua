-- functions to handle upgrades (can be overridden)
chisel = {}
-- called on chisel_inv_add_item, chisel_inv_remove_item and save_chisel_inv_itemstack (called on on_move, on_put and on_take)
function chisel.on_change_chisel_inv(chiselstack, chiselinv)
	return chiselstack, chiselinv
end

-- called on open chisel
function chisel.on_open_chisel(chiselstack, chiselinv, player)
	return chiselstack, chiselinv, player
end

-- called on close chisel
function chisel.on_close_chisel(player, fields, name, formname, sound)
	return player, fields, name, formname, sound
end

-- called before open chisel
function chisel.before_open_chisel(itemstack, user, width, height, sound)
	return itemstack, user, width, height, sound
end

-- called on use chisel
function chisel.on_use_chisel(itemstack, user, pointed_thing)
	return itemstack, user, pointed_thing
end

-- called on drop chisel
function chisel.on_drop_chisel(itemstack, dropper, pos)
	minetest.item_drop(itemstack, dropper, pos)
	return itemstack, dropper, pos
end




function chisel.chisel_inv_add_item(chiselstack, itemstack)
	local meta = chiselstack:get_meta()
	local invname = meta:get_string("chisel_chisel_identity")
	if not invname then
		return false
	end
	local inv = minetest.create_detached_inventory(invname, {})
	local width = meta:get_int("chisel_width")
	local height = meta:get_int("chisel_height")
	inv:set_size("main", width*height)
	local invmetastring = meta:get_string("chisel_inv_content")
	if invmetastring ~= "" then
		table_to_inv(inv, minetest.deserialize(invmetastring))
		
		chiselstack, inv = chisel.on_change_chisel_inv(chiselstack, inv)
	end
	if inv:room_for_item("main", itemstack) then
		inv:add_item("main", itemstack)
		return save_chisel_inv_itemstack(inv, chiselstack)
	end
	return false
end

function chisel.chisel_inv_remove_item(chiselstack, itemstack)
	local meta = chiselstack:get_meta()
	local invname = meta:get_string("chisel_chisel_identity")
	if not invname then
		return false
	end
	local inv = minetest.create_detached_inventory(invname, {})
	local width = meta:get_int("chisel_width")
	local height = meta:get_int("chisel_height")
	inv:set_size("main", width*height)
	local invmetastring = meta:get_string("chisel_inv_content")
	if invmetastring ~= "" then
		table_to_inv(inv, minetest.deserialize(invmetastring))
		
		chiselstack, inv = chisel.on_change_chisel_inv(chiselstack, inv)
	end
	if inv:contains_item("main", itemstack) then
		inv:remove_item("main", itemstack)
		return save_chisel_inv_itemstack(inv, chiselstack)
	end
	return false
end

function chisel.register_chisel(name, chiseltable)
	minetest.register_craftitem(name, {
		description = chiseltable.description,
		inventory_image = chiseltable.inventory_image,
		groups = {chisel = 1},
		
		on_secondary_use = function(itemstack, user)
			return open_chisel(itemstack, user, chiseltable.width, chiseltable.height, chiseltable.sound_open)
		end,
		on_place = function(itemstack, placer, pointed_thing)
			return open_chisel(itemstack, placer, chiseltable.width, chiseltable.height, chiseltable.sound_open)
		end,
		on_use = function(itemstack, user, pointed_thing)
			return chisel.on_use_chisel(itemstack, user, pointed_thing)
		end,
		on_drop = function(itemstack, dropper, pos)
			return chisel.on_drop_chisel(itemstack, dropper, pos)
		end
	})
	
	minetest.register_on_player_receive_fields(function(player, formname, fields)
		local nisformn = string.find(formname, name.."_C_")
		if nisformn == 1 then
			if fields.quit then
				player, fields, name, formname, sound = chisel.on_close_chisel(player, fields, name, formname, chiseltable.sound_close)
				if chiseltable.sound_close then
					minetest.sound_play(sound, {gain = 0.8, object = player, max_hear_distance = 5})
				end
			end
		end
		return
	end)
end

