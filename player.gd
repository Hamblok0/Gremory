extends Node2D

class_name Player

var pos: Vector2i = Vector2i(7, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_movement()	

func handle_movement() -> void:
	if Input.is_action_pressed("player_up"):
		pos.y += 1
	if Input.is_action_pressed("player_down"):
		pos.y -= 1
	if Input.is_action_pressed("player_left"):
		pos.x -= 1
	if Input.is_action_pressed("player_right"):
		pos.x += 1
	if Input.is_action_pressed("player_upright"):
		pos.y += 1
		pos.x += 1
	if Input.is_action_pressed("player_upleft"):
		pos.y += 1
		pos.x -= 1
	if Input.is_action_pressed("player_downleft"):
		pos.y -= 1
		pos.x -= 1
	if Input.is_action_pressed("player_downright"):
		pos.y -= 1
		pos.x += 1




