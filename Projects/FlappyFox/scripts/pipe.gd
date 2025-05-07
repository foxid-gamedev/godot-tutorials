extends Node2D

const SPEED = 240
const DEAD_ZONE = -700

func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	
	if position.x < DEAD_ZONE:
		queue_free()
	

func _on_score_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_score()
