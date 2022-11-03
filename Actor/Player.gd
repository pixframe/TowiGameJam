extends KinematicBody2D

var velocity = Vector2.ZERO

export var speed = 100
export var gravity = 500
export var jump_force = 350

onready var positionTuki = $Position2D

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
		positionTuki.scale.x = 1
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
		positionTuki.scale.x = -1
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
		
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)
		
	velocity.x = lerp(velocity.x, 0,0.2)
