extends Area2D

@onready var timer = $Timer

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	timer.start()
	
	# jump up
	body.velocity.y += -300
	body.velocity.x = 0
	
	body.get_node("CollisionShape2D").queue_free()
