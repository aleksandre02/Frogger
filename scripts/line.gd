extends Node2D


const TURTLE_SCENE = "res://scenes/turtle.tscn"
const WATER_SCENE = "res://scenes/water.tscn"
const CAR_SCENE = "res://scenes/car.tscn"
const GROUND_SCENE = "res://scenes/ground.tscn"
const CAR_SECOND_SCENE = "res://scenes/carSecond.tscn"

@onready var line_node = $"."
const MAX_TILE_SIZE_X = 15

var is_ground: bool = true
@export var is_water: bool = false
@export var is_left:bool = false
var node_array = []
var rng = RandomNumberGenerator.new()

signal water_created

func _ready():
	for i in MAX_TILE_SIZE_X:
		create_new_node(is_left)

func right_to_left():
	if node_array.size() == MAX_TILE_SIZE_X:
		node_array.pop_front()
		var first_child = get_child(1)
		first_child.queue_free()
		for i in range(0,node_array.size()):
			node_array[i].global_position.x -= 16

func left_to_right():
	if node_array.size() == MAX_TILE_SIZE_X:
		var last_child = node_array.pop_back()
		last_child.queue_free()
		print(last_child)
		for i in range(0,node_array.size()):
			node_array[i].global_position.x += 16

func _on_timer_timeout():
	print(is_left)
	if is_left:
		left_to_right()
		create_new_node(is_left)
		
	else:
		right_to_left()
		create_new_node(is_left)
		
func create_new_node(is_from_left):
	var my_random_number_water = rng.randf_range(1,10)
	var my_random_number_ground = rng.randf_range(1,10)
	var random_number_car = rng.randf_range(1,10)
	var node_scene 
	var node_instance
	if is_water:
		if my_random_number_water>= 5 && my_random_number_water <= 10:
			node_scene = preload(TURTLE_SCENE)
			node_instance = node_scene.instantiate()
			add_child(node_instance)
			node_instance.name = "turtle"
			if is_from_left:	
				node_instance.rotation_degrees = 180
			
			node_instance.can_kill = false
		else:
			node_scene = preload(WATER_SCENE)
			node_instance = node_scene.instantiate()
			add_child(node_instance)
			node_instance.name = "Water"
			if is_from_left:	
				node_instance.rotation_degrees = 180
			
			node_instance.can_kill = true
	else:
		if my_random_number_ground>=9 && my_random_number_ground <= 10:
			if random_number_car>=5 && random_number_car <= 10:
				node_scene = preload(CAR_SCENE)
				node_instance = node_scene.instantiate()
				add_child(node_instance)
				node_instance.name = "car"
				if is_from_left:	
					node_instance.rotation_degrees = 180
				node_instance.can_kill = true
			else:
				node_scene = preload(CAR_SECOND_SCENE)
				node_instance = node_scene.instantiate()
				add_child(node_instance)
				node_instance.name = "car_second"
				if is_from_left:
					node_instance.rotation_degrees = 180				
				node_instance.can_kill = true
		else:
			node_scene = preload(GROUND_SCENE)
			node_instance = node_scene.instantiate()
			add_child(node_instance)
			node_instance.name = "ground"
			node_instance.can_kill = false
	if is_from_left:	
		add_left_to_right(node_instance, node_array)
	else:
		add_right_to_left(node_instance, node_array)

func add_right_to_left(node_instance, node_array):
	node_instance.global_position.x = node_array.size() * (16) +8
	node_instance.global_position.y += 8
	node_array.append(node_instance)
		
func add_left_to_right(node_instance, node_array):
	node_instance.global_position.x = node_array.size() * (-16) + ((MAX_TILE_SIZE_X-1)*16) +8
	node_instance.global_position.y += 8
	node_array.insert(0, node_instance)

