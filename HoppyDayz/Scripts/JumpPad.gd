extends Area2D


func _on_JumpPad_body_entered(body):
	$AnimatedSprite.play("Spring")
	$Timer.start()
	Global.Player.jump_boost()


func _on_Timer_timeout():
	$AnimatedSprite.play("Idle")
