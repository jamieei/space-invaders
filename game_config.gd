class_name GameConfig

extends RefCounted

const alien_rows = 5
const alien_cols = 11
const alien_spacing = 0.3
const alien_margin = 3.0
const alien_sprite_width = 64.0

var game_size: Vector2
var alien_scale: float

func _init(_game_size: Vector2) -> void:
	game_size = _game_size
	alien_scale = _get_alien_scale(game_size.x)

func _get_alien_scale(game_width: float) -> float:
	var game_width_in_aliens: float = \
		alien_margin * 2 + \
		alien_cols + \
		(alien_cols - 1) * alien_spacing
	var alien_width = game_width / game_width_in_aliens
	return alien_width / alien_sprite_width
