extends Area2D




func _on_Num5_2D_body_entered(body):
	queue_free()
	get_tree().change_scene("res://Scenes/Mundo5.tscn")
	pass # Replace with function body.
