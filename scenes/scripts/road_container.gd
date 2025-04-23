extends Node2D


@onready var terrain_1 = "res://scenes/terrain_1.tscn"
@onready var terrain_2 = "res://scenes/terrain_2.tscn"
@onready var terrain_3 = "res://scenes/terrain_3.tscn"
@onready var terrain_4 = "res://scenes/terrain_4.tscn"
@onready var terrain_5 = "res://scenes/terrain_5.tscn"


var terrain_array 

var new_road_position 

func _ready():
	terrain_array = [terrain_1, terrain_2, terrain_3, terrain_4]
	position = - Vector2(0,48)
	new_road_position = position
	


func spawn_next_terrain():
	var terrain_random_scene = terrain_array.pick_random()
	print(terrain_random_scene)
	var terrain_scene = load(terrain_random_scene)
	var terrain_instance = terrain_scene.instantiate()
	add_child(terrain_instance)
	print(terrain_instance)
	#print(position , terrain_instance.position)
	terrain_instance.position = new_road_position
	new_road_position -= Vector2(0, 64)
