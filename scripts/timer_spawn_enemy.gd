extends Timer

const MIN_WAIT_TIME_IN_SECONDS : int = 1
const MAX_WAIT_TIME_IN_SECONDS : int = 1


func _ready():
	randomize()
	_set_random_wait_time()


func _set_random_wait_time():
	wait_time = randi_range(MIN_WAIT_TIME_IN_SECONDS, MAX_WAIT_TIME_IN_SECONDS)
	start()


func _on_timeout():
	spawn_enemy()
	_set_random_wait_time()


func spawn_enemy():
	var enemy = preload("res://scenes/enemy.tscn").instantiate()
	get_parent().add_child(enemy)
	
