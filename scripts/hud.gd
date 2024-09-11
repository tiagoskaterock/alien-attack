extends Control
	
	
func update_score(new_score):
	$ScoreLabel.text = "Score: " + str(new_score)
	
	
func update_lives(new_lives):
	$LivesLabel.text = "X " + str(new_lives)
