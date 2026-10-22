extends CharacterBody2D
# player adjustments 
const SPEED = 350.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 980.0

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump 
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Left / right 
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x = -SPEED
	elif Input.is_key_pressed(KEY_RIGHT):
		velocity.x = SPEED
	else:
		velocity.x = 0

	move_and_slide()
