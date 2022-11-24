extends RichTextLabel

var Score = 0

func _process(delta):
	text = "Puntaje: "+str(Score)

func Increase():
	Score += 1
	if Score == 5:
		get_parent().PortalLevels = 1
		get_parent().PortalQuantity = 3
		get_parent().PlacePortals()
	elif Score == 10:
		get_parent().PortalLevels = 2
		get_parent().PortalQuantity = 2
		get_parent().PlacePortals()
	elif Score == 15:
		get_parent().PortalLevels = 2
		get_parent().PortalQuantity = 3
		get_parent().PlacePortals()

func Decrease():
	if Score != 0:
		Score -= 1
