extends Node2D

export var starting_lives = 3
export var coins4life = 20 #how many coins for an extra life

var lives
var coins = 0

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	#print(Global.GameState)
	lives = starting_lives
	update_GUI()
	


func update_GUI():
	Global.GUI.update_GUI(coins, lives)
	
func animate_GUI(animation):
	GUI.animate_GUI(animation)

func hurt():
	lives -= 1
	Global.Player.hurt()
	animate_GUI("Hurt")
	update_GUI()
	Global.Pain_SFX.play()
	if lives < 0:
		end_game()

func coin_up():
	coins += 1
	update_GUI()
	animate_GUI("CoinPulse")
	var multiple_of_coins4life = (coins % coins4life) == 0
	if multiple_of_coins4life:
		life_up()
		
func life_up():
	lives += 1
	update_GUI()
	animate_GUI("LifePulse")

func end_game():
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn")

func win_game():
	get_tree().change_scene("res://Scenes/Levels/YouWin.tscn")

func _on_Portal_body_entered(body):
	win_game()
