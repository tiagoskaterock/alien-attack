extends Area2D


@export var speed : float = 1500


func _process(delta):
	position.x += speed * delta
