extends Area2D




func _on_Area2D_body_entered(body):
	queue_free()
	pass # Replace with function body.
	get_tree().change_scene("res://Scenes/Mundo4.tscn")
