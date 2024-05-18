extends Control

var level = load("res://Src/Scenes/Level.tscn")
@onready var credits = $CreditsButton/CreditsMenu

func _onready():
	pass

func _on_start_game_button_pressed():
	level.instantiate()
	get_tree().change_scene_to_packed(level)

func _on_credits_button_pressed():
	credits.show()
