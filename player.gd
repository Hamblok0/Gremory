extends Node2D

class_name Player

@onready var grid_move: GridMove = $GridMove

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(7, 0) * Constants.TILE_SIZE	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_movement()	

func handle_movement() -> void:
	var pos: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("player_up"):
		pos.y -= 1
	if Input.is_action_pressed("player_down"):
		pos.y += 1
	if Input.is_action_pressed("player_left"):
		pos.x -= 1
	if Input.is_action_pressed("player_right"):
		pos.x += 1
	if Input.is_action_pressed("player_upright"):
		pos.y -= 1
		pos.x += 1
	if Input.is_action_pressed("player_upleft"):
		pos.y -= 1
		pos.x -= 1
	if Input.is_action_pressed("player_downleft"):
		pos.y += 1
		pos.x -= 1
	if Input.is_action_pressed("player_downright"):
		pos.y += 1
		pos.x += 1

	if pos != Vector2.ZERO:
		grid_move.move(pos)
	

