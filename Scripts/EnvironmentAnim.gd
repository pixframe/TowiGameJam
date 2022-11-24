extends CenterContainer

export var CloudRotSpeed = 0.05


func _process(delta):
	$Clouds.rotate(delta*CloudRotSpeed)	

	for i in range($Fondo.get_child_count()):
		randomize()
		
		var dim = rand_range(0,1)
		
		$Fondo.get_child(i).modulate.a = lerp($Fondo.get_child(i).modulate.a,dim,delta*5)
		
	
