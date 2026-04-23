extends Control

func _draw() -> void:
	var from = Vector2(0.0, size.y)
	var to = Vector2(size.x, size.y)
	draw_line(from, to, Color.GREEN)
