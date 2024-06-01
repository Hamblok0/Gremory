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