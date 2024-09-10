extends Area2D

class_name Enemy

const MIN_SPEED : float = 300.0
const MAX_SPEED : float = 700.0
const ENEMY_DISTANCE_FROM_BORDER : int = 50
var speed : float


func _ready():
	set_speed(randf_range(100, 500))
	position.x = DisplayServer.screen_get_size().x + ENEMY_DISTANCE_FROM_BORDER
	position.y = randi_range(ENEMY_DISTANCE_FROM_BORDER, DisplayServer.screen_get_size().y - ENEMY_DISTANCE_FROM_BORDER)	


func _process(delta):
	if position.x < -50:
		queue_free()
	position.x -= speed * delta


func set_speed(new_speed : float) -> void:
	speed = new_speed
	

func die():
	queue_free()


func _on_body_entered(body):
	if body is Player:
		body.die()
