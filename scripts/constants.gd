extends Node

const TILE_SIZE: int = 32

const layers: Dictionary = {
	"floor": 0,
	"wall": 1,
	"water": 2,
	"fire": 3,
	"player": 4
}

const atlas: Dictionary = {
	"wall1": Vector2i(0, 2),
	"wall2": Vector2i(1, 2),
	"floor1": Vector2i(8, 2),
	"closed_door": Vector2i(13, 2), 
    "opened_door": Vector2i(14, 2)
}