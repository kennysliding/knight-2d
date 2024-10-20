extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	# direction => -1, 0, 1
	
	if direction > 0: # moving left
		animated_sprite_2d.flip_h = false
		velocity.x = SPEED
		animated_sprite_2d.play("run")
	
	if direction < 0: # moving right
		animated_sprite_2d.flip_h = true
		velocity.x = -SPEED
		animated_sprite_2d.play("run")
		
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.play("idle")

	move_and_slide()
