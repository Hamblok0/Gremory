extends Node2D

var player_scene: PackedScene = preload("res://scenes/player.tscn")
@onready var canvas_darkness: CanvasModulate = $Darkness

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#canvas_darkness.visible = true
	#spawn_player()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player() -> void:
	var player: Player = player_scene.instantiate()
	player.modulate = Color(0.478, 0, 0.478) 
	add_child(player)
