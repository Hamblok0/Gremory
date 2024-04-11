extends Node2D

class_name GridMove
@export var self_node: Node2D
@export var speed: float = 0.11

var moving: bool = false
@onready var ray_cast: RayCast2D = $RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(direction: Vector2) -> void: 
	if !moving:
		ray_cast.target_position = direction * Constants.TILE_SIZE
		ray_cast.force_raycast_update()
		var collider := ray_cast.get_collider()
		print_debug(collider)

		if !ray_cast.is_colliding():
			moving = true
			var new_pos: Vector2 = self_node.global_position + (direction * Constants.TILE_SIZE)
			var transition: Tween = create_tween()
			transition.tween_property(self_node, "position", new_pos, speed).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
			transition.tween_callback(func() -> void: 
				await get_tree().create_timer(0.1).timeout 
				moving = false)	
	
	