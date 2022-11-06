extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass




func _on_Button_pressed():
	get_tree().change_scene("res://juego_figuras/Map/Initial_Map.tscn")



func _on_Button2_pressed():
	get_tree().change_scene("res://juego_operacionesmentales/Scenes/Mundo.tscn")


func _on_Button3_pressed():
	get_tree().change_scene("res://juego_longitudes/Mundo.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
