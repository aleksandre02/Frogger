extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
var speed = 950 

signal frog_die


	


func _process(delta):
	
	
	var direction = Input.get_vector("go_left","go_right",
	"go_up","go_down")
	
	if !Global.is_paused:
		
		if Input.is_action_just_pressed("go_left"):
			self.global_position.x += -16
			animated_sprite.play("move_left")
		elif Input.is_action_just_pressed("go_right"):
			self.global_position.x += 16
			animated_sprite.play("move_right")
		elif Input.is_action_just_pressed("go_down"):
			self.global_position.y += 16
			animated_sprite.play("move_down")
		elif Input.is_action_just_pressed("go_up"):
			self.global_position.y -= 16
			animated_sprite.play("move_up")
		else:
			velocity = Vector2(0,0)
		move_and_slide()
	
	




func _on_area_2d_area_entered(area):
	emit_signal("frog_die")
	if area.can_kill:
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
