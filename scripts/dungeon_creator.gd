extends Node2D

@export var map_size: Vector2i = Vector2(500, 500)
@export var room_max: Vector2i = Vector2(20, 20)
@export var room_min: Vector2i = Vector2(5, 5)

var root_node: Leaf
var tilemap: TileMap

func _ready() -> void:
	tilemap = get_node("../Tiles")
	root_node = Leaf.new(Vector2i(0, 0), Vector2i(150, 150))
	root_node.split(5)
	queue_redraw()
	pass

func _draw() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()

	for leaf: Leaf in root_node.get_leaves():
		var padding: Vector4i = Vector4i(
			rng.randi_range(2,3),
			rng.randi_range(2,3),
			rng.randi_range(2,3),
			rng.randi_range(2,3)
		)
		draw_rect(
            Rect2(
                leaf.position.x * Constants.TILE_SIZE,
                leaf.position.y * Constants.TILE_SIZE,
                leaf.size.x * Constants.TILE_SIZE,
                leaf.size.y * Constants.TILE_SIZE
            ), 
            Color.GREEN, # colour
            false # is filled
        )
		
		for x in range(leaf.size.x):
			for y in range(leaf.size.y):
				if not is_inside_padding(x, y, leaf, padding):
					tilemap.set_cell(0, Vector2i(x + (leaf.position.x), y + leaf.position.y), 0, Constants.atlas.floor1)
	pass

func is_inside_padding(x: int, y: int, leaf: Leaf, padding: Vector4i) -> bool:
	return x <= padding.x or y <= padding.y or x >= leaf.size.x - padding.z or y >= leaf.size.y - padding.w