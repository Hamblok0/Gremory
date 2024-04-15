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
    "opened_door": Vector2i(14, 2)
}