extends Timer

var wait_t = 4
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	if wait_t > 1:
		wait_t -= 0.1
	set_wait_time(4)
