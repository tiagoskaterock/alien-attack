extends Node2D

var score : int = 0


func _ready():
	hide_game_over_screen()
	update_lives_on_hud()
	update_score_on_hud()
	$PlayerStart.position = $Player.position
	

func add_points(points) -> void :
	score += points
	update_score_on_hud()
	
	
	
func get_score() -> int:
	return score
	
	
	
func update_score_on_hud() -> void:
	$UI/Hud.update_score(get_score())
	
	
func update_score_on_game_over_screen():
	$UI/GameOverScreen/Panel/LabelScoreLabel.text = str(get_score())
	
	
func get_lives() -> int:
	var lives = get_node('Player').get_lives()
	return lives
	
	
	
func update_lives_on_hud() -> void:
	$UI/Hud.update_lives(get_lives())
	


func hide_game_over_screen() -> void:
	get_node('UI/GameOverScreen').visible = false
	
	
func show_game_over_screen() -> void:
	get_node('UI/GameOverScreen').visible = true
	
	
func game_over():
	show_game_over_screen()
	update_score_on_game_over_screen()
	
