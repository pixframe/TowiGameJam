extends Node2D

onready var TextLabel = get_node("ShootPos/ProjectileValue") #Get label text node

var RotSpeed = 0
export var MaxRotSpeed = 50
export var Acceleration = 100
export var Drag = 7
var Rotation = 0


func _process(delta):
	if Input.is_action_pressed("Rot_Left"):
		RotSpeed = lerp(RotSpeed,MaxRotSpeed,Acceleration*delta) #interpolate acceleration
		Rotation += -RotSpeed * delta
		
	if Input.is_action_pressed("Rot_Right"):
		RotSpeed = lerp(RotSpeed,MaxRotSpeed,Acceleration*delta)
		Rotation += RotSpeed * delta

	#No button is being pressed
	if not (Input.is_action_pressed("Rot_Right") or Input.is_action_pressed("Rot_Left")): 
		RotSpeed = 0
	
	rotate(Rotation*delta)
	
	Rotation = lerp(Rotation,0,Drag*delta)
	
	TextLabel.set_rotation(-global_rotation)
	
	
	
	
	
	
	
