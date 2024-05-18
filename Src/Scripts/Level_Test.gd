extends Node2D

var defeated_enemies = 0

func _process(delta):
	if (defeated_enemies >= 10):
		free()
