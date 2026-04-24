extends Control

signal lives_changed(new_value: int)

@export var alien_rows: int = 5
@export var alien_columns: int = 11

var lives: int = 3

func new_game() -> void:
	lives = 3
	lives_changed.emit(lives)
	$FakeDeathTimer.start()
	
func game_over() -> void:
	$FakeDeathTimer.stop()
	
func _draw() -> void:
	var from = Vector2(0.0, size.y)
	var to = Vector2(size.x, size.y)
	draw_line(from, to, Color.GREEN, 1.0)

func _on_player_died():
	lives = lives - 1
	lives_changed.emit(lives)
	if lives <= 0:
		game_over()
