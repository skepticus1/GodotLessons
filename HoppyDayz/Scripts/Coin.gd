extends AnimatedSprite

var taken = false

func _on_Coin_body_entered(body):
	if not taken:
		taken = true
		Global.GameState.coin_up()
		Global.Coin_SFX.play()
		die()
		

func die():
	queue_free()