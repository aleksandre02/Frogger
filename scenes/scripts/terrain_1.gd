extends Node2D

@onready var timer_1 = $groundline/Line/Timer
@onready var timer_2 = $groundline2/Line/Timer
@onready var timer_3 = $waterline/Line/Timer
@onready var timer_4 = $groundline3/Line/Timer


var flag:bool = true
var frog_entered = false
var area_entered:bool = false

func _on_area_2d_body_entered(body):
	if !frog_entered:
		frog_entered = true
		get_parent().spawn_next_terrain()
	print(body)
