extends KinematicBody2D
# script for movement
const direction_up = Vector2(0,-1)
var motion = Vector2()
export var walk = 200
export var run = 350
var speed = 250
var air_jump = 0
export var gravity = 10
export var jump_force = -400
export var acceleration = 50


func _physics_process(delta):
	motion.y += gravity
	var friction = false

	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x + acceleration,speed)
		$Sprite.flip_h = false
		$Sprite.play('run')
		if is_on_floor():
			air_jump = 0
	#elif Input.is_action_pressed('ui_right') and Input.is_action_pressed('ui_down'):
	#	motion.x = run 
		
	elif Input.is_action_pressed('ui_left'):
		motion.x = max(motion.x - acceleration,-speed)
		$Sprite.flip_h = true
		$Sprite.play('run')
		if is_on_floor():
			air_jump = 0

	#elif Input.is_action_pressed('ui_left') and Input.is_action_pressed("ui_down"):
	#<s	motion.x = -run
	
	else:
		$Sprite.play('idle')
		friction = true
		if is_on_floor():
			air_jump = 0
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = jump_force
			air_jump = 0
		if friction == true:
			motion.x = lerp(motion.x,0,0.15)
	
	elif Input.is_action_just_pressed('ui_up') and air_jump < 1:
		motion.y = jump_force
		air_jump +=1
		if friction == true:
			motion.x = lerp(motion.x,0,0.15)
	
	else:
		if motion.y > 0:
			$Sprite.play('fall')
		else:
			$Sprite.play('jump')
		if friction == true:
			motion.x = lerp(motion.x,0,0.05)
			
	motion = move_and_slide(motion,direction_up)
	
func _input(event):
	if Input.is_key_pressed(KEY_CONTROL):
		speed = run
	else:
		speed = walk
	
	
	
	
	
	
	
	