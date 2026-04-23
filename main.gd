extends CanvasLayer

func _ready() -> void:
	$Title.show()
	$GameContainer.hide()
	$GameOver.hide()
	
func _input(event: InputEvent) -> void:
	var is_playing = %Game.is_playing()
	if event.is_action_pressed("ui_accept") && !is_playing:
		new_game()
	elif event.is_action_pressed("ui_cancel"):
		if is_playing:
			pause_game()
		else:
			get_tree().quit()
	
func new_game() -> void:
	$Title.hide()
	$GameContainer.show()
	$GameOver.hide()
	%Game.new_game()

func game_over() -> void:
	$GameOver.show()
	
func pause_game() -> void:
	print("pause...")

func _on_game_lives_changed(new_value: int) -> void:
	$HUD.set_lives(new_value)
	if new_value <= 0:
		game_over()
