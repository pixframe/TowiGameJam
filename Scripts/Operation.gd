extends Area2D

onready var PortalRotation = get_parent()

var PrevCollision = 0
var Collided = false

func _process(delta):	
	var collision = get_overlapping_bodies()
	if collision and not Collided: #avoid repetition
		if collision[0].ProjectileOp == 0: #sum
			collision[0].ProjectileValue = collision[0].ProjectileValue + PortalRotation.value
		elif collision[0].ProjectileOp == 1: #diff
			collision[0].ProjectileValue = collision[0].ProjectileValue - PortalRotation.value
		elif collision[0].ProjectileOp == 2: #mult
			collision[0].ProjectileValue = collision[0].ProjectileValue * PortalRotation.value
		$SoundFX.stream.loop = false
		$SoundFX.play()
		
		Collided = true
