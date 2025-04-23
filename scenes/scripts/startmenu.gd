extends Control

var game_node = preload("res://scenes/game.tscn")

func _on_exitbutton_pressed():
	get_tree().quit()


func _on_playbutton_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func set_high_score_label(value):
	$highscore.text = "HIGH SCORE: " + str(value)

func _ready():
	var game_instance = game_node.instantiate()
	var score = game_instance.load_score()
	set_high_score_label(score)

