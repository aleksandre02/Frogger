extends Control


var paused = false


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pause_menu()
#
#func _on_continue_pressed():
	#pause_menu()


func pause_menu():
	if paused:
		self.hide()
		Global.is_paused = false
		
		Engine.time_scale = 1
	else:
		Global.is_paused = true
		
		self.show()
		Engine.time_scale = 0
	paused = !paused

func _process(delta):	
	if Input.is_action_just_pressed("escape_menu"):
		pause_menu()
	
