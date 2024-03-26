extends Node2D

var player: PackedScene = preload("res://player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player() -> void:
	var new_player: Player = player.instantiate()
	var tilemap: TileMap = $Tiles

	add_child(new_player)	
	tilemap.set_cell(4, Vector2i(7, 0), 0, Vector2i(1, 3))
	
