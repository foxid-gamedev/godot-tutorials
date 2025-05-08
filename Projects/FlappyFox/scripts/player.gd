class_name Player extends CharacterBody2D

const GRAVITY = 1100
const JUMP_FORCE = -500
const ROTATION_FORCE = 30
const ROTATION_MAX = -120
const ROTATION_DEFAULT = 10

signal died
signal scored

var alive: bool = true

@onready var sprite: Sprite2D = $Sprite

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	if alive:
		if Input.is_action_just_pressed(&"jump"):
			velocity.y = JUMP_FORCE
			$SoundFlap.play()
			apply_jump_rotation()
		
		if is_on_wall():
			alive = false
			$SoundDie.play()
			died.emit()
	
	move_and_slide()


func apply_jump_rotation() -> void:
	var rotation_target = max(sprite.rotation_degrees - ROTATION_FORCE, ROTATION_MAX)
	var tween = create_tween()
	
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(sprite, "rotation_degrees", rotation_target, 0.2)
	tween.tween_property(sprite, "rotation_degrees", ROTATION_DEFAULT, 0.8)
	tween.play()


func add_score() -> void:
	scored.emit()
