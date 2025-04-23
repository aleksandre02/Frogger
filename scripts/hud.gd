extends Control

@onready var score_label = $score


@onready var time_label = $time

var starting_position

func set_time_label(value):
	$time.text = "TIME: " + str(value)
	
func set_score_label(value):
	$score.text = "SCORE: " + str(value)
