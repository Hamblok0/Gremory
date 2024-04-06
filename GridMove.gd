extends Node2D

class_name GridMove
@export var self_node: Node2D
@export var speed: float = 0.35

var moving: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(direction: Vector2) -> void: 
	if !moving:
		moving = true
		var new_pos: Vector2 = self_node.global_position + (direction * Constants.TILE_SIZE)
		var transition: Tween = create_tween()

		transition.tween_property(self_node, "position", new_pos, speed).set_trans(Tween.TRANS_LINEAR)
		transition.tween_callback(func() -> void: moving = false)	
	
	