extends Area2D


@export var speed : float = 300


func _process(delta):
	if position.x < -50:
		queue_free()
	position.x -= speed * delta


