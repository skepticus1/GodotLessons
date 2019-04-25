extends "res://Scripts/Characters/Character.gd"

var motion = Vector2()

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)
	
func update_motion(delta):
	walk()
	
func walk():
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		# clamp settings prevent from going faster than max speed and slower than 0
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0, MAX_SPEED)
	else:
		#lerp setting changes the motion value to 0 over the time of FRICTION value
		motion.y = lerp(motion.y, 0, FRICTION)
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		# clamp settings prevent from going faster than max speed and slower than 0
		motion.x = clamp((motion.x - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp((motion.x + SPEED), 0, MAX_SPEED)
	else:
		#lerp setting changes the motion value to 0 over the time of FRICTION value
		motion.x = lerp(motion.x, 0, FRICTION)
	
