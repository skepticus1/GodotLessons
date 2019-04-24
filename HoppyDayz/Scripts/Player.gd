extends KinematicBody2D

const SPEED = 750
const GRAVITY = 2000
const UP = Vector2(0, -1)
const JUMP_SPEED = -1200
const JUMP_BOOST = 2

var motion = Vector2()

export var world_limit = 2500

func _ready():
	Global.Player = self

func _physics_process(delta):
	update_motion(delta)
	
func _process(delta):
	update_animation(motion)
	
func update_motion(delta):
	run()
	fall(delta)
	jump()
	move_and_slide(motion, UP)
		
func update_animation(motion):
	$AnimatedSprite._update(motion) #AnimatedSprite calls the node not the script
	
func fall(delta):
	if is_on_floor() :
		motion.y = 0
	elif is_on_ceiling() :
		# Forcing an immediate drop
		# when hitting the ceiling
		motion.y = GRAVITY * delta
	else:
		motion.y += GRAVITY * delta
		
	if position.y > world_limit:
		Global.GameState.end_game()
		
	#this allows the bunny to bounce on the jump pads.
	motion.y = clamp(motion.y, (JUMP_SPEED * JUMP_BOOST), -JUMP_SPEED)

func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED
		Global.Jump_SFX.play()
		
func jump_boost():
	motion.y = JUMP_SPEED * JUMP_BOOST
	
func run():
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
		motion.x = 0
	elif Input.is_action_pressed("ui_left") && not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right") && not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	else:
		motion.x = 0
	
func hurt():
	motion.y = JUMP_SPEED
	
	