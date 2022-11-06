extends LineEdit

func _ready():
	grab_focus()
	set_cursor_position(len(text))

func _on_LineEdit_text_entered(new_text):
	if new_text == "5":
		get_tree().change_scene("res://Mundo3.tscn")
	else:
		pass
 # Replace with function body.
