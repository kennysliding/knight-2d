extends Node2D

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60

enum Direction {
	LEFT = -1,
	RIGHT = 1
}

var direction: Direction = Direction.RIGHT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		print("colliding right")
		direction = Direction.LEFT
		animated_sprite_2d.flip_h = true
		
	if ray_cast_left.is_colliding():
		print("colliding left")
		direction = Direction.RIGHT
		animated_sprite_2d.flip_h = false
	
	position.x += direction * SPEED * delta
