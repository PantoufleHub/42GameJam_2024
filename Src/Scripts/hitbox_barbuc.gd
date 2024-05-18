extends Area2D

var truc = preload("res://Src/Scenes/MenuGameOver.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.Tier == 3:
		truc.instantiate()
		get_tree().change_scene_to_packed(truc)
