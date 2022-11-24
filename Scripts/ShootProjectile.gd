extends Node2D

onready var TextLabel = get_node("ProjectileValue") #Get label text node

export (PackedScene) var Projectile
export var ProjectileSpeed = 100
export var ProjectileScale = 1
var CanShoot = true
var value = 0
var op = 0 # 0->+ 1->- 2->* 3->/    Set the operation that will be performed


func NewVal():
	randomize()
	op = int(rand_range(0,3)) #decide operation
	#print(op)
	if op == 0:
		randomize()
		value = int(rand_range(0,100))
		TextLabel.bbcode_text = "[center]"+str(value)+" + ?"+"[/center]"
	elif op == 1:
		randomize()
		value = int(rand_range(10,100))
		TextLabel.bbcode_text = "[center]"+str(value)+" - ?"+"[/center]"
	elif op == 2:
		randomize()
		value = int(rand_range(0,10))
		TextLabel.bbcode_text = "[center]"+str(value)+" * ?"+"[/center]"
	CanShoot = true




func _process(delta):		
	if Input.is_action_just_pressed("Shoot") and CanShoot:
		var p = Projectile.instance()
		owner.add_child(p)
		p.global_position = global_position
		
		p.global_rotation_degrees = global_rotation_degrees - 180 #set rotation of the projectile		
		 #Get vector from the ship to the center of the scene
		p.Direction = (get_parent().global_position - global_position).normalized()
		
		p.Speed = ProjectileSpeed
		
		p.scale = Vector2(ProjectileScale,ProjectileScale)
	
		p.ProjectileValue = value
		p.ProjectileOp = op
		
		CanShoot = false
