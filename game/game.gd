extends Control

signal score_changed(new_value: int)
signal lives_changed(new_value: int)

var score: int
var lives: int

func _ready() -> void:
	pass

func new_game(game_config: GameConfig) -> void:
	_update_score(0)
	_update_lives(3)
	%Player.start(game_config)
	
func game_over() -> void:
	pass
	
func _draw() -> void:
	var from = Vector2(0.0, size.y)
	var to = Vector2(size.x, size.y)
	draw_line(from, to, Color.GREEN, 1.0)

func _on_player_died():
	_update_lives(lives - 1)

func _update_score(_score: int) -> void:
	score = _score
	score_changed.emit(score)

func _update_lives(_lives: int) -> void:
	lives = _lives
	lives_changed.emit(lives)
	if lives <= 0:
		game_over()
