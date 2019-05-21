local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node("chisel:dirt_bricks", {
	description = S("Dirt Bricks"),
	tiles = {"chisel_dirt_bricks.png"},
	groups = {cracky=3, stone=1}
})

minetest.register_node("chisel:dirt_wih_dirt_bricks", {
	description = S("Dirt with Dirt Bricks"),
	tiles = {"chisel_dirt_bricks_top.png", "chisel_dirt_dirt_with_bricks.png"},
	groups = {cracky=3, stone=1}
})

minetest.register_node("chisel:dirt_chunky", {
	description = S("Chunky Dirt"),
	tiles = {"chisel_dirt_chunky.png"},
	groups = {cracky=3, stone=1}
})

minetest.register_node("chisel:dirt_cobble", {
	description = S("Cobble Dirt"),
	tiles = {"chisel_dirt_cobble.png"},
	groups = {cracky=3, stone=1}
})