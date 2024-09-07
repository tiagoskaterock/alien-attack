extends Area2D


@export var speed : float = 1500


func _ready():
	play_SFX()


func _process(delta):
	if position.x > DisplayServer.screen_get_size().x + 50:
		queue_free()
	position.x += speed * delta



func play_SFX():
	var sfx = preload("res://scenes/rocket_sfx.tscn").instantiate()
	get_parent().add_child(sfx)


func _on_area_entered(area):
	if area is Enemy:
		area.die()
		play_hit_sfx()
		die()


func die() -> void:
	queue_free()
	
	
func play_hit_sfx():
	var hit = preload("res://scenes/hit_sfx.tscn").instantiate()
	get_parent().add_child(hit)

