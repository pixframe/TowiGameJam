extends "res://addons/towi_godot/Runtime/TowiGameManager.gd"

func _ready():
	historyIndex = 0
	tutorialText = "Hola. Esto es un tutorial"
	initialText = "Da click al boton para iniciar"
	
	
func ChangeText():
	if historyIndex == 0:
		$Panel/TextoPanel.text = tutorialText
		historyIndex += 1
	elif historyIndex == 1:
		$Panel/TextoPanel.text = initialText
		historyIndex = historyIndex + 1
	elif historyIndex == 2:
		$Panel.visible = false



func TutorialButton():
	ChangeText()
