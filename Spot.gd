extends Area2D

var occupied = false

func _on_Spot_body_entered(body):
	if body.is_in_group("star"):
		occupied = true

func _on_Spot_body_exited(body):
	if body.is_in_group("star"):
		occupied = false
