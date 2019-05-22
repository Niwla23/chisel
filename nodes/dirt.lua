local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node("chisel:dirt_bricks", {
	description = S("Dirt Bricks"),
	tiles = {"chisel_dirt_bricks.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("chisel:dirt_wih_dirt_bricks", {
	description = S("Dirt with Dirt Bricks"),
	tiles = {"chisel_dirt_bricks_top.png", "chisel_dirt_dirt_with_bricks.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("chisel:dirt_chunky", {
	description = S("Chunky Dirt"),
	tiles = {"chisel_dirt_chunky.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("chisel:dirt_cobble", {
	description = S("Cobble Dirt"),
	tiles = {"chisel_dirt_cobble.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("chisel:dirt_happy", {
	description = S("Happy Dirt"),
	tiles = {"chisel_dirt_happy.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("chisel:dirt_hor", {
	description = S("Hor Dirt"),
	tiles = {"chisel_dirt_hor_top.png", "chisel_dirt_hor.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("chisel:dirt_layer", {
	description = S("Layered Dirt"),
	tiles = {"chisel_dirt_layers.png"},
    groups = {cracky=3, stone=1},
    sounds = default.node_sound_dirt_defaults(),

})

minetest.register_node("chisel:dirt_plate", {
	description = S("Dirt late"),
	tiles = {"chisel_dirt_plate.png"},
    groups = {cracky=3, stone=1},
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox1
        },
    },
sounds = default.node_sound_dirt_defaults(),
})

