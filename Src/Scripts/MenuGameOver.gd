extends Control

var menu = preload("res://Src/Scenes/MainMenu.tscn")
var game = preload("res://Src/Scenes/Level.tscn")

var time = "About "+str(randi_range(2, 999)) +" seconds i'd say?"
var score = randi_range(99999, 9999999)

func _ready():
	$OUIN.play()
	var text = "Score: " + str(score)
	$ScoreLabel.text = text
	$TimeLabel.text = "Time: " + time

func _on_menu_button_pressed():
	menu.instantiate()
	get_tree().change_scene_to_packed(menu)


func _on_retry_button_pressed():
	game.instantiate()
	get_tree().change_scene_to_packed(game)
