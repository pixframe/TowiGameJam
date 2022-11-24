extends Node2D

onready var PortalCollider = get_node("PortalArea")
onready var PortalValue = get_node("PortalArea/PortalValue")

export var Position = 1
export var PositionStep = 1500
var InitRot = 0
export var RotSpeed = 1
var RotDir = 1
var Size = 1
var value = 0
var op = 0
var CurrentProjectileValue = 0

func NewVal():
	if op == 0: 
		randomize()
		value = int(rand_range(0,100))	
	elif op == 1:
		randomize()
		value = int(rand_range(0,CurrentProjectileValue)) #ensure the number is smaller in -
	elif op == 2:
		randomize()
		value = int(rand_range(1,10))
		
	PortalValue.bbcode_text = "[center]"+str(value)+"[/center]"

func _draw():
	rotation_degrees = InitRot

func _process(delta):

	PortalCollider.position = Vector2(0,-Position*PositionStep)
	
	PortalCollider.scale = Vector2(Size,Size)
		
	rotate(RotSpeed*delta*RotDir)
	
	PortalValue.set_rotation(-global_rotation)
