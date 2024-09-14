extends Path2D

@onready var path_follow = $PathFollow2D
@onready var enemy = $PathFollow2D/Enemy

func _ready():
	return
	path_follow.set_progress_ratio(1)  # Começa no início do caminho
	
func _process(delta):
	print(path_follow.progress_ratio)
#	path_follow.progress_ratio -= 0.05 * delta
	path_follow.progress_ratio += .20 * delta
