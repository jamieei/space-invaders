extends MarginContainer

func _ready() -> void:
	pass

func set_lives(lives: int) -> void:
	#var extra_lives = lives - 1 if lives > 0 else 0
	%Lives.text = str(lives)
