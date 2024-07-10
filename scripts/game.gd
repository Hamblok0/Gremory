extends Node2D

var player_scene: PackedScene = preload("res://scenes/player.tscn")
@onready var canvas_darkness: CanvasModulate = $Darkness
@onready var dungeon_creator: DungeonCreator = $DungeonCreator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	canvas_darkness.visible = true
	spawn_player()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var player: Player = player_scene.instantiate()
	var rooms: Array = dungeon_creator.root_node.get_leaves()
	var starting_room: Leaf = rooms[rng.randi_range(0, rooms.size() - 1)]
	var center: Vector2i = starting_room.get_center()

	# For some reason, player position has to be offset by half the tilesize. I suspect the padding in dungeon creator is causing this issue
	# but for now, just gonna use this temporary fix
	player.position = Vector2i((center.x * Constants.TILE_SIZE) + 16, (center.y * Constants.TILE_SIZE) + 16)
	player.modulate = Color(0.478, 0, 0.478) 
	add_child(player)
