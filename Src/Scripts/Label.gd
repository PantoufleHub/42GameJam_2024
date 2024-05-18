extends Label

var start_time = 0.0

func _ready():
	start_time = Time.get_ticks_msec() / 1000.0

func _process(delta):
	var current_time = Time.get_ticks_msec() / 1000.0 - start_time
	var minutes = int(current_time / 60)
	var seconds = int(current_time) % 60
	var centiseconds = int((current_time - int(current_time)) * 100)
	text = "%02d:%02d.%02d" % [minutes, seconds, centiseconds]
