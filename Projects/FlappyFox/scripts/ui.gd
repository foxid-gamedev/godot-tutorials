class_name UI extends CanvasLayer

@onready var score_label: Label = %ScoreLabel

@onready var game_over_screen: ColorRect = %GameOverScreen
@onready var game_over_label: Label = %GameOverLabel


func update_score(value: int) -> void:
	score_label.text = str("Score: ", value)


func play_game_over_screen() -> void:
	var tween = create_tween()
	
	game_over_screen.color = Color(0,0,0,0)
	game_over_screen.visible = true
	game_over_label.scale = Vector2(0.01,0.01)
	
	tween.tween_property(game_over_screen, "color", Color("ff1c205d"), 0.5)
	tween.parallel().tween_property(game_over_label, "scale", Vector2.ONE, 0.5)
	tween.play()
