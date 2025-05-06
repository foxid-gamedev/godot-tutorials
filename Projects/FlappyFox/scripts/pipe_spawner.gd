extends Node

const SPAWN_OFFSET_X: float = 800.0
const RANDOM_MAX_OFFSET_Y: float = 100.0

@export var PipeScene: PackedScene

func _ready() -> void:
	spawn_pipe()


func spawn_pipe() -> void:
	var pipe = PipeScene.instantiate()
	pipe.position = Vector2(
		SPAWN_OFFSET_X, 
		randf_range(-RANDOM_MAX_OFFSET_Y, RANDOM_MAX_OFFSET_Y)
	)
	add_child(pipe)


func _on_timer_timeout() -> void:
	spawn_pipe()
