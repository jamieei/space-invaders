extends CanvasLayer

enum State { TITLE, PLAYING, PAUSED, GAME_OVER }

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
				pause_game()
			State.PAUSED:
				unpause_game()
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
	
func pause_game() -> void:
	state = State.PAUSED
	get_tree().paused = true
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED	

func unpause_game() -> void:
	state = State.PLAYING
	get_tree().paused = false

func _on_game_lives_changed(new_value: int) -> void:
	$HUD.set_lives(new_value)
	if new_value <= 0:
		game_over()
