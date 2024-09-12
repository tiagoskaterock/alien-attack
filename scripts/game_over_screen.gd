extends Control


func _on_retry_button_pressed():
	restart_game()
	
	
func restart_game():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
	
func _on_quit_button_pressed():
	quit_game()
	
	
func quit_game():
	get_tree().quit()



