class_name GameConfig

extends RefCounted

## Number of rows in an alien wave
const wave_rows: int = 5
## Number of columns in an alien wave
const wave_cols: int = 11
## Alien wave width as a fraction of the screen width
const wave_width_screen_pct: float = 0.6
## Horizontal space between aliens as a fraction of the screen width
const alien_spacing_width_screen_pct: float = 0.01

## Sprite width in pixels
## @deprecated
const _sprite_width: float = 64.0

## Game size in pixels
var game_size: Vector2
## Alien size in pixels
var alien_size: Vector2
var alien_scale: Vector2
var player_start_position: Vector2
var player_scale: Vector2
## Player size in pixels
var player_size: Vector2

func _init(_game_size: Vector2) -> void:
	game_size = _game_size
	var wave_width: float = game_size.x * wave_width_screen_pct
	var alien_spacing_width: float = game_size.x * alien_spacing_width_screen_pct
	var combined_alien_spacing_width: float = alien_spacing_width * (wave_cols - 1)
	var combined_alien_width: float = wave_width - combined_alien_spacing_width
	var alien_width: float = combined_alien_width / wave_cols
	var scale: float = alien_width / _sprite_width
	alien_scale = Vector2(scale, scale)
	player_scale = alien_scale
	player_start_position = Vector2(0.0, game_size.y - 60)
	player_size = Vector2(_sprite_width * scale, _sprite_width * scale)
