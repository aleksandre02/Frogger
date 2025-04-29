extends Control


func set_time_label(value):
	$time.text = "TIME: " + str(value)
	
func set_score_label(value):
	$score.text = "SCORE: " + str(value)
