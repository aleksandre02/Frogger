extends Node2D


var frog_entered = false

func _on_area_2d_body_entered(body):
	if !frog_entered:
		frog_entered = true
		get_parent().spawn_next_terrain()
