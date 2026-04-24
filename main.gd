extends CanvasLayer

enum State { TITLE, PLAYING, GAME_OVER }

var state: State = State.TITLE

func _ready():
	$Title.show()
	$GameContainer.hide()
	$GameOver.hide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		match state:
			State.TITLE, State.GAME_OVER:
				new_game()
			_:
				pass
	elif event.is_action_pressed("ui_cancel"):
		match state:
			State.PLAYING:
				pass
			_:
				get_tree().quit()
	
func new_game() -> void:
	state = State.PLAYING
	$Title.hide()
	$GameContainer.show()
	$GameOver.hide()
	%Game.new_game()

func game_over() -> void:
	state = State.GAME_OVER
	$GameOver.show()
	
func _on_game_lives_changed(new_value: int) -> void:
	$HUD.set_lives(new_value)
	if new_value <= 0:
		game_over()
