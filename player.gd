extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	# https://share.google/aimode/4PBrq3SKs9GNv1ROZ
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed if direction else move_toward(velocity.x, 0, speed)
	move_and_slide()
