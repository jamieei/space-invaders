extends CharacterBody2D

@export var speed: float = 400.0

var game_config: GameConfig

func _physics_process(_delta: float) -> void:
	# https://share.google/aimode/4PBrq3SKs9GNv1ROZ
	var direction: float = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed if direction else move_toward(velocity.x, 0.0, speed)
	move_and_slide()
	if game_config:
		position.x = clamp(position.x, 0.0, \
			game_config.game_size.x - game_config.player_size.x)

func start(gc: GameConfig) -> void:
	self.game_config = gc
	position = gc.player_start_position
	scale = gc.player_scale
	show()
	$CollisionShape2D.disabled = false
