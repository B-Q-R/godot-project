extends CharacterBody2D

const speed = 100
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)

func player_movement(_delta):
	# Reset velocity
	velocity = Vector2.ZERO
	
	# Get input directions
	var move_right = Input.is_action_pressed("ui_right")
	var move_left = Input.is_action_pressed("ui_left")
	var move_down = Input.is_action_pressed("ui_down")
	var move_up = Input.is_action_pressed("ui_up")
	
	# Combine input directions into a velocity vector
	if move_right:
		velocity.x += speed
	if move_left:
		velocity.x -= speed
	if move_down:
		velocity.y += speed
	if move_up:
		velocity.y -= speed
	
	# Normalize the velocity vector to prevent faster diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	# Determine the current direction for animations
	if velocity.x > 0:
		current_dir = "right"
	elif velocity.x < 0:
		current_dir = "left"
	if velocity.y > 0:
		current_dir = "down"
	elif velocity.y < 0:
		current_dir = "up"
	
	# Play animations based on movement
	play_anim(velocity.length() > 0)
	
	# Move the player
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement:
			anim.play("right_walk")
		else:
			anim.play("right_idle")
	elif dir == "left":
		anim.flip_h = true
		if movement:
			anim.play("right_walk")
		else:
			anim.play("right_idle")
	elif dir == "down":
		anim.flip_h = false
		if movement:
			anim.play("front_walk")
		else:
			anim.play("front_idle")
	elif dir == "up":
		anim.flip_h = false
		if movement:
			anim.play("back_walk")
		else:
			anim.play("back_idle")
