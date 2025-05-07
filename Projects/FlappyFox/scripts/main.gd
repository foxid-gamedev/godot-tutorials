extends Node2D

@onready var player: Player = $Player
@onready var ui: UI = $UI

var score: int = 0

func _ready() -> void:
	player.scored.connect(_on_player_scored)
	player.died.connect(_on_player_died)


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed(&"restart"):
		get_tree().reload_current_scene()


func _on_player_died() -> void:
	ui.play_game_over_screen()


func _on_player_scored() -> void:
	score += 1
	ui.update_score(score)
	$SoundScore.play()
