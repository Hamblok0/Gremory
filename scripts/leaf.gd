extends Node

class_name Leaf

var left: Leaf
var right: Leaf
var position: Vector2i
var size: Vector2i

func _init(position: Vector2i, size: Vector2i) -> void:
	self.position = position
	self.size = size


func get_leaves() -> Array:
	if not (self.left && self.right):
		return [self] 
	else:
		return left.get_leaves() + right.get_leaves()

func split(remaining: int, paths: Array) -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	var split_percent: float = rng.randf_range(0.3, 0.7)
	var split_horiz: bool = size.y >= size.x

	if (split_horiz):
		var left_height: int = int(size.y * split_percent)
		left = Leaf.new(
			position,
			Vector2i(size.x, left_height)
		)
		right = Leaf.new(
			Vector2i(position.x, position.y + left_height),
			Vector2i(size.x, size.y - left_height)
		)
	else:
		var left_width: int = int(size.x * split_percent)
		left = Leaf.new(position, Vector2i(left_width, size.y))
		right = Leaf.new(
			Vector2i(position.x + left_width, position.y),
			Vector2i(size.x - left_width, size.y)
		)

	paths.push_back({'left': left.get_center(), 'right': right.get_center()})

	if (remaining > 0):
		left.split(remaining - 1, paths)
		right.split(remaining - 1, paths)
	pass

func get_center() -> Vector2i:
	return Vector2i(position.x + size.x / 2, position.y + size.y / 2)
