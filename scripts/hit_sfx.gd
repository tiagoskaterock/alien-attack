extends AudioStreamPlayer2D


func _ready():
	play()
	$TimerToFinish.start()


func _on_timer_to_finish_timeout():
	queue_free()
