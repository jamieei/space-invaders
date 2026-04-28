class_name GameConfig

extends RefCounted

const alien_rows = 5
const alien_cols = 11
const alien_spacing = 0.3
const alien_margin = 3.0
const sprite_width = 64.0

var game_size: Vector2
var alien_scale: Vector2
var player_start_position: Vector2
var player_scale: Vector2
var player_size: Vector2

func _init(_game_size: Vector2) -> void:
	game_size = _game_size
	var scale = _get_alien_scale(game_size.x)
	alien_scale = Vector2(scale, scale)
	player_scale = alien_scale
	player_start_position = Vector2(0.0, game_size.y - 60)
	player_size = Vector2(sprite_width * scale, sprite_width * scale)
	pass

func _get_alien_scale(game_width: float) -> float:
	var game_width_in_aliens: float = \
		alien_margin * 2 + \
		alien_cols + \
		(alien_cols - 1) * alien_spacing
	var alien_width = game_width / game_width_in_aliens
	return alien_width / sprite_width
