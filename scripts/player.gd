extends Node2D

class_name Player

@onready var grid_move: GridMove = $GridMove
@onready var tiles: TileMap = get_node("../Tiles") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_movement()	

func starting_pos(pos: Vector2i) -> void:
	return tiles.map_to_local(Vector2i(7, 0)) 

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

	

