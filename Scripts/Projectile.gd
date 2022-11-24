extends KinematicBody2D

var Speed = 10
var ProjectileValue = 0
var ProjectileOp = 0
var Direction = Vector2.ZERO
var speed = 100 
var Ignore = false #ignore the collision detection while animation plays



func _physics_process(delta):
	
	var Collision = move_and_collide(Direction*Speed*delta)
	
	if Collision and not Ignore:
		if Collision.collider.name == "Core":
			#print(ProjectileValue)
			if Collision.collider.Hit(ProjectileValue): #if incorrect, ignore 
				queue_free()
			else:
				Ignore = true
				$AnimatedSprite.play()
				



func _on_AnimatedSprite_animation_finished(): #Destroy when animation is done
	queue_free()
