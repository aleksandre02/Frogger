extends Node2D


@onready var frog_node = $frog
@onready var spawn_position_node = $spawnPosition
@onready var terrain_spawn_point = $terrain_spawn_first
@onready var road_container_node = $road_container
@onready var hud_node = $Node2D/Hud
@onready var score_marker_node = $score_marker

var terrain_array 
var frog_position_y
var frog_position_x
var rng = RandomNumberGenerator.new()

var frog_entered:bool = false

func save_score(value):
	if load_score() < value:
		var save = FileAccess.open("user://score.save", FileAccess.WRITE)
		save.store_var(value)

func load_score():
	if FileAccess.file_exists("user://score.save"):
		var save = FileAccess.open("user://score.save", FileAccess.READ)
		return save.get_var()
	return 0

func _ready():
	Global.time = 0
	Global.score = 0
	score_marker_node.can_kill = false
	frog_node.global_position = spawn_position_node.global_position
	if !FileAccess.file_exists("user://score.save"):
		var save = FileAccess.open("user://score.save", FileAccess.WRITE)
		save.store_var(0)

func _on_water_body_entered(body):
	frog_node.global_position = spawn_position_node.global_position

func _process(delta):
	hud_node.position.y = frog_node.position.y -110
	hud_node.set_time_label(Global.time)
	hud_node.set_score_label(Global.score)
	
	var screen_size = get_viewport_rect().size
	frog_position_y = frog_node.global_position.y
	frog_position_x = frog_node.global_position.x
	
	if frog_node.global_position.x < 7 :
		frog_node.global_position =Vector2(230,frog_position_y)
		
	elif frog_node.global_position.x >238:	
		frog_node.global_position =Vector2(7,frog_position_y)
		
	if frog_node.global_position.y >= 104:
		frog_node.global_position = spawn_position_node.global_position

func generate_terrain():
	var terrain_random_scene = terrain_array.pick_random()
	var terrain_scene = load(terrain_random_scene)
	var terrain_instance = terrain_scene.instantiate()
	road_container_node.add_child(terrain_instance)
	terrain_instance.global_position.y = terrain_spawn_point.global_position.y

func _on_timer_timeout():
	Global.time += 1

func _on_score_marker_body_entered(body):
		Global.score += 10
		score_marker_node.position.y -= 16

func _on_frog_frog_die():
	save_score(Global.score)
