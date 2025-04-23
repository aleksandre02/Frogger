extends Control

var game_node = preload("res://scenes/game.tscn")

func _on_menubutton_pressed():
	get_tree().change_scene_to_file("res://scenes/startmenu.tscn")

func _on_restartbutton_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func set_score_label(value):
	$Score.text = "SCORE: " + str(value)

func set_time_label(value):
	$Time.text = "TIME: " + str(value)


func _ready():
	set_time_label(Global.time)
	set_score_label(Global.score)
