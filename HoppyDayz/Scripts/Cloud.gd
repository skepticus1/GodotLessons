extends Node2D

var timeout = false

func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not timeout:
		#load turns the string Global.Lightning into loading the scene
		#.instance brings this scene in as an instance, and you can bring in multible instances
		$Sprite/RayCast2D.add_child(load(Global.Lightning).instance())
		$Sprite/Timer.start()
		timeout = true
	
	

func _on_Timer_timeout():
	timeout = false
