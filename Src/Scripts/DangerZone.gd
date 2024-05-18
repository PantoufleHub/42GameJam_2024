extends Area2D

var in_danger = 0

func _on_area_entered(area):
	in_danger = 1

func _on_area_exited(area):
	in_danger = 0
