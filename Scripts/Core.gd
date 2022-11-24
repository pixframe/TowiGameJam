extends StaticBody2D

onready var TextLabel = get_node("CoreValue") #Get label text node
onready var ShootPos = get_parent().get_node("Rotation/ShootPos")
onready var Score = get_parent().get_node("Core/Score")

export (PackedScene) var PortalScene
export var PortalQuantity = 2
export var PortalLevels = 1
var CoreValue = 0
var PortalList = []
var ValueSet = false



func PlacePortals():
	ValueSet = false
	for i in range(len(PortalList)): #Remove current portals
		if PortalList[i]:
			PortalList[i].queue_free()
	
	PortalList = [] #empty portal list
	
	for j in range(PortalLevels):
		for i in range(PortalQuantity):
			var p = PortalScene.instance()
			owner.add_child(p)
			p.InitRot = (360/PortalQuantity)*i
			p.Size = 0.75
			p.Position = j+1
			p.op = ShootPos.op	
			p.CurrentProjectileValue = ShootPos.value
			
			if j%2 != 0: #change direction
				p.RotDir = -1
				
			PortalList.append(p)
			p.NewVal()
			




func _draw(): #Spawn portals and set projectile initial value
	ShootPos.NewVal()	
	PlacePortals()
		

		
		
func _process(delta):		
	if not ValueSet:
		randomize()
		var ChosenPortal = int(rand_range(0,PortalQuantity * PortalLevels))
		#print(ChosenPortal)
		
		if ShootPos.op == 0:
			#print(str(PortalList[ChosenPortal].value) +"+"+ str(ShootPos.value)) #Show the answer in the console
			CoreValue = PortalList[ChosenPortal].value + ShootPos.value
			TextLabel.bbcode_text = "[center]"+"= "+str(CoreValue)+"[/center]"
		elif ShootPos.op == 1:
			#print(str(PortalList[ChosenPortal].value) +"-"+ str(ShootPos.value)) #Show the answer in the console
			CoreValue = ShootPos.value - PortalList[ChosenPortal].value
			TextLabel.bbcode_text = "[center]"+"= "+str(CoreValue)+"[/center]"
		elif ShootPos.op == 2:
			#print(str(PortalList[ChosenPortal].value) +"*"+ str(ShootPos.value)) #Show the answer in the console
			CoreValue = ShootPos.value * PortalList[ChosenPortal].value
			#print("Mult " + str(CoreValue))
			TextLabel.bbcode_text = "[center]"+"= "+str(CoreValue)+"[/center]"
		
		ValueSet = true

		
	
func Hit(Value):		
	if CoreValue == Value: #Correct value
		
		ValueSet = false
		
		ShootPos.NewVal() #update value of the shooter	
		
		for i in range(len(PortalList)): #for every portal
			PortalList[i].get_node("PortalArea").Collided = false #Reset the collided flag in Operation.gd
			PortalList[i].CurrentProjectileValue = ShootPos.value
			PortalList[i].op = ShootPos.op
			PortalList[i].NewVal() #Call the function to get new values in the portals
		
		
		#print("Correct")
		$Correct.stream.loop = false
		$Correct.play()
		Score.Increase() #increase value of the score label
		return true
		
	else:#Incorrect Value
		
		ValueSet = true
		
		$Timer.start() #wait for the projectile animation to finish to update values and allow shooting again
		$Incorrect.stream.loop = false
		$Incorrect.play()
		#print("Incorrect")
		Score.Decrease() #decrease score
		return false


func _on_Timer_timeout():#update values when timer reaches 0 (animation is done playing)
	
	ValueSet = false
	
	ShootPos.NewVal() #update value of the shooter	
	
	for i in range(len(PortalList)): #for every portal
		PortalList[i].get_node("PortalArea").Collided = false #Reset the collided flag in Operation.gd
		PortalList[i].CurrentProjectileValue = ShootPos.value
		PortalList[i].op = ShootPos.op
		PortalList[i].NewVal() #Call the function to get new values in the portals
		
	
