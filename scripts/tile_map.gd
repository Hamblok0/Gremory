extends TileMap

@export var map_size: Vector2 = Vector2(500, 500)
@export var room_max: Vector2 = Vector2(20, 20)
@export var room_min: Vector2 = Vector2(5, 5)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate_dungeon() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()

	self.clear()

