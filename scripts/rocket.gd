extends Area2D


@export var speed : float = 1500


func _process(delta):
	if position.x > DisplayServer.screen_get_size().x + 50:
		queue_free()
	position.x += speed * delta


