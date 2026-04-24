extends CanvasLayer

enum State { TITLE, PLAYING, GAME_OVER }

var state: State = State.TITLE
var game_config: GameConfig

func _ready():
	var game_size = _get_game_size()
	game_config = GameConfig.new(game_size)
	%HUD.game_config = game_config
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
	%Game.new_game(game_config)

func game_over() -> void:
	state = State.GAME_OVER
	$GameOver.show()
	
func _on_game_lives_changed(new_value: int) -> void:
	$HUD.set_lives(new_value)
	if new_value <= 0:
		game_over()

func _get_game_size() -> Vector2:
	var gc: MarginContainer = $GameContainer
	var margin_top = gc.get_theme_constant("margin_top")
	var margin_bottom = gc.get_theme_constant("margin_bottom")
	var margin_left = gc.get_theme_constant("margin_left")
	var margin_right = gc.get_theme_constant("margin_right")
	var game_margin_size = \
		Vector2(margin_left + margin_right, margin_top + margin_bottom)
	return gc.size - game_margin_size
