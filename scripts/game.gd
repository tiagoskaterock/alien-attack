extends Node2D

var score : int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_points(points) -> void :
	score += points
	update_score_on_hud()
	
	
func get_score() -> int:
	return score
	
	
func update_score_on_hud():
	$UI/Hud.update_score(get_score())
	
	
