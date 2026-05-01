extends Control

signal score_changed(new_value: int)
signal lives_changed(new_value: int)

var game_config: GameConfig
var score: int
var lives: int
var level: int = 0

func new_game(_game_config: GameConfig) -> void:
	game_config = _game_config
	level = 0
	_update_score(0)
	_update_lives(3)
	_new_level()
	
func _new_level() -> void:
	level = level + 1
	_start_level()
	
func _start_level() -> void:
	%Player.start(game_config)
	
func _game_over() -> void:
	pass
	
func _draw() -> void:
	var from = Vector2(0.0, size.y)
	var to = Vector2(size.x, size.y)
	draw_line(from, to, Color.GREEN, 1.0)

func _on_player_died() -> void:
	_update_lives(lives - 1)
	if lives > 0:
		_start_level()

func _update_score(_score: int) -> void:
	score = _score
	score_changed.emit(score)

func _update_lives(_lives: int) -> void:
	lives = _lives
	lives_changed.emit(lives)
	if lives <= 0:
		_game_over()
