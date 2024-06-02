extends Node2D

@export var map_size: Vector2i = Vector2(500, 500)
@export var room_max: Vector2i = Vector2(20, 20)
@export var room_min: Vector2i = Vector2(5, 5)

var root_node: Leaf

func _ready() -> void:
	root_node = Leaf.new(Vector2i(0, 0), Vector2i(60, 30))
	queue_redraw()
	pass

func _draw() -> void:
	for leaf: Leaf in root_node.get_leaves():
		draw_rect(
			Rect2(
				leaf.position.x * Constants.TILE_SIZE,
				leaf.position.y * Constants.TILE_SIZE,
				leaf.size.x * Constants.TILE_SIZE,
				leaf.size.y * Constants.TILE_SIZE
			),
			Color.GREEN,
			false
		)
	pass

