extends Node2D

var score : int = 0
var lives = 3


func _ready():
	$PlayerStart.position = $Player.position
	

func add_points(points) -> void :
	score += points
	update_score_on_hud()
	
	
	
func get_score() -> int:
	return score
	
	
	
func update_score_on_hud() -> void:
	$UI/Hud.update_score(get_score())
	
	
	
func get_lives() -> int:
	return lives
	
	
	
func update_lives_on_hud() -> void:
	$UI/Hud.update_lives(get_lives())
	
	
func set_lives(new_lives) -> void:
	lives = new_lives
	update_lives_on_hud()
	
	
func lose_life():
	set_lives(get_lives() - 1)
	
	
	
