extends AudioStreamPlayer2D

func _on_finished():
	get_node("/root/Level/BackgroundMusic/Track2").play()
