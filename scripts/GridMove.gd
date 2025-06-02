extends Node2D

class_name GridMove
@export var self_node: Node2D
@export var speed: float = 0.11

var moving: bool = false
var target: Vector2 
var new_pos: Vector2 
var map_pos: Vector2 

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var gmap: Map = get_node("../../l1") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(direction: Vector2) -> void: 
	var walls: TileMapLayer = gmap.get_node("Wall")
	if !moving:
		target = direction * Constants.TILE_SIZE	
		new_pos = self_node.global_position + (direction * Constants.TILE_SIZE)
		map_pos = walls.local_to_map(new_pos)
		ray_cast.target_position = target 
		ray_cast.force_raycast_update()
		
		if ray_cast.is_colliding():
			var tile_data: TileData = walls.get_cell_tile_data(map_pos)
			if tile_data:
				var door: Variant = tile_data.get_custom_data("Door")
				if door:
					walls.set_cell(map_pos, 0, Constants.atlas.opened_door)	
					move_tween()	
		else:
			move_tween()	

func move_tween() -> void:
	moving = true
	var transition: Tween = create_tween()
	transition.tween_property(self_node, "position", new_pos, speed).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	transition.tween_callback(func() -> void: 
		self_node.global_position = new_pos
		await get_tree().create_timer(0.1).timeout 
		moving = false)
