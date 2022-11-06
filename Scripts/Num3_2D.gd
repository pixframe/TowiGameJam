extends Area2D



func _on_Num3_2D_body_entered(body):
	queue_free()
	pass
	
	get_tree().change_scene("res://Scenes/Mundo2.tscn")
