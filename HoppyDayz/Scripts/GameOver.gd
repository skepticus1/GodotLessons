extends Control


func _ready():
	Global.GameOver = self

func _on_TextureButton_pressed():
	get_tree().change_scene(Global.Level1)