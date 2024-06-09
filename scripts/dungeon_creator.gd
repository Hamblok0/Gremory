extends Node2D

@export var map_size: Vector2i = Vector2(500, 500)
@export var room_max: Vector2i = Vector2(20, 20)
@export var room_min: Vector2i = Vector2(5, 5)

var root_node: Leaf
var tilemap: TileMap

func _ready() -> void:
	tilemap = get_node("../Tiles")
	root_node = Leaf.new(Vector2i(0, 0), Vector2i(60, 30))
	root_node.split(5)
	queue_redraw()
	pass

func _draw() -> void:
	for leaf: Leaf in root_node.get_leaves():
		for x in range(leaf.size.x):
			for y in range(leaf.size.y):
				tilemap.set_cell(0, Vector2i(x + leaf.size.x, y + leaf.size.y), 0, Constants.atlas.floor1)
	pass

