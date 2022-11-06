extends KinematicBody2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

export var move_speed : =  250.0
export var push_speed : = 125.0

func _physics_process(delta: float) -> void:
	var motion : = Vector2()
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	update_animation(motion)
	move_and_slide(motion.normalized() * move_speed, Vector2())
	if get_slide_count()>0:
		check_star_collision(motion)
	
func update_animation(motion: Vector2) ->void:
	var animation : = "siempre"
	
	if motion.x > 0:
		animation = "Siempre"
	elif motion.x < 0:
		animation = "Siempre"
	elif motion.y > 0:
		animation = "Siempre"
	elif motion.y < 0:
		animation = "Siempre"
		
	if animated_sprite.animation != animation:
		animated_sprite.play(animation)
	
func check_star_collision(motion : Vector2)->void:
	if abs(motion.x) + abs(motion.y) >1:
		return
	var estrella := get_slide_collision(0).collider as Star
	if estrella:
		estrella.push(push_speed*motion)
