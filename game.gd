extends Node2D

var player_scene: PackedScene = preload("res://player.tscn")
const layers: Dictionary = {
	"floor": 0,
	"wall": 1,
	"water": 2,
	"fire": 3,
	"player": 4
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player() -> void:
	var player: Player = player_scene.instantiate()
	add_child(player)	
	
