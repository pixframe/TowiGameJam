extends Node2D

var game_end = false

func _process(delta):
	if game_end == false:
		var spots = $Spots.get_child_count()
		print(spots)
		for i in $Spots.get_children():
			if i.occupied:
				print(spots)
				spots -=1
				
		if spots == 0:
			game_end = true
			print(spots)
			
		if game_end == true:
			get_tree().change_scene("res://Respuesta2.tscn")
