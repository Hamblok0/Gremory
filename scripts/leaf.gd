extends Node

class_name Leaf

var left: Leaf
var right: Leaf
var position: Vector2
var size: Vector2

func _init(position: Vector2, size: Vector2) -> void:
    self.position = position
    self.size = size


func get_leaves() -> Array:
    if not (self.left && self.right):
        return [self] 
    else:
        return left.get_leaves() + right.get_leaves()