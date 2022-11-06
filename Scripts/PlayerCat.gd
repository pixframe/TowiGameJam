extends KinematicBody2D

export var speed = 4.0
const SIZE_OF_SQUARE_MAP = 16 

onready var animation_tree = $AnimationTree
onready var animationPlayer = animation_tree.get("parameters/playback")

onready var ray = $RayCast2D

var initial_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var movement = false

var zero_to_one_value =0.0
var score = 0
func _ready():
	initial_position = position

func _physics_process(delta):
	
	if movement == false:
		read_direction()
	elif input_direction != Vector2.ZERO:
		animationPlayer.travel("Walk")
		move(delta)
	else:
		animationPlayer.travel("Idle")
		movement =false
	
func read_direction():
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if input_direction.x ==0:
		input_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	if input_direction != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_direction)
		animation_tree.set("parameters/Walk/blend_position", input_direction)
		initial_position =position
		movement = true
	else:
		animationPlayer.travel("Idle")

func move(delta):
	if score == 6:
		get_tree().change_scene("res://Map/WinMap.tscn")
	var desired_step : Vector2 = input_direction * SIZE_OF_SQUARE_MAP /2
	ray.cast_to = desired_step
	ray.force_raycast_update()
	if !ray.is_colliding():
		zero_to_one_value += delta *speed
		if zero_to_one_value >=1.0 :
			position = initial_position + input_direction * SIZE_OF_SQUARE_MAP
			zero_to_one_value = 0.0
			movement = false
		else:
			position =initial_position + (input_direction * SIZE_OF_SQUARE_MAP * zero_to_one_value)
	else:
		movement = false






func _on_Circulo_body_entered(body):
	score +=1
	
	print(score)

func _on_Rectangulo_body_entered(body):
	score +=1
	
	print(score)
