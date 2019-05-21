
local function get_formspec(name, width, height)
	local sizewidth = 8
	local txpos = (sizewidth-width)/2
	if width >= 8 then
		sizewidth = width
		txpos = 0
	end
	local chisel_formspec =
		"size[".. sizewidth ..",".. height+5 .."]" ..
		default.gui_bg ..
		default.gui_bg_img ..
		default.gui_slots ..
		"list[detached:"..name..";main;".. txpos ..",0;".. width ..",".. height ..";]"..
		"list[current_player;main;".. (sizewidth-8)/2 ..",".. height+0.85 ..";8,1;]" ..
		"list[current_player;main;".. (sizewidth-8)/2 ..",".. height+2.08 ..";8,3;8]" ..
		"listring[detached:"..name..";main]"..
		"listring[current_player;main]" ..
		default.get_hotbar_bg((sizewidth-8)/2,height+0.85)
	return chisel_formspec
end

local function inv_to_table(inv)
	local t = {}
	for listname, list in pairs(inv:get_lists()) do
		local size = inv:get_size(listname)
		if size then
			t[listname] = {}
			for i = 1, size, 1 do
				t[listname][i] = inv:get_stack(listname, i):to_table()
			end
		end
	end
	return t
end

local function table_to_inv(inv, t)
	for listname, list in pairs(t) do
		for i, stack in pairs(list) do
			inv:set_stack(listname, i, stack)
		end
	end
end




chisel.register_chisel("chisel:iron_chisel", { 
	description = "Iron Chisel",
	inventory_image = "chisel_iron.png",
	width = 8,
	height = 4,
	sound_open = "chisel_open_chisel",
	sound_close = "chisel_close_chisel"
})



