extends AudioStreamPlayer2D


func _ready():
	$TimerToFinish.start()


func _process(delta):
	pass


func _on_timer_to_finish_timeout():
	queue_free()
